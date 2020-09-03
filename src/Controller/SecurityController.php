<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationType;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

// RECUPERER LA SESSION 
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\Storage\NativeSessionStorage;

class SecurityController extends AbstractController
{
    // /** ok
    //  * @Route("/inscription", name="security_registration")
    //  */
    // public function registration(Request $request, EntityManagerInterface $manager, UserPasswordEncoderInterface $encoder)
    // {
    //     $user = new user();

    //     $form = $this->createForm(RegistrationType::class, $user);

    //     $form->handleRequest($request);
    //     dump($form);
        
    //     if($form->isSubmitted() && $form->isValid()) {
    //         dump($form);
    //         // $hash = $encoder->encodePassword($user, $user->getPassword());

    //         // $user->setPassword($hash);

    //         // $manager->persist($user);
    //         // $manager->flush(); 
    //     };

    //     // return $this->render('security/registration.html.twig', [
    //     //     'form' => $form->createView()
    //     // ]);

    // }

    // /**
    //  * @route("/connexion", name="security_login")
    //  */
    // public function login(AuthenticationUtils $authenticationUtils): Response
    // {
        
    //     $error = $authenticationUtils->getLastAuthenticationError();
    //     // last username entered by the user
    //     $lastUsername = $authenticationUtils->getLastUsername();
      
    
    //     if($this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN'))
    //     {
    //         return $this->redirectToRoute('interface-directeur');
    //     }
    //     else if($this->get('security.authorization_checker')->isGranted('ROLE_ADMIN'))
    //     {
    //         return $this->render('enseignant/interface.html.twig');
    //     }
        
    //     // else if($this->get('security.authorization_checker')->isGranted('ROLE_USER'))
    //     // {
    //     //     return $this->redirectToRoute('_user_panel');
    //     // }
    //     else
    //     {
    //         return $this->render('security/loginvue.html.twig', [
    //             'last_username' => $lastUsername,
    //             'error' => $error
    //         ]);
    //     }

       
    // }

    // /**
    //  *  @route("/deconnexion", name="security_logout")
    //  */
    // public function logout() {
    //     $session = new Session(new NativeSessionStorage(), new AttributeBag());
    //     $token = $session->remove('user_connected');
    //     $session->clear();
    //     $token->clear();
    //     return $this->redirectToRoute('/'); // J'ai rajouter une redirection a l'acceuil 
       
    // } 
}
