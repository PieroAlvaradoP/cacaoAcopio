<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\AlmacenRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AlmacenRepository::class)]
#[HasLifecycleCallbacks]
class Almacen
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50)]
    private $tipoAlmacen;

    #[ORM\Column(type: 'string', length: 50)]
    private $nombre;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $direccion;

    #[ORM\ManyToOne(targetEntity: Empresa::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $empresa;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoAlmacen(): ?string
    {
        return $this->tipoAlmacen;
    }

    public function setTipoAlmacen(string $tipoAlmacen): self
    {
        $this->tipoAlmacen = $tipoAlmacen;

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

    public function getDireccion(): ?string
    {
        return $this->direccion;
    }

    public function setDireccion(?string $direccion): self
    {
        $this->direccion = $direccion;

        return $this;
    }

    public function getEmpresa(): ?Empresa
    {
        return $this->empresa;
    }

    public function setEmpresa(?Empresa $empresa): self
    {
        $this->empresa = $empresa;

        return $this;
    }
}
