<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\AreaParcelaRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AreaParcelaRepository::class)]
class AreaParcela
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'decimal', precision: 5, scale: 2)]
    private $total;

    #[ORM\Column(type: 'decimal', precision: 5, scale: 2, nullable: true)]
    private $produccion;

    #[ORM\Column(type: 'decimal', precision: 5, scale: 2, nullable: true)]
    private $crecimiento;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTotal(): ?string
    {
        return $this->total;
    }

    public function setTotal(string $total): self
    {
        $this->total = $total;

        return $this;
    }

    public function getProduccion(): ?string
    {
        return $this->produccion;
    }

    public function setProduccion(?string $produccion): self
    {
        $this->produccion = $produccion;

        return $this;
    }

    public function getCrecimiento(): ?string
    {
        return $this->crecimiento;
    }

    public function setCrecimiento(?string $crecimiento): self
    {
        $this->crecimiento = $crecimiento;

        return $this;
    }
}
