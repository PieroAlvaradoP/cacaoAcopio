<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\PeriodoRepository;

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

    #[ORM\ManyToMany(targetEntity: Producto::class)]
    private $producto;

    public function __construct()
    {
        $this->producto = new ArrayCollection();
        $this->fechaInicio = new \DateTime();
        $this->fechaFinal = new \DateTime();
////        $this->fechaFinal = date_date_set(\DateTime::ATOM, 2022, 12, 31);
//        $year = getdate();
////        $year = (int) date_default_timezone_get();
////        $anio = date('Y', $year[6]);
//        $anio = date('Y', (int) $year[6]);
//        $this->fechaFinal = date_date_set($date = date_create(), (int) $anio, 12, 31);
////        $this->fechaFinal = date_date_set($date = date_create(), (int) $year[], 12, 31);
    }

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

    /**
     * @return Collection<int, Producto>
     */
    public function getProducto(): Collection
    {
        return $this->producto;
    }

    public function addProducto(Producto $producto): self
    {
        if (!$this->producto->contains($producto)) {
            $this->producto[] = $producto;
        }

        return $this;
    }

    public function removeProducto(Producto $producto): self
    {
        $this->producto->removeElement($producto);

        return $this;
    }
}
