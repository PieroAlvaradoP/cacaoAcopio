<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Coordenadas;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CoordenadasType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('latitud', TextType::class, [
                'label' => false,
                'attr' => [
                    'placeholder' => 'Latitud',
                ],
            ])
            ->add('longitud', TextType::class, [
                'label' => false,
                'attr' => [
                    'placeholder' => 'Longitud',
                ],
            ])
            ->add('altitud', TextType::class, [
                'label' => false,
                'attr' => [
                    'placeholder' => 'Altitud',
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Coordenadas::class,
        ]);
    }
}
