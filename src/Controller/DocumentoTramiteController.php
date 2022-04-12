<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\DocumentoTramite;
use Pidia\Apps\Demo\Form\DocumentoTramiteType;
use Pidia\Apps\Demo\Repository\DocumentoTramiteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/documentoTramite')]
class DocumentoTramiteController extends AbstractController
{
    #[Route('/', name: 'app_documento_tramite_index', methods: ['GET'])]
    public function index(DocumentoTramiteRepository $documentoTramiteRepository): Response
    {
        return $this->render('documento_tramite/index.html.twig', [
            'documento_tramites' => $documentoTramiteRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_documento_tramite_new', methods: ['GET', 'POST'])]
    public function new(Request $request, DocumentoTramiteRepository $documentoTramiteRepository): Response
    {
        $documentoTramite = new DocumentoTramite();
        $form = $this->createForm(DocumentoTramiteType::class, $documentoTramite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $documentoTramiteRepository->add($documentoTramite);
            return $this->redirectToRoute('app_documento_tramite_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('documento_tramite/new.html.twig', [
            'documento_tramite' => $documentoTramite,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_documento_tramite_show', methods: ['GET'])]
    public function show(DocumentoTramite $documentoTramite): Response
    {
        return $this->render('documento_tramite/show.html.twig', [
            'documento_tramite' => $documentoTramite,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_documento_tramite_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, DocumentoTramite $documentoTramite, DocumentoTramiteRepository $documentoTramiteRepository): Response
    {
        $form = $this->createForm(DocumentoTramiteType::class, $documentoTramite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $documentoTramiteRepository->add($documentoTramite);
            return $this->redirectToRoute('app_documento_tramite_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('documento_tramite/edit.html.twig', [
            'documento_tramite' => $documentoTramite,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_documento_tramite_delete', methods: ['POST'])]
    public function delete(Request $request, DocumentoTramite $documentoTramite, DocumentoTramiteRepository $documentoTramiteRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$documentoTramite->getId(), $request->request->get('_token'))) {
            $documentoTramiteRepository->remove($documentoTramite);
        }

        return $this->redirectToRoute('app_documento_tramite_index', [], Response::HTTP_SEE_OTHER);
    }
}
