<?php
namespace App\services;
use App\Data_Object\Data_Access_Object\ClientDAO;


class ClientService {
    private $clientDAO;


    public function __construct(ClientDAO $clientDAO) {
        $this->clientDAO = $clientDAO;
    }

    public function getClientByID($clientID) {
        return $this->clientDAO->getClientByID($clientID);
    }

    public function getListeClients() {
        $clients = $this->clientDAO->getListeClients();
        return $clients;
    }
}
?>
