<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\Proyecciones;
use Pidia\Apps\Demo\Form\ProyeccionesType;
use Pidia\Apps\Demo\Repository\ProyeccionesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/proyecciones')]
class ProyeccionesController extends AbstractController
{
    #[Route('/', name: 'proyecciones_index', methods: ['GET'])]
    public function index(ProyeccionesRepository $proyeccionesRepository): Response
    {
        return $this->render('proyecciones/index.html.twig', [
            'proyecciones' => $proyeccionesRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'proyecciones_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $proyeccione = new Proyecciones();
        $form = $this->createForm(ProyeccionesType::class, $proyeccione);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($proyeccione);
            $entityManager->flush();

            return $this->redirectToRoute('proyecciones_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('proyecciones/new.html.twig', [
            'proyeccione' => $proyeccione,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'proyecciones_show', methods: ['GET'])]
    public function show(Proyecciones $proyeccione): Response
    {
        return $this->render('proyecciones/show.html.twig', [
            'proyeccione' => $proyeccione,
        ]);
    }

    #[Route('/{id}/edit', name: 'proyecciones_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Proyecciones $proyeccione, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ProyeccionesType::class, $proyeccione);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('proyecciones_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('proyecciones/edit.html.twig', [
            'proyeccione' => $proyeccione,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'proyecciones_delete', methods: ['POST'])]
    public function delete(Request $request, Proyecciones $proyeccione, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$proyeccione->getId(), $request->request->get('_token'))) {
            $entityManager->remove($proyeccione);
            $entityManager->flush();
        }

        return $this->redirectToRoute('proyecciones_index', [], Response::HTTP_SEE_OTHER);
    }
}
