<?php

namespace App\Controller;

use App\Entity\Client;
use App\Repository\ClientRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ClientController extends AbstractController
{
    #[Route('/clients/emails', name: 'app_client_emails', methods: ['GET'])]
    public function extractEmails(ClientRepository $clientRepository): Response
    {

        $clients = $clientRepository->findAll();

        $emailCount = [];
        $validEmails = [];

        foreach ($clients as $client) {
            $email = $client->getEmail(); 
            if ($email) { 
                $validEmails[] = $email; 
                if (isset($emailCount[$email])) {
                    $emailCount[$email]++;
                } else {
                    $emailCount[$email] = 1;
                }
            }
        }

        
        $duplicates = array_filter($emailCount, fn($count) => $count > 1);

        return $this->render('client/emails.html.twig', [
            'validEmails' => array_unique($validEmails), 
            'duplicates' => $duplicates, 
        ]);
    }
    #[Route('/clients', name: 'app_client_index', methods: ['GET'])]
        public function index(ClientRepository $clientRepository): Response
        {
            $clients = $clientRepository->findAll();

            return $this->render('client/index.html.twig', [
                'clients' => $clients,
            ]);
        }
}
