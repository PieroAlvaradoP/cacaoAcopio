<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Proyecciones;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProyeccionesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('periodo')
            ->add('empresa')
            ->add('tipo_cacao')
            ->add('quintales_proyectados')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Proyecciones::class,
        ]);
    }
}
