<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Placa;
use Pidia\Apps\Demo\Entity\UnidadTransporte;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UnidadTransporteType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('numEjes')
            ->add('empresaTransporte')
            ->add('tipoVehiculo')
            ->add('placas', CollectionType::class, [
                'entry_type' => PlacaType::class,
                'allow_add' => true,
                'by_reference' => true,
                'label' => 'Placas del vehículo',
                'prototype_data' => new Placa(),
                'prototype_name' => '__placas__',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => UnidadTransporte::class,
        ]);
    }
}
