<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\AcopioRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AcopioRepository::class)]
#[HasLifecycleCallbacks]
class Acopio
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: Periodo::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $periodo;

    #[ORM\Column(type: 'date')]
    private $fecha;

    #[ORM\ManyToOne(targetEntity: Socio::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $socio;

    #[ORM\ManyToOne(targetEntity: Certificacion::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $certificacion;

    #[ORM\ManyToOne(targetEntity: Almacen::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $almacen;

    #[ORM\Column(type: 'string', length: 6)]
    private $ticket;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private $pesoBruto;

    #[ORM\ManyToOne(targetEntity: Unidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $unidadPesoBruto;

    #[ORM\Column(type: 'string', length: 6)]
    private $cantidad;

    #[ORM\ManyToOne(targetEntity: Unidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $cantidadUnidad;

    #[ORM\Column(type: 'string', length: 10)]
    private $tara;

    #[ORM\Column(type: 'string', length: 10)]
    private $taraTotal;

    #[ORM\ManyToOne(targetEntity: Unidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $taraTotalUnidad;

    #[ORM\Column(type: 'string', length: 10)]
    private $pesoNeto;

    #[ORM\ManyToOne(targetEntity: Unidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $pesoNetoUnidad;

    #[ORM\Column(type: 'string', length: 50)]
    private $observaciones;

    public function __construct()
    {
        $this->tara = 0.25;
        $this->fecha = new \DateTime();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

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

    public function getCertificacion(): ?Certificacion
    {
        return $this->certificacion;
    }

    public function setCertificacion(?Certificacion $certificacion): self
    {
        $this->certificacion = $certificacion;

        return $this;
    }

    public function getAlmacen(): ?Almacen
    {
        return $this->almacen;
    }

    public function setAlmacen(?Almacen $almacen): self
    {
        $this->almacen = $almacen;

        return $this;
    }

    public function getTicket(): ?string
    {
        return $this->ticket;
    }

    public function setTicket(string $ticket): self
    {
        $this->ticket = $ticket;

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

    public function getUnidadPesoBruto(): ?Unidad
    {
        return $this->unidadPesoBruto;
    }

    public function setUnidadPesoBruto(?Unidad $unidadPesoBruto): self
    {
        $this->unidadPesoBruto = $unidadPesoBruto;

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

    public function getCantidadUnidad(): ?Unidad
    {
        return $this->cantidadUnidad;
    }

    public function setCantidadUnidad(?Unidad $cantidadUnidad): self
    {
        $this->cantidadUnidad = $cantidadUnidad;

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

    public function getTaraTotal(): ?string
    {
        return $this->taraTotal;
    }

    public function setTaraTotal(string $taraTotal): self
    {
        $this->taraTotal = $taraTotal;

        return $this;
    }

    public function getTaraTotalUnidad(): ?Unidad
    {
        return $this->taraTotalUnidad;
    }

    public function setTaraTotalUnidad(?Unidad $taraTotalUnidad): self
    {
        $this->taraTotalUnidad = $taraTotalUnidad;

        return $this;
    }

    public function getPesoNeto(): ?string
    {
        return $this->pesoNeto;
    }

    public function setPesoNeto(string $pesoNeto): self
    {
        $this->pesoNeto = $pesoNeto;

        return $this;
    }

    public function getPesoNetoUnidad(): ?Unidad
    {
        return $this->pesoNetoUnidad;
    }

    public function setPesoNetoUnidad(?Unidad $pesoNetoUnidad): self
    {
        $this->pesoNetoUnidad = $pesoNetoUnidad;

        return $this;
    }

    public function getObservaciones(): ?string
    {
        return $this->observaciones;
    }

    public function setObservaciones(string $observaciones): self
    {
        $this->observaciones = $observaciones;

        return $this;
    }
}
