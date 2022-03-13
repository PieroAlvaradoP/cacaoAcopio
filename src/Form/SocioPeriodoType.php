<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Estimacion;
use Pidia\Apps\Demo\Entity\Parcela;
use Pidia\Apps\Demo\Entity\SocioPeriodo;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SocioPeriodoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('periodo')
            ->add('estimacion', CollectionType::class, [
            'entry_type' => EstimacionType::class,
            'label' => 'Estimaciones',
            'allow_add' => true,
            'by_reference' => false,
            'allow_delete' => true,
                'prototype_data' => new Estimacion(),
                'prototype_name' => '__estimacion__',
            ])
            ->add('parcelas', CollectionType::class, [
                'entry_type' => ParcelaType::class,
                'label' => 'Parcelas',
                'allow_add' => true,
                'by_reference' => false,
                'allow_delete' => true,
                'prototype_data' => new Parcela(),
                'prototype_name' => '__parcelas__',
            ])
            ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => SocioPeriodo::class,
        ]);
    }
}
