<?php

namespace App\Entity;

use App\Repository\AgenceRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AgenceRepository::class)]
class Agence
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom_agence = null;

    #[ORM\Column(length: 255)]
    private ?string $adresse_agence = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNomAgence(): ?string
    {
        return $this->nom_agence;
    }

    public function setNomAgence(string $nom_agence): static
    {
        $this->nom_agence = $nom_agence;

        return $this;
    }

    public function getAdresseAgence(): ?string
    {
        return $this->adresse_agence;
    }

    public function setAdresseAgence(string $adresse_agence): static
    {
        $this->adresse_agence = $adresse_agence;

        return $this;
    }
}
