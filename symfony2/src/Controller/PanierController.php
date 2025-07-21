<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Repository\ProduitRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

final class PanierController extends AbstractController
{
    #[Route('/panier', name: 'app_panier')]
    public function index(Request $request, ProduitRepository $repo): Response
    {
        $panier_complet = [];

        $session = $request->getSession();

        $panier = $session->get('panier', []);

        foreach ($panier as $id => $quantite) {
            
            $produit = $repo->find($id);
            $panier_complet[] = [
                'produit' => $produit,
                'quantite' => $quantite
            ];

        }

        return $this->render('panier/index.html.twig', [
            'controller_name' => 'PanierController',
            'panier' => $panier_complet
        ]);
    }


    #[Route('/panier/add/{produit}', name: 'app_panier_add')]
    public function add(Produit $produit, Request $request): Response
    {
        $session = $request->getSession();

        $panier = $session->get('panier', []);

        if (isset($panier[$produit->getId()]))
            $panier[$produit->getId()]++;
        else 
            $panier[$produit->getId()] = 1;

        $session->set('panier', $panier);

        return $this->redirectToRoute('app_panier');
    }

    #[Route('/panier/del/{produit}', name: 'app_panier_del')]
    public function del(Produit $produit, Request $request): Response
    {
        $session = $request->getSession();

        $panier = $session->get('panier', []);

        if (isset($panier[$produit->getId()])) {

            $panier[$produit->getId()]--;
            if ($panier[$produit->getId()] == 0) {
                unset($panier[$produit->getId()]);
            }   
        }

        $session->set('panier', $panier);

        return $this->redirectToRoute('app_panier');
    }
}
