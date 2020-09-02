<?php

namespace App\Entity;

use App\Repository\MessageRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MessageRepository::class)
 */
class Message
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, nullable=true)
     */
    private $object;

    /**
     * @ORM\Column(type="text")
     */
    private $body;

    /**
     * @ORM\Column(type="datetime")
     */
    private $created;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $modified;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="mail_received")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user_mail_received;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="mail_sent")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user_mail_sent;

    /**
     * @ORM\Column(type="boolean")
     */
    private $viewed;

    public function getId(): ?int
    {
        return $this->id;
    }
    

    public function getObject(): ?string
    {
        return $this->object;
    }

    public function setObject(?string $object): self
    {
        $this->object = $object;

        return $this;
    }

    public function getBody(): ?string
    {
        return $this->body;
    }

    public function setBody(string $body): self
    {
        $this->body = $body;

        return $this;
    }

    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created): self
    {
        $this->created = $created;

        return $this;
    }

    public function getModified(): ?\DateTimeInterface
    {
        return $this->modified;
    }

    public function setModified(?\DateTimeInterface $modified): self
    {
        $this->modified = $modified;

        return $this;
    }

    public function getUserMailReceived(): ?User
    {
        return $this->user_mail_received;
    }

    public function setUserMailReceived(?User $user): self
    {
        $this->user_mail_received = $user;

        return $this;
    }

    public function getUserMailSent(): ?User
    {
        return $this->user_mail_sent;
    }

    public function setUserMailSent(?User $user_mail_sent): self
    {
        $this->user_mail_sent = $user_mail_sent;

        return $this;
    }

    public function getViewed(): ?bool
    {
        return $this->viewed;
    }

    public function setViewed(bool $viewed): self
    {
        $this->viewed = $viewed;

        return $this;
    }
}
