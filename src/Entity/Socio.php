<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\SocioRepository;

#[ORM\Entity(repositoryClass: SocioRepository::class)]
#[HasLifecycleCallbacks]
class Socio
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 10)]
    private $codigoSocio;

    #[ORM\ManyToOne(targetEntity: TipoPersona::class, inversedBy: 'socios')]
    #[ORM\JoinColumn(nullable: false)]
    private $tipoPersona;

    #[ORM\OneToOne(targetEntity: Persona::class, cascade: ['persist', 'remove'])]
    private $persona;

    #[ORM\ManyToOne(targetEntity: EstadoSocio::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $estadoSocio;

    #[ORM\OneToMany(mappedBy: 'socio', targetEntity: SocioPeriodo::class, orphanRemoval: true)]
    private $socioPeriodo;

    public function __construct()
    {
        $this->socioPeriodo = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getPersona()->getNombres().' '.$this->getPersona()->getApellidoPaterno();
    }

    public function getCodigoSocio(): ?string
    {
        return $this->codigoSocio;
    }

    public function setCodigoSocio(string $codigoSocio): self
    {
        $this->codigoSocio = $codigoSocio;

        return $this;
    }

    public function getTipoPersona(): ?TipoPersona
    {
        return $this->tipoPersona;
    }

    public function setTipoPersona(?TipoPersona $tipoPersona): self
    {
        $this->tipoPersona = $tipoPersona;

        return $this;
    }

    public function getPersona(): ?Persona
    {
        return $this->persona;
    }

    public function setPersona(?Persona $persona): self
    {
        $this->persona = $persona;

        return $this;
    }

    public function getEstadoSocio(): ?EstadoSocio
    {
        return $this->estadoSocio;
    }

    public function setEstadoSocio(?EstadoSocio $estadoSocio): self
    {
        $this->estadoSocio = $estadoSocio;

        return $this;
    }

    /**
     * @return Collection<int, SocioPeriodo>
     */
    public function getSocioPeriodo(): Collection
    {
        return $this->socioPeriodo;
    }

    public function addSocioPeriodo(SocioPeriodo $socioPeriodo): self
    {
        if (!$this->socioPeriodo->contains($socioPeriodo)) {
            $this->socioPeriodo[] = $socioPeriodo;
            $socioPeriodo->setSocio($this);
        }

        return $this;
    }

    public function removeSocioPeriodo(SocioPeriodo $socioPeriodo): self
    {
        if ($this->socioPeriodo->removeElement($socioPeriodo)) {
            // set the owning side to null (unless already changed)
            if ($socioPeriodo->getSocio() === $this) {
                $socioPeriodo->setSocio(null);
            }
        }

        return $this;
    }

}
