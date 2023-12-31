<?php

namespace App\Controller;

use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Client;
use App\services\ClientService ;
class ClientController extends AbstractController
{
    #[Route('/client', name: 'app_client')]
    public function getAllClients(ManagerRegistry $managerRegistry): Response
    {
        $entityManager = $managerRegistry->getManager();
        $clients = $entityManager->getRepository(Client::class)->findAll();
        return $this->render('client/index.html.twig', [
            'clients' => $clients,
        ]);
    }


    #[Route('/client/{id}', name: 'client_details')]
    public function showClientDetails(int $id,ManagerRegistry $managerRegistry): Response
    {
        $entityManager = $managerRegistry->getManager();
        $clients = $entityManager->getRepository(Client::class)
        ->createQueryBuilder('c')
        ->where('c.id = :id')
        ->setParameter('id', $id)
        ->getQuery()
        ->getOneOrNullResult();

        if (!$clients) {
            throw $this->createNotFoundException('Client not found');
        }
        dump($clients); // Check this dump statement in the Symfony Profiler or your browser console


        return $this->render('client/details.html.twig', [
            'clients' => $clients,
        ]);
    }

    

    #[Route('/clientDO', name: 'app_home')]
    public function listClients(ClientService $clientService): Response
    {
        $clients = $clientService->getListeClients(); // Use the injected parameter $clientService

        // You can use Symfony's rendering capabilities (Twig) for better template management
        return $this->render('client/detailsDO.html.twig', [
            'clients' => $clients,
        ]);
    }
}
