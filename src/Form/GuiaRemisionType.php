<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\GuiaRemision;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class GuiaRemisionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fechaTraslado')
            ->add('periodo')
            ->add('almacenOrigen')
            ->add('almacenDestino')
            ->add('unidadTransporte')
            ->add('conductor')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => GuiaRemision::class,
        ]);
    }
}
