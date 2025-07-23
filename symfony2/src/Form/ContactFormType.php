<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class ContactFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('sujet', TextType::class, [
                'constraints' => [
                    new NotBlank([ 'message' => 'Quelque chose'])
                ]
            ])
            ->add('message', TextareaType::class, [ 
                'constraints' => [
                    new NotBlank([ 'message' => 'Autre chose']),
                    new Regex([ 'pattern' => "/[0-9]+/", 'message' => 'avec un chiffre !!!'])
                ]
            ])
            ->add('Envoyer', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
            'attr' => [
                'novalidate' => 'novalidate', // comment me to reactivate the html5 validation!  🚥
            ]
        ]);
    }
}
