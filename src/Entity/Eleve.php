<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Eleve
 * @ORM\Entity(repositoryClass="App\Repository\EleveRepository")
 * @ORM\Table(name="eleve", indexes={@ORM\Index(name="user_key", columns={"user_id"}), @ORM\Index(name="session_key", columns={"session_id"})})
 * @ORM\Entity
 */
class Eleve
{
    /**
     * @var int
     * 
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

  
    /**
     * @ORM\OneToOne(targetEntity=User::class, inversedBy="eleve", cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=true)
     */
    private $user;

    /**
     * @ORM\ManyToOne(targetEntity=Session::class, inversedBy="eleves")
     */
    private $session;

    public function getId(): ?int
    {
        return $this->id;
    }

    

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getSession(): ?Session
    {
        return $this->session;
    }

    public function setSession(?Session $session): self
    {
        $this->session = $session;

        return $this;
    }


}
