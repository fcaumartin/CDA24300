<?php

namespace App\Controller;

use App\Form\ContactFormType;
use App\Form\TestFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class TestController extends AbstractController
{
    #[Route('/test', name: 'app_test')]
    public function index(): Response
    {
        $form = $this->createForm(ContactFormType::class);


        return $this->render('test/index.html.twig', [
            'controller_name' => 'TestController',
            'form' => $form
        ]);
    }
}
