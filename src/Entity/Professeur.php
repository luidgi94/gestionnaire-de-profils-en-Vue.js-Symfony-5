<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Professeur
 *
 * @ORM\Entity(repositoryClass="App\Repository\ProfesseurRepository")
 * @ORM\Table(name="professeur", indexes={@ORM\Index(name="user_key", columns={"user_id"})})
 * @ORM\Entity
 */
class Professeur
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
     * @ORM\OneToOne(targetEntity=User::class, cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=true)
     */
    private $user;

    /**
     * @var string
     *
     * @ORM\Column(name="matter", type="string", length=255, nullable=false)
     */
    private $matter;

    /**
     * @ORM\ManyToMany(targetEntity=Session::class)
     * @ORM\JoinTable(name="professeur_session",
     *      joinColumns={@ORM\JoinColumn(name="professeur_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="session_id", referencedColumnName="id")}
     *      )
     */
    private $session;

    /**
     * @ORM\ManyToMany(targetEntity=Formation::class)
     * @ORM\JoinTable(name="professeur_formation",
     *      joinColumns={@ORM\JoinColumn(name="professeur_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="formation_id", referencedColumnName="id")}
     *      )
     */
    private $formation;

    /**
     * @ORM\OneToMany(targetEntity=Seance::class, mappedBy="professeur", orphanRemoval=true)
     */
    private $seances;

    public function __construct()
    {
        $this->session = new ArrayCollection();
        $this->formation = new ArrayCollection();
        $this->seances = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUser()
    {
        return $this->user;
    }

    public function setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    public function getMatter(): ?string
    {
        return $this->matter;
    }

    public function setMatter(string $matter): self
    {
        $this->matter = $matter;

        return $this;
    }

    /**
     * @return Collection|Session[]
     */
    public function getSession(): Collection
    {
        return $this->session;
    }

    public function addSession(Session $session): self
    {
        if (!$this->session->contains($session)) {
            $this->session[] = $session;
        }

        return $this;
    }

    public function removeSession(Session $session): self
    {
        if ($this->session->contains($session)) {
            $this->session->removeElement($session);
        }

        return $this;
    }

    /**
     * @return Collection|Formation[]
     */
    public function getFormation(): Collection
    {
        return $this->formation;
    }

    public function addFormation(Formation $formation): self
    {
        
        if (!$this->formation->contains($formation)) {
            $this->formation[] = $formation;
          
        }

        return $this;
    }

    public function removeFormation(Formation $formation): self
    {
        if ($this->formation->contains($formation)) {
            $this->formation->removeElement($formation);
          
        }

        return $this;
    }

    /**
     * @return Collection|Seance[]
     */
    public function getSeances(): Collection
    {
        return $this->seances;
    }

    public function addSeance(Seance $seance): self
    {
        if (!$this->seances->contains($seance)) {
            $this->seances[] = $seance;
            $seance->setProfesseur($this);
        }

        return $this;
    }

    public function removeSeance(Seance $seance): self
    {
        if ($this->seances->contains($seance)) {
            $this->seances->removeElement($seance);
            // set the owning side to null (unless already changed)
            if ($seance->getProfesseur() === $this) {
                $seance->setProfesseur(null);
            }
        }

        return $this;
    }


}
