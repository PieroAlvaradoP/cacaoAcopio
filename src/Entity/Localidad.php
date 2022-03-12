<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\LocalidadRepository;

#[ORM\Entity(repositoryClass: LocalidadRepository::class)]
#[HasLifecycleCallbacks]
class Localidad
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: Localidad::class)]
    private $padre;

    #[ORM\Column(type: 'string', length: 100)]
    private $nombre;

    #[ORM\Column(type: 'string', length: 6, nullable: true)]
    private $codigo;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPadre(): ?self
    {
        return $this->padre;
    }

    public function setPadre(?self $padre): self
    {
        $this->padre = $padre;

        return $this;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getCodigo(): ?string
    {
        return $this->codigo;
    }

    public function setCodigo(?string $codigo): self
    {
        $this->codigo = $codigo;

        return $this;
    }


    public function __toString(): string
    {
        $completo = $this->getNombre();
        $padre = $this->getPadre();
        while ($padre && $padre->getPadre()) {
            $completo = $padre->getNombre().' - '.$completo;
            $padre = $padre->getPadre();
        }

        return $completo;
    }
}
