<?php

namespace App\DataFixtures;

use App\Entity\Categorie;
use App\Entity\Produit;
use App\Entity\SousCategorie;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $c1 = new Categorie();
        $c1->setNom("Guitares");
        $c1->setImage("https://picsum.photos/200/300");
        $manager->persist($c1);
        
        $sc1 = new SousCategorie();
        $sc1->setNom("Guitares Electriques");
        // $sc1->setCategorie($c1);
        $c1->addSousCategory($sc1);
        $manager->persist($sc1);


        $sc2 = new SousCategorie();
        $sc2->setNom("Guitares Classique");
        // $sc2->setCategorie($c1);
        $c1->addSousCategory($sc2);
        $manager->persist($sc2);


        $sc3 = new SousCategorie();
        $sc3->setNom("Guitares Folk");
        // $sc3->setCategorie($c1);
        $c1->addSousCategory($sc3);
        $manager->persist($sc3);


        $p1 = new Produit();
        $p1->setNom("Guitare qui brille");
        $p1->setDescription("...");
        $p1->setPrix(12.45);
        $p1->setSousCategorie($sc1);
        $manager->persist($p1);

        $p2 = new Produit();
        $p2->setNom("Guitare qui joue vite");
        $p2->setDescription("...");
        $p2->setPrix(12.45);
        $p2->setSousCategorie($sc1);
        $manager->persist($p2);

        $p3 = new Produit();
        $p3->setNom("Guitare qui joue fort");
        $p3->setDescription("...");
        $p3->setPrix(12.45);
        $p3->setSousCategorie($sc1);
        $manager->persist($p3);



        $c2 = new Categorie();
        $c2->setNom("Claviers");
        $c2->setImage("https://picsum.photos/200/300");
        $manager->persist($c2);

        $c3 = new Categorie();
        $c3->setNom("3333333");
        $c3->setImage("https://picsum.photos/200/300");
        $manager->persist($c3);

        $c4 = new Categorie();
        $c4->setNom("444444");
        $c4->setImage("https://picsum.photos/200/300");
        $manager->persist($c4);

        $c5 = new Categorie();
        $c5->setNom("555555");
        $c5->setImage("https://picsum.photos/200/300");
        $manager->persist($c5);

        $c6 = new Categorie();
        $c6->setNom("666666");
        $c6->setImage("https://picsum.photos/200/300");
        $manager->persist($c6);

        $c7 = new Categorie();
        $c7->setNom("7777777");
        $c7->setImage("https://picsum.photos/200/300");
        $manager->persist($c7);

        $manager->flush();
    }
}
