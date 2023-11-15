<?php

namespace App\Entity;

use App\Repository\ConseillerRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConseillerRepository::class)]
class Conseiller
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom_conseiller = null;

    #[ORM\Column(length: 255)]
    private ?string $prenom_conseiller = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNomConseiller(): ?string
    {
        return $this->nom_conseiller;
    }

    public function setNomConseiller(string $nom_conseiller): static
    {
        $this->nom_conseiller = $nom_conseiller;

        return $this;
    }

    public function getPrenomConseiller(): ?string
    {
        return $this->prenom_conseiller;
    }

    public function setPrenomConseiller(string $prenom_conseiller): static
    {
        $this->prenom_conseiller = $prenom_conseiller;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }
}
