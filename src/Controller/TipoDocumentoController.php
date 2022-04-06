<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\TipoDocumento;
use Pidia\Apps\Demo\Form\TipoDocumentoType;
use Pidia\Apps\Demo\Manager\TipoDocumentoManager;
use Pidia\Apps\Demo\Repository\TipoDocumentoRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/tipoDocumento')]
class TipoDocumentoController extends BaseController
{
    #[Route(path: '/', name: 'tipo_documento_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'tipo_documento_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, TipoDocumentoManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'tipo_documento_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('tipo_documento/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'tipo_documento_export', methods: ['GET'])]
    public function export(Request $request, TipoDocumentoManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'tipo_documento_index');
        $headers = [
            'tipo_documento' => 'Tipo de Documento',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var TipoDocumento $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['tipo_documento'] = $objeto->getTipoDocumento();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Tipos de Documentos');
    }

    #[Route('/new', name: 'tipo_documento_new', methods: ['GET|POST'])]
    public function new(Request $request, TipoDocumentoManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'tipo_documento_index');
        $tipoDocumento = new TipoDocumento();
        $form = $this->createForm(tipoDocumentoType::class, $tipoDocumento);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $tipoDocumento->setPropietario($this->getUser());
            if ($manager->save($tipoDocumento)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_documento_index');
        }

        return $this->render('tipo_documento/new.html.twig', [
            'tipo_documento' => $tipoDocumento,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_documento_show', methods: ['GET'])]
    public function show(tipoDocumento $tipoDocumento): Response
    {
        $this->denyAccess(Access::VIEW, 'tipo_documento_index');

        return $this->render('tipo_documento/show.html.twig', [
            'tipo_documento' => $tipoDocumento,
        ]);
    }

    #[Route('/{id}/edit', name: 'tipo_documento_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, tipoDocumento $tipoDocumento, TipoDocumentoManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'tipo_documento_index');
        $form = $this->createForm(tipoDocumentoType::class, $tipoDocumento);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($tipoDocumento)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_documento_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('tipo_documento/edit.html.twig', [
            'tipo_documento' => $tipoDocumento,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_documento_delete', methods: ['POST'])]
    public function delete(Request $request, tipoDocumento $tipoDocumento, TipoDocumentoManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'tipo_documento_index');
        if ($this->isCsrfTokenValid('delete'.$tipoDocumento->getId(), $request->request->get('_token'))) {
            $tipoDocumento->changeActivo();
            if ($manager->save($tipoDocumento)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_documento_index');
    }

    #[Route(path: '/{id}/delete', name: 'tipo_documento_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, TipoDocumento $tipoDocumento, TipoDocumentoManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'tipo_documento_index', $tipoDocumento);
        if ($this->isCsrfTokenValid('delete_forever'.$tipoDocumento->getId(), $request->request->get('_token'))) {
            if ($manager->remove($tipoDocumento)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_documento_index');
    }
}
