<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\Lote;
use Pidia\Apps\Demo\Form\LoteType;
use Pidia\Apps\Demo\Repository\LoteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/lote')]
class LoteController extends AbstractController
{
    #[Route('/', name: 'lote_index', methods: ['GET'])]
    public function index(LoteRepository $loteRepository): Response
    {
        return $this->render('lote/index.html.twig', [
            'lotes' => $loteRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'lote_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $lote = new Lote();
        $form = $this->createForm(LoteType::class, $lote);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($lote);
            $entityManager->flush();

            return $this->redirectToRoute('lote_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('lote/new.html.twig', [
            'lote' => $lote,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'lote_show', methods: ['GET'])]
    public function show(Lote $lote): Response
    {
        return $this->render('lote/show.html.twig', [
            'lote' => $lote,
        ]);
    }

    #[Route('/{id}/edit', name: 'lote_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Lote $lote, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(LoteType::class, $lote);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('lote_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('lote/edit.html.twig', [
            'lote' => $lote,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'lote_delete', methods: ['POST'])]
    public function delete(Request $request, Lote $lote, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$lote->getId(), $request->request->get('_token'))) {
            $entityManager->remove($lote);
            $entityManager->flush();
        }

        return $this->redirectToRoute('lote_index', [], Response::HTTP_SEE_OTHER);
    }
}
