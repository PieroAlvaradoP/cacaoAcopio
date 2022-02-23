<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Periodo;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PeriodoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre')
            ->add('alias')
            ->add('estado')
            ->add('descripcion')
            ->add('fechaInicio')
            ->add('fechaFinal')
            ->add('productos')
            ->add('createdAt')
            ->add('updatedAt')
            ->add('activo')
            ->add('uuid')
            ->add('propietario')
            ->add('config')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Periodo::class,
        ]);
    }
}
