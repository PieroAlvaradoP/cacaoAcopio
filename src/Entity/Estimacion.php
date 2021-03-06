<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\EstimacionRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EstimacionRepository::class)]
class Estimacion
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: Certificacion::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $certificacion;

    #[ORM\Column(type: 'decimal', precision: 5, scale: 2)]
    private $cantidad;

    #[ORM\ManyToOne(targetEntity: SocioPeriodo::class, inversedBy: 'estimacion')]
    #[ORM\JoinColumn(nullable: false)]
    private $socioPeriodos;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCertificacion(): ?Certificacion
    {
        return $this->certificacion;
    }

    public function setCertificacion(?Certificacion $certificacion): self
    {
        $this->certificacion = $certificacion;

        return $this;
    }

    public function getCantidad(): ?string
    {
        return $this->cantidad;
    }

    public function setCantidad(string $cantidad): self
    {
        $this->cantidad = $cantidad;

        return $this;
    }

    public function getSocio(): ?Socio
    {
        return $this->socio;
    }

    public function setSocio(?Socio $socio): self
    {
        $this->socio = $socio;

        return $this;
    }

    public function getSocioPeriodos(): ?SocioPeriodo
    {
        return $this->socioPeriodos;
    }

    public function setSocioPeriodos(?SocioPeriodo $socioPeriodos): self
    {
        $this->socioPeriodos = $socioPeriodos;

        return $this;
    }
}
