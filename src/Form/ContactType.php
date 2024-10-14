<?php

namespace App\Form;

use App\Entity\Contact;
use App\Entity\Client;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $isEditMode = $options['edit_mode']; 
        $builder
        ->add('civilite', ChoiceType::class, [
            'choices' => [
                'Monsieur' => 'Monsieur',
                'Madame' => 'Madame',
                'Mx' => 'Mx',
            ],
            'placeholder' => 'Select Civilité', 
            'required' => true,
            'attr' => ['class' => 'form-control'], 
        ])
            ->add('nom', null, [
                'required' => true,
                'attr' => ['class' => 'form-control'],
            ])
            ->add('prenom', null, [
                'required' => true,
                'attr' => ['class' => 'form-control'],
            ])
            ->add('telephone', null, [
                'required' => true,
                'attr' => ['class' => 'form-control'],
            ])
            ->add('email', null, [
                'required' => true,
                'attr' => ['class' => 'form-control'],
            ])
            ->add('description', null, [
                'required' => true,
                'attr' => ['class' => 'form-control'],
            ])
            ->add('clients', EntityType::class, [
                'class' => Client::class,
                'choice_label' => 'raison_sociale',
                'multiple' => true,
                'expanded' => false,
                'attr' => [
                    'class' => 'form-control',
                    'style' => 'height: 150px;',
                ],
                'required' => true,
                'disabled' => $isEditMode,
                'query_builder' => function (EntityRepository $er) {
                    return $er->createQueryBuilder('c')
                        ->orderBy('c.raison_sociale', 'ASC'); 
                },
            ]);
    }

   
    
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'client_repository' => null, 
            'edit_mode' => false,
        ]);
    }
}
