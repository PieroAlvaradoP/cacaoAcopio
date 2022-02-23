<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\PeriodoRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PeriodoRepository::class)]
#[HasLifecycleCallbacks]
class Periodo
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 20)]
    private $nombre;

    #[ORM\Column(type: 'string', length: 20)]
    private $alias;

    #[ORM\Column(type: 'string', length: 20)]
    private $estado;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $descripcion;

    #[ORM\Column(type: 'date')]
    private $fechaInicio;

    #[ORM\Column(type: 'date')]
    private $fechaFinal;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $productos;

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

    public function getAlias(): ?string
    {
        return $this->alias;
    }

    public function setAlias(string $alias): self
    {
        $this->alias = $alias;

        return $this;
    }

    public function getEstado(): ?string
    {
        return $this->estado;
    }

    public function setEstado(string $estado): self
    {
        $this->estado = $estado;

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

    public function getFechaInicio(): ?\DateTimeInterface
    {
        return $this->fechaInicio;
    }

    public function setFechaInicio(\DateTimeInterface $fechaInicio): self
    {
        $this->fechaInicio = $fechaInicio;

        return $this;
    }

    public function getFechaFinal(): ?\DateTimeInterface
    {
        return $this->fechaFinal;
    }

    public function setFechaFinal(\DateTimeInterface $fechaFinal): self
    {
        $this->fechaFinal = $fechaFinal;

        return $this;
    }

    public function getProductos(): ?string
    {
        return $this->productos;
    }

    public function setProductos(?string $productos): self
    {
        $this->productos = $productos;

        return $this;
    }
}
