<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\ProductoTrasladoRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProductoTrasladoRepository::class)]
#[HasLifecycleCallbacks]
class ProductoTraslado
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\OneToOne(targetEntity: Producto::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private $productoT;

    #[ORM\OneToOne(targetEntity: Certificacion::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private $certificacion;

    #[ORM\Column(type: 'string', length: 10)]
    private $cantSacos;

    #[ORM\Column(type: 'string', length: 10)]
    private $pesoBruto;

    #[ORM\Column(type: 'string', length: 5)]
    private $tara;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProductoT(): ?Producto
    {
        return $this->productoT;
    }

    public function setProductoT(Producto $productoT): self
    {
        $this->productoT = $productoT;

        return $this;
    }

    public function getCertificacion(): ?Certificacion
    {
        return $this->certificacion;
    }

    public function setCertificacion(Certificacion $certificacion): self
    {
        $this->certificacion = $certificacion;

        return $this;
    }

    public function getCantSacos(): ?string
    {
        return $this->cantSacos;
    }

    public function setCantSacos(string $cantSacos): self
    {
        $this->cantSacos = $cantSacos;

        return $this;
    }

    public function getPesoBruto(): ?string
    {
        return $this->pesoBruto;
    }

    public function setPesoBruto(string $pesoBruto): self
    {
        $this->pesoBruto = $pesoBruto;

        return $this;
    }

    public function getTara(): ?string
    {
        return $this->tara;
    }

    public function setTara(string $tara): self
    {
        $this->tara = $tara;

        return $this;
    }

    public function __toString(): string
    {
        return $this->getProductoT();
    }
}
