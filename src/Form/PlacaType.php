<?php

namespace Pidia\Apps\Demo\Form;

use Doctrine\DBAL\Types\StringType;
use Doctrine\DBAL\Types\TextType;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use Pidia\Apps\Demo\Entity\Placa;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PlacaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('numPlaca')
            ->add('constanciaInscripcion')
            ->add('yearFabricacion')
            ->add('marca');
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Placa::class,
        ]);
    }
}
