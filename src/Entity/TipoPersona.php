<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Pidia\Apps\Demo\Repository\TipoPersonaRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TipoPersonaRepository::class)]
class TipoPersona
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 9)]
    private $tipoPersona;

    #[ORM\OneToMany(mappedBy: 'tipoPersona', targetEntity: Socio::class)]
    private $socios;

    public function __construct()
    {
        $this->socios = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoPersona(): ?string
    {
        return $this->tipoPersona;
    }

    public function setTipoPersona(string $tipoPersona): self
    {
        $this->tipoPersona = $tipoPersona;

        return $this;
    }

    /**
     * @return Collection<int, Socio>
     */
    public function getSocios(): Collection
    {
        return $this->socios;
    }

    public function addSocio(Socio $socio): self
    {
        if (!$this->socios->contains($socio)) {
            $this->socios[] = $socio;
            $socio->setTipoPersona($this);
        }

        return $this;
    }

    public function removeSocio(Socio $socio): self
    {
        if ($this->socios->removeElement($socio)) {
            // set the owning side to null (unless already changed)
            if ($socio->getTipoPersona() === $this) {
                $socio->setTipoPersona(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getTipoPersona();
    }
}
