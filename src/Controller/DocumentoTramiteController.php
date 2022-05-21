<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\DocumentoTramite;
use Pidia\Apps\Demo\Form\DocumentoTramiteType;
use Pidia\Apps\Demo\Manager\DocumentoTramiteManager;
use Pidia\Apps\Demo\Repository\DocumentoTramiteRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/documentoTramite')]
class DocumentoTramiteController extends BaseController
{
    #[Route('/', name: 'documento_tramite_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'documento_tramite_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, DocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'documento_tramite_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('documento_tramite/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'documento_tramite_export', methods: ['GET'])]
    public function export(Request $request, DocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'documento_tramite_index');
        $headers = [
            'tipoDocumento' => 'Tipo de Documento',
            'serie' => 'Serie',
            'numero' => 'Numero',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var DocumentoTramite $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['tipoDocumento'] = $objeto->getTipoDocumentoTramite();
            $item['serie'] = $objeto->getSerie();
            $item['numero'] = $objeto->getNumero();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Documentos Tramite');
    }

    #[Route('/new', name: 'documento_tramite_new', methods: ['GET', 'POST'])]
    public function new(Request $request, DocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'documento_tramite_index');
        $documentoTramite = new DocumentoTramite();
        $form = $this->createForm(DocumentoTramiteType::class, $documentoTramite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $documentoTramite->setPropietario($this->getUser());
            if ($manager->save($documentoTramite)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('documento_tramite_index');
        }

        return $this->render('documento_tramite/new.html.twig', [
            'documento_tramite' => $documentoTramite,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'documento_tramite_show', methods: ['GET'])]
    public function show(DocumentoTramite $documentoTramite): Response
    {
        $this->denyAccess(Access::VIEW, 'documento_tramite_index');

        return $this->render('documento_tramite/show.html.twig', [
            'documento_tramite' => $documentoTramite,
        ]);
    }

    #[Route('/{id}/edit', name: 'documento_tramite_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, DocumentoTramite $documentoTramite, DocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'documento_tramite_index');
        $form = $this->createForm(DocumentoTramiteType::class, $documentoTramite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($documentoTramite)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('documento_tramite_index', ['id' => $documentoTramite->getId()]);
        }

        return $this->render('documento_tramite/edit.html.twig', [
            'documento_tramite' => $documentoTramite,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'documento_tramite_delete', methods: ['POST'])]
    public function delete(Request $request, DocumentoTramite $documentoTramite, DocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'documento_tramite_index');
        if ($this->isCsrfTokenValid('delete'.$documentoTramite->getId(), $request->request->get('_token'))) {
            $documentoTramite->changeActivo();
            if ($manager->save($documentoTramite)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('documento_tramite_index');
    }

    #[Route(path: '/{id}/delete', name: 'documento_tramite_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, DocumentoTramite $documentoTramite, DocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'documento_tramite_index', $documentoTramite);
        if ($this->isCsrfTokenValid('delete_forever'.$documentoTramite->getId(), $request->request->get('_token'))) {
            if ($manager->remove($documentoTramite)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('documento_tramite_index');
    }

    #[Route(path: '/documento_tramite/serie_ajax', name: 'documento_tramite_serie_numero', methods: ['POST'])]
    public function pedidoAjax(Request $request, DocumentoTramiteRepository $repository): Response
    {
        $serie = $request->request->get('serie');
        $numero = $repository->findNumero($serie);

        if (null === $numero) {
            return $this->json(['status' => false, 'message' => 'No se encontró']);
        }

        $data = [
            'numero' => $numero,
        ];

        return $this->json(['status' => true, 'data' => $data]);
    }
}
