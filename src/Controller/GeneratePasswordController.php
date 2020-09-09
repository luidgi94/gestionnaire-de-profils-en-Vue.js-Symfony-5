<?php

/*
 * 
 */

declare(strict_types=1);

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

use App\Service\SerializeService;


class GeneratePasswordController extends AbstractController
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