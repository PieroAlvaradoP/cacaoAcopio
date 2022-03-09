<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\AreaParcela;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AreaParcelaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('total', TextType::class, [
                'label' => false,
                'attr' => [
                    'placeholder' => 'Total',
                ],
            ])
            ->add('produccion', TextType::class, [
                'label' => false,
                'attr' => [
                    'placeholder' => 'Producción',
                ],
            ])
            ->add('crecimiento', TextType::class, [
                'label' => false,
                'attr' => [
                    'placeholder' => 'Crecimiento',
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => AreaParcela::class,
        ]);
    }
}
