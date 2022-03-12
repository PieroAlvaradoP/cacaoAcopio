<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\AnalisisFisicoRepository;

#[ORM\Entity(repositoryClass: AnalisisFisicoRepository::class)]
#[HasLifecycleCallbacks]
class AnalisisFisico
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

    #[ORM\Column(type: 'string', length: 20, nullable: true)]
    private $ticket;

    #[ORM\Column(type: 'string', length: 20, nullable: true)]
    private $muestra;

    #[ORM\Column(type: 'string', length: 3)]
    private $exportable;

    #[ORM\Column(type: 'string', length: 3)]
    private $humedad;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private $exportablePorcentaje;

    #[ORM\ManyToOne(targetEntity: Certificacion::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $certificacion;

    public function __construct()
    {
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

    public function getTicket(): ?string
    {
        return $this->ticket;
    }

    public function setTicket(?string $ticket): self
    {
        $this->ticket = $ticket;

        return $this;
    }

    public function getMuestra(): ?string
    {
        return $this->muestra;
    }

    public function setMuestra(string $muestra): self
    {
        $this->muestra = $muestra;

        return $this;
    }

    public function getExportable(): ?string
    {
        return $this->exportable;
    }

    public function setExportable(string $exportable): self
    {
        $this->exportable = $exportable;

        return $this;
    }

    public function getHumedad(): ?string
    {
        return $this->humedad;
    }

    public function setHumedad(string $humedad): self
    {
        $this->humedad = $humedad;

        return $this;
    }

    public function getExportablePorcentaje(): ?string
    {
        return $this->exportablePorcentaje;
    }

    public function setExportablePorcentaje(string $exportablePorcentaje): self
    {
        $this->exportablePorcentaje = $exportablePorcentaje;

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
}
