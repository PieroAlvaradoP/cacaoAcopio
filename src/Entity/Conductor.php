<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\ConductorRepository;

#[ORM\Entity(repositoryClass: ConductorRepository::class)]
#[HasLifecycleCallbacks]
class Conductor
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 10)]
    private $licencia;

    #[ORM\Column(type: 'string', length: 100)]
    private $nombres;

    #[ORM\Column(type: 'string', length: 100)]
    private $apellidoPaterno;

    #[ORM\Column(type: 'string', length: 100, nullable: true)]
    private $apellidoMaterno;

    #[ORM\ManyToOne(targetEntity: TipoDocumento::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $tipoDocumento;

    #[ORM\Column(type: 'string', length: 13)]
    private $numDocumento;

    #[ORM\ManyToOne(targetEntity: Localidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $localidad;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLicencia(): ?string
    {
        return $this->licencia;
    }

    public function setLicencia(string $licencia): self
    {
        $this->licencia = $licencia;

        return $this;
    }

    public function getNombres(): ?string
    {
        return $this->nombres;
    }

    public function setNombres(string $nombres): self
    {
        $this->nombres = $nombres;

        return $this;
    }

    public function getApellidoPaterno(): ?string
    {
        return $this->apellidoPaterno;
    }

    public function setApellidoPaterno(string $apellidoPaterno): self
    {
        $this->apellidoPaterno = $apellidoPaterno;

        return $this;
    }

    public function getApellidoMaterno(): ?string
    {
        return $this->apellidoMaterno;
    }

    public function setApellidoMaterno(?string $apellidoMaterno): self
    {
        $this->apellidoMaterno = $apellidoMaterno;

        return $this;
    }

    public function getTipoDocumento(): ?TipoDocumento
    {
        return $this->tipoDocumento;
    }

    public function setTipoDocumento(?TipoDocumento $tipoDocumento): self
    {
        $this->tipoDocumento = $tipoDocumento;

        return $this;
    }

    public function getNumDocumento(): ?string
    {
        return $this->numDocumento;
    }

    public function setNumDocumento(string $numDocumento): self
    {
        $this->numDocumento = $numDocumento;

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

    public function __toString(): string
    {
        return $this->getNombres().' '.$this->getApellidoPaterno().' '.$this->getApellidoMaterno();
    }
}
