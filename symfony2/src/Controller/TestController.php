<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\TestFormType;
use App\Form\ContactFormType;
use App\Form\ProduitFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class TestController extends AbstractController
{
    #[Route('/test', name: 'app_produit_new')]
    public function new(Request $request, EntityManagerInterface $manager): Response
    {
        $produit = new Produit();
        
        $form = $this->createForm(ProduitFormType::class, $produit);
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {

            $manager->persist($produit);

            $manager->flush();

            // dd($produit);

            return $this->redirectToRoute('app_accueil');
        }
        
        return $this->render('produit/new.html.twig', [
            'controller_name' => 'AccueilController',
            'form' => $form
        ]);
    }
}
