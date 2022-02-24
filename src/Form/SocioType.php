<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Socio;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SocioType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('codigoSocio')
            ->add('tipoPersona')
            ->add('persona', PersonaType::class)
            ->add('estadoSocio')
            ->add('socioPeriodo', CollectionType::class, [
                'entry_type' => SocioPeriodoType::class,
                'allow_add' => true,
                'by_reference' => false,
                'allow_delete' => true,
                'required' => false,
                'label' => 'Periodos del socio',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Socio::class,
        ]);
    }
}
