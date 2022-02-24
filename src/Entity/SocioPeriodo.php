<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Pidia\Apps\Demo\Repository\SocioPeriodosRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SocioPeriodosRepository::class)]
class SocioPeriodo
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: Periodo::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $periodo;

    #[ORM\OneToMany(mappedBy: 'socioPeriodos', targetEntity: Estimacion::class, orphanRemoval: true)]
    private $estimacion;

    #[ORM\ManyToOne(targetEntity: Socio::class, inversedBy: 'socioPeriodo')]
    #[ORM\JoinColumn(nullable: false)]
    private $socio;

    public function __construct()
    {
        $this->estimacion = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPeriodo(): ?Periodo
    {
        return $this->periodo;
    }

    public function setPeriodo(?Periodo $periodo): self
    {
        $this->periodo = $periodo;

        return $this;
    }

    /**
     * @return Collection<int, Estimacion>
     */
    public function getEstimacion(): Collection
    {
        return $this->estimacion;
    }

    public function addEstimacion(Estimacion $estimacion): self
    {
        if (!$this->estimacion->contains($estimacion)) {
            $this->estimacion[] = $estimacion;
            $estimacion->setSocioPeriodos($this);
        }

        return $this;
    }

    public function removeEstimacion(Estimacion $estimacion): self
    {
        if ($this->estimacion->removeElement($estimacion)) {
            // set the owning side to null (unless already changed)
            if ($estimacion->getSocioPeriodos() === $this) {
                $estimacion->setSocioPeriodos(null);
            }
        }

        return $this;
    }

    public function getSocio(): ?Socio
    {
        return $this->socio;
    }

    public function setSocio(?Socio $socio): self
    {
        $this->socio = $socio;

        return $this;
    }
}
