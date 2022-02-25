<?php

namespace Pidia\Apps\Demo\Form;

use Doctrine\DBAL\Types\TextType;
use Pidia\Apps\Demo\Entity\Coordenadas;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CoordenadasType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('latitud', TextType::class, [
                'label' => false,
                'placeholder' => 'Latitud',
            ])
            ->add('longitud')
            ->add('altitud');
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Coordenadas::class,
        ]);
    }
}
