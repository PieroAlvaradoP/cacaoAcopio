<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\SocioRepository;

#[ORM\Entity(repositoryClass: SocioRepository::class)]
#[HasLifecycleCallbacks]
class Socio
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 10)]
    private $codigoSocio;

    #[ORM\ManyToOne(targetEntity: TipoPersona::class, inversedBy: 'socios')]
    #[ORM\JoinColumn(nullable: false)]
    private $tipoPersona;

    #[ORM\OneToOne(targetEntity: Persona::class, cascade: ['persist', 'remove'])]
    private $persona;

//    #[ORM\Column(type: 'string', length: 50)]
//    private $nombre;
//
//    #[ORM\Column(type: 'string', length: 11)]
//    private $dni_ruc;
//
//    #[ORM\Column(type: 'string', length: 30)]
//    private $lugar;
//
//    #[ORM\OneToMany(mappedBy: 'socio', targetEntity: Proyecciones::class)]
//    private $proyecciones;
//
//    public function __construct()
//    {
//        $this->proyecciones = new ArrayCollection();
//    }
//
    public function getId(): ?int
    {
        return $this->id;
    }
//
//    public function getNombre(): ?string
//    {
//        return $this->nombre;
//    }
//
//    public function setNombre(string $nombre): self
//    {
//        $this->nombre = $nombre;
//
//        return $this;
//    }
//
//    public function getDniRuc(): ?string
//    {
//        return $this->dni_ruc;
//    }
//
//    public function setDniRuc(string $dni_ruc): self
//    {
//        $this->dni_ruc = $dni_ruc;
//
//        return $this;
//    }
//
//    public function getLugar(): ?string
//    {
//        return $this->lugar;
//    }
//
//    public function setLugar(string $lugar): self
//    {
//        $this->lugar = $lugar;
//
//        return $this;
//    }
//
//    /**
//     * @return Collection<int, Proyecciones>
//     */
//    public function getProyecciones(): Collection
//    {
//        return $this->proyecciones;
//    }
//
//    public function addProyeccione(Proyecciones $proyeccione): self
//    {
//        if (!$this->proyecciones->contains($proyeccione)) {
//            $this->proyecciones[] = $proyeccione;
//            $proyeccione->setSocio($this);
//        }
//
//        return $this;
//    }
//
//    public function removeProyeccione(Proyecciones $proyeccione): self
//    {
//        if ($this->proyecciones->removeElement($proyeccione)) {
//            // set the owning side to null (unless already changed)
//            if ($proyeccione->getSocio() === $this) {
//                $proyeccione->setSocio(null);
//            }
//        }
//
//        return $this;
//    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getNombre();
    }

    public function getCodigoSocio(): ?string
    {
        return $this->codigoSocio;
    }

    public function setCodigoSocio(string $codigoSocio): self
    {
        $this->codigoSocio = $codigoSocio;

        return $this;
    }

    public function getTipoPersona(): ?TipoPersona
    {
        return $this->tipoPersona;
    }

    public function setTipoPersona(?TipoPersona $tipoPersona): self
    {
        $this->tipoPersona = $tipoPersona;

        return $this;
    }

    public function getPersona(): ?Persona
    {
        return $this->persona;
    }

    public function setPersona(?Persona $persona): self
    {
        $this->persona = $persona;

        return $this;
    }

}
