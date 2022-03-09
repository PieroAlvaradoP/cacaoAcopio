<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Acopio;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AcopioType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fecha', DateType::class, [
                'widget' => 'single_text',
                'required' => false,
                'html5' => false,
            ])
            ->add('ticket')
            ->add('pesoBruto')
            ->add('cantidad')
            ->add('tara')
            ->add('taraTotal')
            ->add('pesoNeto')
            ->add('observaciones')
            ->add('periodo')
            ->add('socio')
            ->add('certificacion')
            ->add('almacen')
            ->add('unidadPesoBruto')
            ->add('cantidadUnidad')
            ->add('taraTotalUnidad')
            ->add('pesoNetoUnidad')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Acopio::class,
        ]);
    }
}
