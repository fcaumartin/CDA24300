<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Entity\Produit;
use App\Entity\SousCategorie;
use App\Repository\CategorieRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class AccueilController extends AbstractController
{
    #[Route('/', name: 'app_accueil')]
    public function accueil(CategorieRepository $repo): Response
    {
        $categories = $repo->findAll();

        return $this->render('accueil/index.html.twig', [
            'controller_name' => 'AccueilController',
            "categories" => $categories
        ]);
    }

    #[Route('/categorie/{categorie}', name: 'app_categorie')]
    public function categorie(Categorie $categorie): Response
    {
        // dd($categorie);

        return $this->render('accueil/categorie.html.twig', [
            'controller_name' => 'AccueilController',
            'categorie' => $categorie
        ]);
    }

    #[Route('/produits/{sousCategorie}', name: 'app_produits')]
    public function produits(SousCategorie $sousCategorie): Response
    {

        return $this->render('accueil/produits.html.twig', [
            'controller_name' => 'AccueilController',
            'sousCategorie' => $sousCategorie
        ]);
    }

    #[Route('/produit/{produit}', name: 'app_produit')]
    public function produit(Produit $produit): Response
    {

        return $this->render('accueil/produit.html.twig', [
            'controller_name' => 'AccueilController',
            'produit' => $produit
        ]);
    }

    #[Route('/contact', name: 'app_contact')]
    public function contact(): Response
    {
        return $this->render('accueil/contact.html.twig', [
            'controller_name' => 'AccueilController',
        ]);
    }
}
