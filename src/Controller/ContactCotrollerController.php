<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Entity\Client ;
use App\Form\ContactType;
use App\Repository\ContactRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Form\FormError;

#[Route('/contact/cotroller')]
final class ContactCotrollerController extends AbstractController
{
    #[Route(name: 'app_contact_cotroller_index', methods: ['GET'])]
    public function index(ContactRepository $contactRepository): Response
    {
        return $this->render('contact_cotroller/index.html.twig', [
            'contacts' => $contactRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_contact_cotroller_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact, [
            'edit_mode' => false, 
        ]);
        $form->handleRequest($request);
    
        if ($form->isSubmitted() && $form->isValid()) {
           
            $existingContact = $entityManager->getRepository(Contact::class)->findOneBy(['email' => strtolower($contact->getEmail())]);

            if ($existingContact) {
              
                $form->get('email')->addError(new FormError('This email address is already in use.'));
    
               
                return $this->render('contact_cotroller/new.html.twig', [
                    'contact' => $contact,
                    'form' => $form,
                ]);
            }
    
            
            $entityManager->persist($contact);
    
            $selectedClients = $form->get('clients')->getData();
            foreach ($selectedClients as $client) {
                $contact->addClient($client);
                
                if ($client->getEmail() !== $contact->getEmail()) {
                    $client->setEmail($client->getEmail() . ', ' . $contact->getEmail());
                }
            }
    
            $entityManager->flush();
    
            return $this->redirectToRoute('app_contact_cotroller_index', [], Response::HTTP_SEE_OTHER);
        }
    
        return $this->render('contact_cotroller/new.html.twig', [
            'contact' => $contact,
            'form' => $form,
        ]);
    }
    
    #[Route('/{id}', name: 'app_contact_cotroller_show', methods: ['GET'])]
    public function show(Contact $contact): Response
    {
        return $this->render('contact_cotroller/show.html.twig', [
            'contact' => $contact,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_contact_cotroller_edit', methods: ['GET', 'POST'])]
public function edit(Request $request, Contact $contact, EntityManagerInterface $entityManager): Response
{
    $form = $this->createForm(ContactType::class, $contact, [
        'edit_mode' => true, 
        'client_repository' => $entityManager->getRepository(Client::class),
    ]);

    
    $originalEmail = $contact->getEmail();

    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        
        $updatedEmail = $contact->getEmail();
        
        foreach ($contact->getClients() as $client) {
          
            $clientEmails = explode(',', $client->getEmail());
            $clientEmails = array_map('trim', $clientEmails);

            $clientEmails = array_filter($clientEmails, function($email) use ($originalEmail) {
                return strtolower($email) !== strtolower($originalEmail);
            });

            if (!in_array(strtolower($updatedEmail), array_map('strtolower', $clientEmails))) {
                $clientEmails[] = $updatedEmail;
            }

            $client->setEmail(implode(', ', $clientEmails));
            $entityManager->persist($client);
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_contact_cotroller_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->render('contact_cotroller/edit.html.twig', [
        'contact' => $contact,
        'form' => $form,
    ]);
}

    
    
    
    #[Route('/{id}', name: 'app_contact_cotroller_delete', methods: ['POST'])]
    public function delete(Request $request, Contact $contact, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$contact->getId(), $request->request->get('_token'))) {
            $contactEmail = $contact->getEmail();
    
        
            foreach ($contact->getClients() as $client) {
                $clientEmails = explode(',', $client->getEmail()); 
                $clientEmails = array_map('trim', $clientEmails); 
               
                $updatedEmails = array_filter($clientEmails, function($email) use ($contactEmail) {
                    return strtolower($email) !== strtolower($contactEmail); 
                });
                
                
                $client->setEmail(implode(', ', $updatedEmails));
                $entityManager->persist($client); 
            }
    
            $entityManager->remove($contact);
            $entityManager->flush();
        }
    
        return $this->redirectToRoute('app_contact_cotroller_index', [], Response::HTTP_SEE_OTHER);
    }
    
}
