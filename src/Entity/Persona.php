<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Pidia\Apps\Demo\Repository\PersonaRepository;

#[ORM\Entity(repositoryClass: PersonaRepository::class)]
class Persona
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $nombres;

    #[ORM\Column(type: 'string', length: 25, nullable: true)]
    private $apellidoPaterno;

    #[ORM\Column(type: 'string', length: 25, nullable: true)]
    private $apellidoMaterno;

    #[ORM\ManyToOne(targetEntity: Sexo::class)]
    private $sexo;

    #[ORM\ManyToOne(targetEntity: TipoDocumento::class)]
    private $tipoDocumento;

    #[ORM\Column(type: 'string', length: 15, nullable: true)]
    private $numDocumento;

    #[ORM\Column(type: 'string', length: 12, nullable: true)]
    private $telefono;

    #[ORM\Column(type: 'date', nullable: true)]
    private $fechaNacimiento;

    #[ORM\ManyToOne(targetEntity: TipoEmpresa::class)]
    private $tipoEmpresa;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $razonSocial;

    #[ORM\Column(type: 'string', length: 100, nullable: true)]
    private $direccion;

    #[ORM\Column(type: 'string', length: 100, nullable: true)]
    private $representanteLegal;

    #[ORM\Column(type: 'string', length: 15, nullable: true)]
    private $dniRepresentante;

    #[ORM\Column(type: 'string', length: 11, nullable: true)]
    private $ruc;

    #[ORM\ManyToOne(targetEntity: EstadoRuc::class)]
    private $estadoRuc;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombres(): ?string
    {
        return $this->nombres;
    }

    public function setNombres(?string $nombres): self
    {
        $this->nombres = $nombres;

        return $this;
    }

    public function getApellidoPaterno(): ?string
    {
        return $this->apellidoPaterno;
    }

    public function setApellidoPaterno(?string $apellidoPaterno): self
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

    public function getSexo(): ?Sexo
    {
        return $this->sexo;
    }

    public function setSexo(?Sexo $sexo): self
    {
        $this->sexo = $sexo;

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

    public function setNumDocumento(?string $numDocumento): self
    {
        $this->numDocumento = $numDocumento;

        return $this;
    }

    public function getTelefono(): ?string
    {
        return $this->telefono;
    }

    public function setTelefono(?string $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }

    public function getFechaNacimiento(): ?\DateTimeInterface
    {
        return $this->fechaNacimiento;
    }

    public function setFechaNacimiento(?\DateTimeInterface $fechaNacimiento): self
    {
        $this->fechaNacimiento = $fechaNacimiento;

        return $this;
    }

    public function getRuc(): ?string
    {
        return $this->ruc;
    }

    public function setRuc(?string $ruc): self
    {
        $this->ruc = $ruc;

        return $this;
    }

    public function getEstadoRuc(): ?EstadoRuc
    {
        return $this->estadoRuc;
    }

    public function setEstadoRuc(?EstadoRuc $estadoRuc): self
    {
        $this->estadoRuc = $estadoRuc;

        return $this;
    }

    public function getTipoEmpresa(): ?TipoEmpresa
    {
        return $this->tipoEmpresa;
    }

    public function setTipoEmpresa(?TipoEmpresa $tipoEmpresa): self
    {
        $this->tipoEmpresa = $tipoEmpresa;

        return $this;
    }

    public function getRazonSocial(): ?string
    {
        return $this->razonSocial;
    }

    public function setRazonSocial(?string $razonSocial): self
    {
        $this->razonSocial = $razonSocial;

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

    public function getRepresentanteLegal(): ?string
    {
        return $this->representanteLegal;
    }

    public function setRepresentanteLegal(?string $representanteLegal): self
    {
        $this->representanteLegal = $representanteLegal;

        return $this;
    }

    public function getDniRepresentante(): ?string
    {
        return $this->dniRepresentante;
    }

    public function setDniRepresentante(?string $dniRepresentante): self
    {
        $this->dniRepresentante = $dniRepresentante;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getNombres().' '.$this->getApellidoPaterno().' '.$this->getApellidoMaterno();
    }
}
