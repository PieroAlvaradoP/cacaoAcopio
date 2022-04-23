<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\TipoDocumentoTramite;
use Pidia\Apps\Demo\Form\TipoDocumentoTramiteType;
use Pidia\Apps\Demo\Manager\TipoDocumentoTramiteManager;
use Pidia\Apps\Demo\Repository\TipoDocumentoTramiteRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/tipoDocumentoTramite')]
class TipoDocumentoTramiteController extends BaseController
{
    #[Route(path: '/', name: 'tipo_documento_tramite_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'tipo_documento_tramite_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, TipoDocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'tipo_documento_tramite_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('tipo_documento_tramite/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'tipo_documento_tramite_export', methods: ['GET'])]
    public function export(Request $request, TipoDocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'tipo_documento_tramite_index');
        $headers = [
            'tipo_documento_tramite' => 'Tipo de Documento Tramite',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var TipoDocumentoTramite $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['tipo_documento_tramite'] = $objeto->getTipoDocumentoTramite();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Tipos de Documentos Tramite');
    }

    #[Route('/new', name: 'tipo_documento_tramite_new', methods: ['GET|POST'])]
    public function new(Request $request, TipoDocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'tipo_documento_tramite_index');
        $tipoDocumentoTramite = new TipoDocumentoTramite();
        $form = $this->createForm(TipoDocumentoTramiteType::class, $tipoDocumentoTramite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $tipoDocumentoTramite->setPropietario($this->getUser());
            if ($manager->save($tipoDocumentoTramite)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_documento_tramite_index');
        }

        return $this->render('tipo_documento_tramite/new.html.twig', [
            'tipo_documento_tramite' => $tipoDocumentoTramite,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_documento_tramite_show', methods: ['GET'])]
    public function show(TipoDocumentoTramite $tipoDocumentoTramite): Response
    {
        $this->denyAccess(Access::VIEW, 'tipo_documento_tramite_index');

        return $this->render('tipo_documento_tramite/show.html.twig', [
            'tipo_documento_tramite' => $tipoDocumentoTramite,
        ]);
    }

    #[Route('/{id}/edit', name: 'tipo_documento_tramite_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, TipoDocumentoTramite $tipoDocumentoTramite, TipoDocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'tipo_documento_tramite_index');
        $form = $this->createForm(TipoDocumentoTramiteType::class, $tipoDocumentoTramite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($tipoDocumentoTramite)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_documento_tramite_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('tipo_documento_tramite/edit.html.twig', [
            'tipo_documento_tramite' => $tipoDocumentoTramite,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_documento_tramite_delete', methods: ['POST'])]
    public function delete(Request $request, TipoDocumentoTramite $tipoDocumentoTramite, TipoDocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'tipo_documento_tramite_index');
        if ($this->isCsrfTokenValid('delete'.$tipoDocumentoTramite->getId(), $request->request->get('_token'))) {
            $tipoDocumentoTramite->changeActivo();
            if ($manager->save($tipoDocumentoTramite)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_documento_tramite_index');
    }

    #[Route(path: '/{id}/delete', name: 'tipo_documento_tramite_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, TipoDocumentoTramite $tipoDocumentoTramite, TipoDocumentoTramiteManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'tipo_documento_tramite_index', $tipoDocumentoTramite);
        if ($this->isCsrfTokenValid('delete_forever'.$tipoDocumentoTramite->getId(), $request->request->get('_token'))) {
            if ($manager->remove($tipoDocumentoTramite)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_documento_tramite_index');
    }
}
