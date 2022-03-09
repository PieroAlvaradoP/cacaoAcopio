<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\BaseSocialRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: BaseSocialRepository::class)]
#[HasLifecycleCallbacks]
class BaseSocial
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50)]
    private $nombre;

    #[ORM\ManyToOne(targetEntity: Localidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $localidad;

    #[ORM\ManyToOne(targetEntity: Almacen::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $almacenAcopio;

    #[ORM\Column(type: 'text', nullable: true)]
    private $descripcion;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getLocalidad(): ?Localidad
    {
        return $this->localidad;
    }

    public function setLocalidad(?Localidad $localidad): self
    {
        $this->localidad = $localidad;

        return $this;
    }

    public function getAlmacenAcopio(): ?Almacen
    {
        return $this->almacenAcopio;
    }

    public function setAlmacenAcopio(?Almacen $almacenAcopio): self
    {
        $this->almacenAcopio = $almacenAcopio;

        return $this;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(?string $descripcion): self
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getNombre();
    }
}
