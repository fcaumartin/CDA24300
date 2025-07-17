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


        $p1 = new Produit();
        $p1->setNom("Guitare qui brille");
        $p1->setDescription("...");
        $p1->setPrix(12.45);
        $p1->setSousCategorie($sc1);
        $manager->persist($p1);



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
