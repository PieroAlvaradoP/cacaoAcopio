<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\GuiaRemisionRepository;

#[ORM\Entity(repositoryClass: GuiaRemisionRepository::class)]
#[HasLifecycleCallbacks]
class GuiaRemision
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'date')]
    private $fechaTraslado;

    #[ORM\ManyToOne(targetEntity: Periodo::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $periodo;

    #[ORM\ManyToOne(targetEntity: Almacen::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $almacenOrigen;

    #[ORM\ManyToOne(targetEntity: Almacen::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $almacenDestino;

    #[ORM\ManyToOne(targetEntity: UnidadTransporte::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $unidadTransporte;

    #[ORM\ManyToOne(targetEntity: Conductor::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $conductor;

    #[ORM\OneToOne(targetEntity: MotivoTraslado::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private $motivoTraslado;

    #[ORM\ManyToMany(targetEntity: ProductoTraslado::class, cascade: ['persist', 'remove'], orphanRemoval: true)]
    private $producto;

    public function __construct()
    {
        $this->fechaTraslado = new \DateTime();
        $this->producto = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFechaTraslado(): ?\DateTimeInterface
    {
        return $this->fechaTraslado;
    }

    public function setFechaTraslado(\DateTimeInterface $fechaTraslado): self
    {
        $this->fechaTraslado = $fechaTraslado;

        return $this;
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

    public function getAlmacenOrigen(): ?Almacen
    {
        return $this->almacenOrigen;
    }

    public function setAlmacenOrigen(?Almacen $almacenOrigen): self
    {
        $this->almacenOrigen = $almacenOrigen;

        return $this;
    }

    public function getAlmacenDestino(): ?Almacen
    {
        return $this->almacenDestino;
    }

    public function setAlmacenDestino(?Almacen $almacenDestino): self
    {
        $this->almacenDestino = $almacenDestino;

        return $this;
    }

    public function getUnidadTransporte(): ?UnidadTransporte
    {
        return $this->unidadTransporte;
    }

    public function setUnidadTransporte(?UnidadTransporte $unidadTransporte): self
    {
        $this->unidadTransporte = $unidadTransporte;

        return $this;
    }

    public function getConductor(): ?Conductor
    {
        return $this->conductor;
    }

    public function setConductor(?Conductor $conductor): self
    {
        $this->conductor = $conductor;

        return $this;
    }

    public function getMotivoTraslado(): ?MotivoTraslado
    {
        return $this->motivoTraslado;
    }

    public function setMotivoTraslado(MotivoTraslado $motivoTraslado): self
    {
        $this->motivoTraslado = $motivoTraslado;

        return $this;
    }

    /**
     * @return Collection<int, ProductoTraslado>
     */
    public function getProducto(): Collection
    {
        return $this->producto;
    }

    public function addProducto(ProductoTraslado $producto): self
    {
        if (!$this->producto->contains($producto)) {
            $this->producto[] = $producto;
        }

        return $this;
    }

    public function removeProducto(ProductoTraslado $producto): self
    {
        $this->producto->removeElement($producto);

        return $this;
    }
}
