<?php

/*
 * 
 */

declare(strict_types=1);

namespace App\Controller;


use DateTime;
use App\Entity\User;
use App\Entity\Session;
use App\Entity\Professeur;
use App\Entity\AccountParameters;
use App\Entity\Formation;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

// Ajout Security
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use App\Service\SerializeService;

// PDF Creation 
use Dompdf\Dompdf;
use Dompdf\Options;

class GestionProfesseurController extends AbstractController
{
    private $entityManager;

    /**
     * ProjectController constructor.
     */
    public function __construct(EntityManagerInterface $entityManager ,SerializeService $serializeGenerator)
    {
        $this->entityManager = $entityManager;
        $this->serializeGenerator = $serializeGenerator; // gère tous les serialize pour Vue js
    }
    
    /**
     * @Route("/", name="gestionnaire_professeur")
     */
    public function getList()
    {
        return $this->render('gestionnaire/professeur.html.twig');
    }

     /**
     * Retourne la liste de toutes les Formations
     *
     * @Route("/getformations", name="all_Formations")
     */
    public function getAllFormations()
    {
        
        $FormationListe = $this->entityManager->getRepository(Formation::class)->findAll();
        $sessionjson = $this->serializeGenerator->serializeFormation($FormationListe);
        return new Response($sessionjson, Response::HTTP_OK);
    }


    

    /**
     * Retourne la liste de tous les sessions
     *
     * @Route("/getallsessions/directeur", name="directeur_all_sessions")
     */
    public function getAllSessionsForDirecteurProfil()
    {
        
        $sessionListe = $this->entityManager->getRepository(Session::class)->findAll();
        $sessionjson = $this->serializeGenerator->serializeSessionDirection($sessionListe);
        // dump($sessionListe);
        return new Response($sessionjson, Response::HTTP_OK);
    }

     /**
     * Retourne la liste de tous les sessions
     *
     * @Route("/getsessions", name="all_sessions")
     */
    public function getAllSessions()
    {
       
        $sessionListe = $this->entityManager->getRepository(Session::class)->findAll();
        $sessionjson = $this->serializeGenerator->serializeSession($sessionListe);
        // dump($sessionListe);
        return new Response($sessionjson, Response::HTTP_OK);
    }

     /**
     * Retourne la liste de tous les emails enregistrés dans la base de données
     *
     * @Route("/getemails", name="all_emails")
     */
    public function getAllEmails()
    {
        $usersListe = $this->entityManager->getRepository(User::class)->findAll();
        // dump($usersListe);
        $usersJson = $this->serializeGenerator->serializeMail($usersListe);
        // dump($sessionListe);
        return new Response($usersJson, Response::HTTP_OK);

    }


    /**
     * Données json de la liste de tous les enseignants.
     *
     * @Route("/superadmin/data/enseignants", name="password_liste")
     */
    public function index()
    {
        $All_users = array(); // Ca sera le tableau d'objet encodé en json contenant toute les infos de la requete
        // On veut afficher tous les professeur dans la liste du gestionnaire donc on utilise findAll()
        $professeurs = $this->entityManager->getRepository(Professeur::class)->findAll();
        foreach ($professeurs as $value) {
            $prof_user = $value->getUser();
            $All_users[]=$prof_user;

            }
        ///// RECUPERATION DES DONNEES sous forme de tableau d'objets
        $jsonUser = $this->serializeGenerator->serializeUserProfesseur($All_users);
        return new Response($jsonUser, Response::HTTP_OK);
    }
    

    public function mailer($name, \Swift_Mailer $mailer)
    {
        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('send@example.com')
            ->setTo('recipient@example.com')
            ->setBody(
                $this->renderView(
                    // templates/emails/registration.html.twig
                    'emails/registration.html.twig',
                    ['name' => $name]
                ),
                'text/html'
            )

            // you can remove the following code if you don't define a text version for your emails
            ->addPart(
                $this->renderView(
                    // templates/emails/registration.txt.twig
                    'emails/registration.txt.twig',
                    ['name' => $name]
                ),
                'text/plain'
            )
        ;
        $mailer->send($message);
    // return $this->render(...);
    }


    /**
     * Ajout d'un nouveau professeur à la liste
     *
     * @return Response_for_email_sent
     * @Route("/sendEmailConfirm/", name="email_confirm")
     */
    public function envoiEmailConfirmation(Request $request, \Swift_Mailer $mailer)
    {
        $content = json_decode($request->getContent(), true);
        if ($content['firstName']  && isset($content['email'] )){

            $name = $content['firstName'];
            // CREATION IMAGE PDF64
            $path = 'https://packref.seopowa.com/img/logo.jpg';
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data = file_get_contents($path);
            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);

            // Display the output 
            // echo $data; 

            // Configure Dompdf according to your needs
            $pdfOptions = new Options();
            $pdfOptions->set('defaultFont', 'Arial');
            
            // Instantiate Dompdf with our options
            $dompdf = new Dompdf($pdfOptions);
            
            // Retrieve the HTML generated in our twig file
            $html = $this->renderView('emails/pdf.html.twig',['name' => $name, 'imageconvertie'  =>$base64]);
            
            // Load HTML to Dompdf
            $dompdf->loadHtml($html);
            
            // (Optional) Setup the paper size and orientation 'portrait' or 'portrait'
            $dompdf->setPaper('A4', 'portrait');

            // Render the HTML as PDF
            $dompdf->render();

            // Store PDF Binary Data
            $output = $dompdf->output();

            // EMAIL DE CONFIRMATION :::
        
            $message = (new \Swift_Message('Hello Email'))
            ->setSubject('My subject')
            ->setFrom('figurinaka@gmail.com')
            ->setTo('luidgi-clairboy@live.fr')
            ->setBody(
                $this->renderView(
                    // templates/emails/registration.html.twig
                    'emails/registration.html.twig',
                    ['name' => $name,'imageconvertie' => $base64]
                ),
                'text/html'
            );
    
            // Create the attachment with your data
            $attachment = new \Swift_Attachment($output, 'my-file.pdf', 'application/pdf');
            // Attach it to the message
            $message->attach($attachment);

            $mailer->send($message);

            $response = new Response(
                'ok',
                Response::HTTP_OK,
                ['content-type' => 'application/json']
            );
            return $response;
        }

        return new Response('Error', Response::HTTP_INTERNAL_SERVER_ERROR);
    }
        





    /**
     * Ajout d'un nouveau professeur à la liste
     *
     * @return Response
     * @Route("/superadmin/data/enseignants/new", name="password_new")
     */
    public function newProfesseur(Request $request, UserPasswordEncoderInterface $encoder, \Swift_Mailer $mailer)
    {
        
        $content = json_decode($request->getContent(), true);
       
        if ($content['username'] && isset($content['password']) && isset($content['email']) && isset($content['firstName'])
            && isset($content['lastName']) && isset($content['formations']) && isset($content['sessionId']) && isset($content['datebirth'])
            ) {
           
            $newUser = new User();
            $post_date = new DateTime(); // On ajoute la date d'inscription du professeur
            $post_date->setTimezone(new \DateTimeZone('Europe/Paris')); 
            $newUser->setCreatedAt($post_date);
            $newUser->setUsername($content['username']);
            $newUser->setPassword($content['password']);

            $hash = $encoder->encodePassword($newUser, $newUser->getPassword()); // cryptage du mot de passe récupéré
            $newUser->setPassword($hash);

            $newUser->setEmail($content['email']);
            $role = array("ROLE_ADMIN", "ROLE_USER");
            $newUser->setRoles($role);
            $newUser->setNote(null);
       
            // On enregistre les données dans la table Account_Parameters
            $newParameter = new AccountParameters();
            $newParameter->setFirstName($content['firstName']);
            $newParameter->setLastName($content['lastName']);
            $birth_date = new DateTime($content['datebirth']);
            $newParameter->setDatebirth($birth_date);
            $newParameter->setGenre($content['genre']);
            // choix de l'avatar selon le genre
            if($content['genre'] = 'homme'){
                $newParameter->setAvatarFileName('profhomme.png');
            }
            else{
                $newParameter->setAvatarFileName('proffemme.png');
            }
            $newUser->setParameter($newParameter);//objet parameter enregistré dans user
    
            // On enregistre les données dans la table Professeur
            $newProfesseur= new Professeur();   
            $matter= array(); // tableau de transition
            foreach($content['formations'] as $value){
                $matter[]=$value["title"];
               }
            $infoMatter = implode(', ', (array) $matter); // crée un truc du genre "6 ème B, terminale S"   // je vais tout convertir en string en utilisant implode() doc:  https://www.c-sharpcorner.com/article/convert-php-array-to-string/
            $newProfesseur->setMatter($infoMatter);
            $newProfesseur->setUser($newUser);
             // on rajoute l'association dans user_id sur la table Professeur
            //On recherche la session associée à l'id recupéré dans Content['sessionId'] (attention de le convertir en integer car il est en string !)
            foreach( $content['sessionId'] as $sessionForm){ // attention on recoit un tableau de tableau session avec tt les infos ! pas des objets depuis le json
                $session = $this->entityManager->getRepository(Session::class)->find($sessionForm["id"]);
                $newProfesseur->addSession($session); 
                $session->addProfesseur($newProfesseur);
                $newUser->setProfesseur($newProfesseur);
            }
             //On recherche la session associée à l'id recupéré dans Content['sessionId'] (attention de le convertir en integer car il est en string !)
            foreach( $content['formations'] as $formationForm){ // attention on recoit un tableau de tableau session avec tt les infos ! pas des objets depuis le json
                $formation = $this->entityManager->getRepository(Formation::class)->find($formationForm["id"]);
                $newProfesseur->addFormation($formation); 
                $formation->addProfesseur($newProfesseur);
                $newUser->setProfesseur($newProfesseur);
            }
            
            // On envoit le tout dans la base de donnée et les relation sont faites automatiquement  : 
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($newParameter); 
            $entityManager->persist($newUser); 
            $entityManager->persist($newProfesseur);
            $entityManager->flush();

            // Serialize object into Json format
            $jsonContent = $this->serializeGenerator->serializeUserProfesseur($newUser);
            return new Response($jsonContent, Response::HTTP_OK);
        }

        return new Response('Error', Response::HTTP_INTERNAL_SERVER_ERROR);
    }


    /**
     * Modification d'un profil Professeur existant.
     *
     * @param User $id
     *
     * @return Response
     * @Route("/edit/teacher/{id}", name="edit_teacher")
     */
    public function editerProfesseur(Request $request, $id, UserPasswordEncoderInterface $encoder)
    {
    
        $editUser = $this->entityManager->getRepository(User::class)->findOneBy(['id' => $id]);

        $content = json_decode($request->getContent(), true);
            
        if ( null !== $editUser && $content['username'] && isset($content['password']) && isset($content['email']) 
            && isset($content['formations']) && isset($content['sessions']) 
            ) {
        
            $post_date = new DateTime(); // On ajoute la date d'inscription du professeur
            $post_date->setTimezone(new \DateTimeZone('Europe/Paris')); 
            $editUser->setUpdatedAt($post_date);
            $editUser->setUsername($content['username']);
            $editUser->setPassword($content['password']);
            $hash = $encoder->encodePassword($editUser, $editUser->getPassword()); // cryptage du mot de passe récupéré
            $editUser->setPassword($hash);
            $editUser->setEmail($content['email']);
            $editUser->setNote(null);

            // On enregistre les données dans la table Professeur
            
            $matter= array(); // tableau de transition
            foreach($content['formations'] as $value){
                $matter[]=$value["title"];
            }
            $infoMatter = implode(', ', (array) $matter); // crée un truc du genre "6 ème B, terminale S"   // je vais tout convertir en string en utilisant implode() doc:  https://www.c-sharpcorner.com/article/convert-php-array-to-string/
            $editUser->getProfesseur()  ->setMatter($infoMatter);
            $editUser->getProfesseur()->setUser($editUser);
            // on rajoute l'association dans user_id sur la table Professeur
            //On recherche la session associée à l'id recupéré dans Content['sessions'] (attention de le convertir en integer car il est en string !)
            
            foreach ($editUser->getProfesseur()->getSession()->getValues() as $session) {
                $editUser->getProfesseur()->removeSession($session);
                
            }
            foreach ($editUser->getProfesseur()->getFormation()->getValues() as $formation) {
                $editUser->getProfesseur()->removeFormation($formation);
            }
            foreach( $content['sessions'] as $sessionForm){ // attention on recoit un tableau de tableau session avec tt les infos ! pas des objets depuis le json
                $session = $this->entityManager->getRepository(Session::class)->find($sessionForm["id"]);
                $editUser->getProfesseur()->addSession($session); 
                $session->addProfesseur($editUser->getProfesseur());
                $editUser->setProfesseur($editUser->getProfesseur());
            }
            //On recherche la session associée à l'id recupéré dans Content['sessions'] (attention de le convertir en integer car il est en string !)
            foreach( $content['formations'] as $formationForm){ // attention on recoit un tableau de tableau session avec tt les infos ! pas des objets depuis le json
                $formation = $this->entityManager->getRepository(Formation::class)->find($formationForm["id"]);
                $editUser->getProfesseur()->addFormation($formation); 
                $formation->addProfesseur($editUser->getProfesseur());
                $editUser->setProfesseur($editUser->getProfesseur());
            }
            // On envoit le tout dans la base de données et les relation sont faites automatiquement
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($editUser); 
            $entityManager->flush();

            // Serialize object into Json format
            $jsonContent = $this->serializeGenerator->serializeUserProfesseur($editUser);
            return new Response($jsonContent, Response::HTTP_OK);
        }
        return new Response('Error', Response::HTTP_INTERNAL_SERVER_ERROR);
    }


     /**
     * Supprime un mot de passe.
     *
     * @param Professeur $id
     *
     * @return Response
     * @Route("/teacher/delete/{id}", name="teacher_delete")
     */
    public function deleteTeacher( $id)
    {
       
        $user = $this->entityManager->getRepository(User::class)->findOneBy(['id' => $id]);
        $parameter = $this->entityManager->getRepository(AccountParameters::class)->findOneBy(['id' => $user->getParameter()->getId()]);
        $professeur = $this->entityManager->getRepository(Professeur::class)->findOneBy(['id' => $user->getProfesseur()->getId()]);
        $professeur->setUser(null);
        $this->entityManager->persist($professeur); 
        $this->entityManager->flush();
        $professeur = $this->entityManager->getRepository(Professeur::class)->findOneBy(['id' => $user->getProfesseur()->getId()]);
        $this->entityManager->remove($user);// on suprime l'objet User correspondant de la table 
        $this->entityManager->remove($professeur);
        $this->entityManager->remove($parameter); // on suprime l'objet account_parameter de la table 
        $this->entityManager->flush();
        $response = new Response(
            'ok',
            Response::HTTP_OK,
            ['content-type' => 'application/json']
        );
        return $response;
    }

    
    /**
     * Génére un mot de passe aleatoire.
     *
     * @return Response
     * @Route("/motdepasse/generate", name="password_generate")
     */
    public function generatePassword()
    {
        // $chaine = 'abcdefghjkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ023456789+@!$%?&';
        $mot_de_passe = '';
        $majuscule= 'ABCDEFGHJKLMNOPQRSTUVWXYZ';
        $chaine = 'abcdefghjkmnopqrstuvwxyz';
        $special = '+!$%?-@#%^&*';
        $number = '023456789';

        $longeur_chaine = \strlen($chaine);
        $nb_caractere = 5;
        for ($i = 1; $i <= $nb_caractere; ++$i) {
            $place_aleatoire = random_int(0, ($longeur_chaine - 1));
            $mot_de_passe .= $chaine[$place_aleatoire];
        }

        $longeur_chaine = \strlen($majuscule);
        $nb_caractere = 1;
        for ($i = 1; $i <= $nb_caractere; ++$i) {
            $place_aleatoire = random_int(0, ($longeur_chaine - 1));
            $mot_de_passe .= $majuscule[$place_aleatoire];
        }

        $longeur_chaine = \strlen($special);
        $nb_caractere = 1;
        for ($i = 1; $i <= $nb_caractere; ++$i) {
            $place_aleatoire = random_int(0, ($longeur_chaine - 1));
            $mot_de_passe .= $special[$place_aleatoire];
        }

        $longeur_chaine = \strlen($number);
        $nb_caractere = 2;
        for ($i = 1; $i <= $nb_caractere; ++$i) {
            $place_aleatoire = random_int(0, ($longeur_chaine - 1));
            $mot_de_passe .= $number[$place_aleatoire];
        }

        $jsonContent = $this->serializeGenerator->serializeObject($mot_de_passe);
        return new Response($jsonContent, Response::HTTP_OK);
        // return new Response($mot_de_passe, Response::HTTP_OK);
    }

}