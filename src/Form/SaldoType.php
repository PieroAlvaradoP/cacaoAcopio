<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Saldo;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SaldoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('saldo')
            ->add('periodo')
            ->add('producto')
            ->add('unidad')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Saldo::class,
        ]);
    }
}
