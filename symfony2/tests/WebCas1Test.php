<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class WebCas1Test extends WebTestCase
{
    public function test1(): void
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/');

        $this->assertResponseIsSuccessful();
        $this->assertSelectorTextContains('a', 'Accueil');
    }

    public function test2(): void
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/');
        $this->assertResponseIsSuccessful();

        $crawler = $client->request('GET', '/panier/add/1');
        $this->assertResponseRedirects();

        $crawler = $client->request('GET', '/panier/add/1');
        $this->assertResponseRedirects();

        $crawler = $client->request('GET', '/panier');
        $this->assertResponseIsSuccessful();

        $dom = $crawler->filter(".panier");

        $this->assertEquals(count($dom), 1);

        $dom = $crawler->filter(".panier-item");

        $this->assertEquals(count($dom), 1);


        $crawler = $client->request('GET', '/panier/add/2');
        $this->assertResponseRedirects();

        $crawler = $client->request('GET', '/panier');
        $this->assertResponseIsSuccessful();

        $dom = $crawler->filter(".panier-item");
        $this->assertEquals(count($dom), 2);

    }
}
