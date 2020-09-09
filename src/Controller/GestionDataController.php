<?php

/*
 * 
 */

declare(strict_types=1);

namespace App\Controller;

use App\Entity\User;
use App\Entity\Session;
use App\Entity\Professeur;
use App\Entity\Formation;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

use App\Service\SerializeService;



class GestionDataController extends AbstractController
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
    

    


}