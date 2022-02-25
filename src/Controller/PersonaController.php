<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\Persona;
use Pidia\Apps\Demo\Form\PersonaType;
use Pidia\Apps\Demo\Repository\PersonaRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/persona')]
class PersonaController extends AbstractController
{
    #[Route('/', name: 'persona_index', methods: ['GET'])]
    public function index(PersonaRepository $personaRepository): Response
    {
        return $this->render('persona/index.html.twig', [
            'personas' => $personaRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'persona_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $persona = new Persona();
        $form = $this->createForm(PersonaType::class, $persona);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($persona);
            $entityManager->flush();

            return $this->redirectToRoute('persona_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('persona/new.html.twig', [
            'persona' => $persona,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'persona_show', methods: ['GET'])]
    public function show(Persona $persona): Response
    {
        return $this->render('persona/show.html.twig', [
            'persona' => $persona,
        ]);
    }

    #[Route('/{id}/edit', name: 'persona_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Persona $persona, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(PersonaType::class, $persona);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('persona_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('persona/edit.html.twig', [
            'persona' => $persona,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'persona_delete', methods: ['POST'])]
    public function delete(Request $request, Persona $persona, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$persona->getId(), $request->request->get('_token'))) {
            $entityManager->remove($persona);
            $entityManager->flush();
        }

        return $this->redirectToRoute('persona_index', [], Response::HTTP_SEE_OTHER);
    }
}
