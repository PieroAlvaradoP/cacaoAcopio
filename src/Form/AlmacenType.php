<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Almacen;
use Pidia\Apps\Demo\Entity\Localidad;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AlmacenType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('tipoAlmacen')
            ->add('nombre')
            ->add('direccion')
            ->add('empresa')
            ->add('ubicacion')
            ->add('saldo', CollectionType::class, [
                'entry_type' => SaldoType::class,
                'label' => 'Saldos',
                'allow_add' => true,
                'by_reference' => false,
                'allow_delete' => true,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Almacen::class,
        ]);
    }
}
