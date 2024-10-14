<?php
namespace App\Entity;

use App\Repository\ContactRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Table(name: 'contacts')]
#[ORM\Entity(repositoryClass: ContactRepository::class)]
#[UniqueEntity(fields: ['email'], message: 'This email address is already in use.')]

 
class Contact
{
    
    #[ORM\Id] 
    #[ORM\GeneratedValue] 
    #[ORM\Column(type: 'integer')] 
    private ?int $id = null; 

    #[ORM\Column(type: 'string', length: 10)]
    private string $civilite;

    #[ORM\Column(type: 'string', length: 100)]
    private string $nom; 

    #[ORM\Column(type: 'string', length: 100)]
    private string $prenom; 

    #[ORM\Column(type: 'string', length: 20, nullable: true)]
    private ?string $telephone = null; 

    
    #[Assert\Email(message: 'Please enter a valid email address.')]
    #[ORM\Column(type: 'string', length: 255, unique: true)]
    private string $email; 

    #[ORM\Column(type: 'text', nullable: true)]
    private ?string $description = null; 

    #[ORM\ManyToMany(targetEntity: Client::class, inversedBy: 'contacts')]
    #[ORM\JoinTable(
        name: 'contact_client',
        joinColumns: [
            new ORM\JoinColumn(name: 'contact_id', referencedColumnName: 'id')
        ],
        inverseJoinColumns: [
            new ORM\JoinColumn(name: 'client_id', referencedColumnName: 'id_client')
        ]
    )]
    private Collection $clients; 

    public function __construct()
    {
        $this->clients = new ArrayCollection(); 
    }
public function getClients(): Collection
{
    return $this->clients; 
}

    public function getId(): ?int
    {
        return $this->id; 
    }
   

    public function addClient(Client $client): self
    {
        if (!$this->clients->contains($client)) {
            $this->clients[] = $client;
            $client->addContact($this); 
        }

        return $this;
    }

    public function removeClient(Client $client): self
    {
        if ($this->clients->removeElement($client)) {
            $client->removeContact($this);
        }

        return $this;
    }

  

    public function getCivilite(): string
    {
        return $this->civilite;
    }

    public function setCivilite(string $civilite): self
    {
        $this->civilite = $civilite;
        return $this;
    }

    public function getNom(): string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;
        return $this;
    }

    public function getPrenom(): string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;
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

    public function getEmail(): string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;
        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;
        return $this;
    }
}
