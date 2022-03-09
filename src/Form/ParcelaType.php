<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\AreaParcela;
use Pidia\Apps\Demo\Entity\Parcela;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ParcelaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre')
            ->add('sector')
            ->add('base')
            ->add('areaParcela', AreaParcelaType::class, [
                'label' => 'Area Cacao',
            ])
            ->add('coordenadas', CollectionType::class, [
                'entry_type' => CoordenadasType::class,
                'allow_add' => true,
                'by_reference' => false,
                'allow_delete' => true,
                'required' => false,
                'label' => 'Coordenadas',
            ]);

    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Parcela::class,
        ]);
    }
}
