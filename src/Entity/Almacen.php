<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\AlmacenRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AlmacenRepository::class)]
#[HasLifecycleCallbacks]
class Almacen
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50)]
    private $nombre;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $direccion;

    #[ORM\ManyToOne(targetEntity: Empresa::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $empresa;

    #[ORM\ManyToOne(targetEntity: TipoAlmacen::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $tipoAlmacen;

    #[ORM\ManyToOne(targetEntity: Localidad::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $ubicacion;

    #[ORM\OneToMany(mappedBy: 'almacen', targetEntity: Saldo::class, cascade: ['persist', 'remove']), ]
    private $saldo;

    public function __construct()
    {
        $this->saldo = new ArrayCollection();
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

    public function getDireccion(): ?string
    {
        return $this->direccion;
    }

    public function setDireccion(?string $direccion): self
    {
        $this->direccion = $direccion;

        return $this;
    }

    public function getEmpresa(): ?Empresa
    {
        return $this->empresa;
    }

    public function setEmpresa(?Empresa $empresa): self
    {
        $this->empresa = $empresa;

        return $this;
    }

    public function getTipoAlmacen(): ?TipoAlmacen
    {
        return $this->tipoAlmacen;
    }

    public function setTipoAlmacen(?TipoAlmacen $tipoAlmacen): self
    {
        $this->tipoAlmacen = $tipoAlmacen;

        return $this;
    }

    public function getUbicacion(): ?Localidad
    {
        return $this->ubicacion;
    }

    public function setUbicacion(?Localidad $ubicacion): self
    {
        $this->ubicacion = $ubicacion;

        return $this;
    }

    /**
     * @return Collection<int, Saldo>
     */
    public function getSaldo(): Collection
    {
        return $this->saldo;
    }

    public function addSaldo(Saldo $saldo): self
    {
        if (!$this->saldo->contains($saldo)) {
            $this->saldo[] = $saldo;
            $saldo->setAlmacen($this);
        }

        return $this;
    }

    public function removeSaldo(Saldo $saldo): self
    {
        if ($this->saldo->removeElement($saldo)) {
            // set the owning side to null (unless already changed)
            if ($saldo->getAlmacen() === $this) {
                $saldo->setAlmacen(null);
            }
        }

        return $this;
    }

}
