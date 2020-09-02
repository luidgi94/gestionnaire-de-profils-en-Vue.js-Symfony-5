<?php

namespace App\Entity;

use App\Repository\MessageJsonRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * 
 */
class MessageJson
{
    /**
     */
    private $id;

    /**
     * 
     */
    private $objet;

    /**
     * 
     */
    private $body;

    /**
     * 
     */
    private $created;

    /**
     * 
     */
    private $expediteur;

    /**
     *
     */
    private $expediteur_prenom;

    /**
     * 
     */
    private $expediteur_nom;

    /**
     * 
     */
    private $expediteur_avatar;

    /**
     * 
     */
    private $viewed;

    /**
     * 
     */
    private $destinataire;

    /**
     * 
     */
    private $destinataire_prenom;

    /**
     * 
     */
    private $destinataire_nom;

    /**
     * 
     */
    private $destinataire_avatar;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id)
    {
        $this->id = $id;
     
    }


    public function getObjet(): ?string
    {
        return $this->objet;
    }

    public function setObjet(?string $objet): self
    {
        $this->objet = $objet;

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

    public function getExpediteur(): ?int
    {
        return $this->expediteur;
    }

    public function setExpediteur(int $expediteur): self
    {
        $this->expediteur = $expediteur;

        return $this;
    }

    public function getExpediteurPrenom(): ?string
    {
        return $this->expediteur_prenom;
    }

    public function setExpediteurPrenom(string $expediteur_prenom): self
    {
        $this->expediteur_prenom = $expediteur_prenom;

        return $this;
    }

    public function getExpediteurNom(): ?string
    {
        return $this->expediteur_nom;
    }

    public function setExpediteurNom(string $expediteur_nom): self
    {
        $this->expediteur_nom = $expediteur_nom;

        return $this;
    }

    public function getExpediteurAvatar(): ?string
    {
        return $this->expediteur_avatar;
    }

    public function setExpediteurAvatar(?string $expediteur_avatar): self
    {
        $this->expediteur_avatar = $expediteur_avatar;

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

    public function getDestinataire(): ?int
    {
        return $this->destinataire;
    }

    public function setDestinataire(int $destinataire): self
    {
        $this->destinataire = $destinataire;

        return $this;
    }

    public function getDestinatairePrenom(): ?string
    {
        return $this->destinataire_prenom;
    }

    public function setDestinatairePrenom(string $destinataire_prenom): self
    {
        $this->destinataire_prenom = $destinataire_prenom;

        return $this;
    }

    public function getDestinataireNom(): ?string
    {
        return $this->destinataire_nom;
    }

    public function setDestinataireNom(string $destinataire_nom): self
    {
        $this->destinataire_nom = $destinataire_nom;

        return $this;
    }

    public function getDestinataireAvatar(): ?string
    {
        return $this->destinataire_avatar;
    }

    public function setDestinataireAvatar(?string $destinataire_avatar): self
    {
        $this->destinataire_avatar = $destinataire_avatar;

        return $this;
    }
}
