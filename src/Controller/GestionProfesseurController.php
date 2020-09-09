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
     * Ajout d'un nouveau professeur à la liste
     *
     * @return Response
     * @Route("/superadmin/data/enseignants/new", name="password_new")
     */
    public function addNewProfesseur(Request $request, UserPasswordEncoderInterface $encoder, \Swift_Mailer $mailer)
    {
        
        $content = json_decode($request->getContent(), true);
       
        if ($content['username'] && isset($content['password']) && isset($content['email']) && isset($content['firstName'])
            && isset($content['lastName']) && isset($content['formations']) && isset($content['sessionId']) && isset($content['datebirth'])
            ) {
           
            $newUser = new User();
            $post_date = new DateTime(); // On ajoute la date d'inscription du professeur
            // $post_date->setTimezone(new \DateTimeZone('Europe/Paris')); 
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

}