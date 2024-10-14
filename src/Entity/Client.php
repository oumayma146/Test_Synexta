<?php

namespace App\Entity;

use App\Repository\ClientRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;


#[ORM\Entity(repositoryClass: ClientRepository::class)]
#[ORM\Table(name: 'clients')] 
/**
 * @UniqueEntity(
 *     fields="email",
 *     errorPath="email",
 *     message="This email is already used.",
 *     ignoreCase=true
 * )
 */
class Client
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(name: 'id_client', type: 'integer')]
    private ?int $id_client = null;

    #[ORM\Column(type: 'string', length: 255)]
    private ?string $adresse = null;

    #[ORM\Column(type: 'string', length: 10)]
    private ?string $cp = null; 

    #[ORM\Column(type: 'string', length: 100)]
    private ?string $ville = null; 

    #[ORM\Column(type: 'string', length: 20, nullable: true)]
    private ?string $telephone = null;

    #[ORM\Column(type: 'string', length: 20, nullable: true)]
    private ?string $portable = null; 

    #[ORM\Column(type: 'string', length: 255)]
    private $email;
    
    #[ORM\Column(name: 'raison_sociale', type: 'string', length: 255)]
    private string $raison_sociale; 
  
    public function getIdClient(): ?int
    {
        return $this->id_client;
    }


    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(string $adresse): self
    {
        $this->adresse = $adresse;
        return $this;
    }

    public function getCp(): ?string
    {
        return $this->cp;
    }

    public function setCp(string $cp): self
    {
        $this->cp = $cp;
        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(string $ville): self
    {
        $this->ville = $ville;
        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->telephone;
    }

    public function setTelephone(?string $telephone): self
    {
        $this->telephone = $telephone;
        return $this;
    }

    public function getPortable(): ?string
    {
        return $this->portable;
    }

    public function setPortable(?string $portable): self
    {
        $this->portable = $portable;
        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;
        return $this;
    }


    public function getRaisonSociale(): string
    {
        return $this->raison_sociale;
    }

    public function setRaisonSociale(string $raisonSociale): self
    {
        $this->raison_sociale = $raisonSociale;
        return $this;
    }

   /**
     * @ORM\ManyToMany(targetEntity=Contact::class, mappedBy="clients")
     */
     private Collection $contacts;


     public function __construct()
     {
         $this->contacts = new ArrayCollection();
     }
        public function getContacts(): Collection {
            return $this->contacts;
        }

    public function addContact(Contact $contact): self
    {
        if (!$this->contacts->contains($contact)) {
            $this->contacts->add($contact);
            $contact->addClient($this);
        }

        return $this;
    }

    public function removeContact(Contact $contact): self
    {
        if ($this->contacts->removeElement($contact)) {
            $contact->removeClient($this);
        }

        return $this;
    }

}
