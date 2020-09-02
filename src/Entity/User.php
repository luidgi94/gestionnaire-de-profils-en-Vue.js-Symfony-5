<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $username;

    /**
     * @ORM\Column(type="array")
     */
    private $roles = [];    

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    public $confirm_password;



    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

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

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string)$this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }


/////////////////////////////////////////////

//              TIME                  /////

//////////////////////////////////////////

/**
 * @var \DateTime
 *
 * @ORM\Column(type="datetime", nullable=true)
 */
private $createdAt;

/**
 * @var \DateTime
 *
 * @ORM\Column(type="datetime", nullable=true)
 */
private $updatedAt;

/**
 * @ORM\OneToOne(targetEntity=Eleve::class, mappedBy="user", cascade={"persist", "remove"})
 */
private $eleve;

/**
 * @ORM\OneToOne(targetEntity=Professeur::class, cascade={"persist", "remove"})
 */
private $professeur;



/**
 * @ORM\OneToOne(targetEntity=AccountParameters::class, cascade={"persist", "remove"})
 * @ORM\JoinColumn(nullable=false)
 */
private $parameter;

/**
 * @ORM\OneToMany(targetEntity=Message::class, mappedBy="user_mail_received")
 */
private $mail_received;

/**
 * @ORM\OneToMany(targetEntity=Message::class, mappedBy="user_mail_sent")
 */
private $mail_sent;

/**
 * @ORM\Column(type="text", nullable=true)
 */
private $note;

public function __construct()
{
    $this->message_send = new ArrayCollection();
    $this->get_message = new ArrayCollection();
    $this->mail_received = new ArrayCollection();
    $this->mail_sent = new ArrayCollection();
}


/**
 * @return \DateTime
 */
public function getCreatedAt()
{
    return $this->createdAt;
}

/**
 * @param \DateTime $createdAt
 */
public function setCreatedAt($createdAt): void
{
    $this->createdAt = $createdAt;
}

/**
 * @return \DateTime
 */
public function getUpdatedAt()
{
    return $this->updatedAt;
}

/**
 * @param \DateTime $updatedAt
 */
public function setUpdatedAt($updatedAt): void
{
    $this->updatedAt = $updatedAt;
}

// /**


public function getEleve(): ?Eleve
{
    return $this->eleve;
}

public function setEleve(Eleve $eleve): self
{
    $this->eleve = $eleve;

    // set the owning side of the relation if necessary
    if ($eleve->getUser() !== $this) {
        $eleve->setUser($this);
    }

    return $this;
}

public function getProfesseur(): ?Professeur
{
    return $this->professeur;
}

public function setProfesseur(?Professeur $professeur): self
{
    $this->professeur = $professeur;

    return $this;
}



public function getParameter(): ?AccountParameters
{
    return $this->parameter;
}

public function setParameter(AccountParameters $parameter): self
{
    $this->parameter = $parameter;

    return $this;
}

/**
 * @return Collection|Message[]
 */
public function getMailReceived(): Collection
{
    return $this->mail_received;
}

public function addMailReceived(Message $mailReceived): self
{
    if (!$this->mail_received->contains($mailReceived)) {
        $this->mail_received[] = $mailReceived;
        $mailReceived->setUserMailReceived($this);
    }

    return $this;
}

public function removeMailReceived(Message $mailReceived): self
{
    if ($this->mail_received->contains($mailReceived)) {
        $this->mail_received->removeElement($mailReceived);
        // set the owning side to null (unless already changed)
        if ($mailReceived->getUserMailReceived() === $this) {
            $mailReceived->setUserMailReceived(null);
        }
    }

    return $this;
}

/**
 * @return Collection|Message[]
 */
public function getMailSent(): Collection
{
    return $this->mail_sent;
}

public function addMailSent(Message $mailSent): self
{
    if (!$this->mail_sent->contains($mailSent)) {
        $this->mail_sent[] = $mailSent;
        $mailSent->setUserMailSent($this);
    }

    return $this;
}

public function removeMailSent(Message $mailSent): self
{
    if ($this->mail_sent->contains($mailSent)) {
        $this->mail_sent->removeElement($mailSent);
        // set the owning side to null (unless already changed)
        if ($mailSent->getUserMailSent() === $this) {
            $mailSent->setUserMailSent(null);
        }
    }

    return $this;
}

public function getNote(): ?string
{
    return $this->note;
}

public function setNote(?string $note): self
{
    $this->note = $note;

    return $this;
}
}
