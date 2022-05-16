<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\GuiaRemision;
use Pidia\Apps\Demo\Entity\MotivoTraslado;
use Pidia\Apps\Demo\Entity\ProductoTraslado;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class GuiaRemisionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fechaTraslado', DateType::class, [
                'widget' => 'single_text',
                'required' => false,
                'html5' => false,
            ])
            ->add('periodo')
            ->add('almacenOrigen')
            ->add('almacenDestino')
            ->add('unidadTransporte')
            ->add('conductor')
            ->add('motivos', EntityType::class, [
                'class' => MotivoTraslado::class,
                'multiple' => true,
                'expanded' => true,
            ])
            ->add('producto', CollectionType::class, [
                'entry_type' => ProductoTrasladoType::class,
                'allow_add' => true,
                'allow_delete' => true,
                'by_reference' => false,
                'label' => 'Productos',
                'prototype_data' => new ProductoTraslado(),
                'prototype_name' => '__producto_traslado__',
            ]);

        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => GuiaRemision::class,
        ]);
    }
}
