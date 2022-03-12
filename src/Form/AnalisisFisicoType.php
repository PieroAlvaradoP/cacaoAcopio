<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\AnalisisFisico;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AnalisisFisicoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('periodo')
            ->add('fecha', DateType::class, [
                'widget' => 'single_text',
                'required' => false, ])
            ->add('ticket')
            ->add('certificacion')
            ->add('muestra')
            ->add('exportable')
            ->add('exportablePorcentaje')
            ->add('humedad')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => AnalisisFisico::class,
        ]);
    }
}
