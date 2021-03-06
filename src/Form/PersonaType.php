<?php

namespace Pidia\Apps\Demo\Form;

use Pidia\Apps\Demo\Entity\Persona;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PersonaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombres')
            ->add('apellidoPaterno')
            ->add('apellidoMaterno')
            ->add('sexo')
            ->add('tipoDocumento')
            ->add('numDocumento')
            ->add('telefono')
            ->add('fechaNacimiento', DateType::class, [
                'widget' => 'single_text',
                'required' => false,
                'html5' => false,
            ])
            ->add('tipoEmpresa')
            ->add('razonSocial')
            ->add('direccion')
            ->add('representanteLegal')
            ->add('dniRepresentante')
            ->add('ruc')
            ->add('estadoRuc')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Persona::class,
        ]);
    }
}
