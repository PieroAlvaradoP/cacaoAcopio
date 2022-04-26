<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\MotivoTraslado;
use Pidia\Apps\Demo\Form\MotivoTrasladoType;
use Pidia\Apps\Demo\Manager\MotivoTrasladoManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/motivo/traslado')]
class MotivoTrasladoController extends BaseController
{
    #[Route(path: '/', name: 'motivo_traslado_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'motivo_traslado_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, MotivoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'motivo_traslado_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('motivo_traslado/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'motivo_traslado_export', methods: ['GET'])]
    public function export(Request $request, MotivoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'motivo_traslado_index');
        $headers = [
            'nombreMotivo' => 'Motivo de Traslado',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var MotivoTraslado $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['nombreMotivo'] = $objeto->getNombreMotivo();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Motivos de Traslado');
    }

    #[Route('/new', name: 'motivo_traslado_new', methods: ['GET', 'POST'])]
    public function new(Request $request, MotivoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'motivo_traslado_index');
        $motivoTraslado = new MotivoTraslado();
        $form = $this->createForm(MotivoTrasladoType::class, $motivoTraslado);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $motivoTraslado->setPropietario($this->getUser());
            if ($manager->save($motivoTraslado)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('motivo_traslado_index');
        }

        return $this->render('motivo_traslado/new.html.twig', [
            'motivo_traslado' => $motivoTraslado,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'motivo_traslado_show', methods: ['GET'])]
    public function show(MotivoTraslado $motivoTraslado): Response
    {
        $this->denyAccess(Access::VIEW, 'motivo_traslado_index');

        return $this->render('motivo_traslado/show.html.twig', [
            'motivo_traslado' => $motivoTraslado,
        ]);
    }

    #[Route('/{id}/edit', name: 'motivo_traslado_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, MotivoTraslado $motivoTraslado, MotivoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'motivo_traslado_index');
        $form = $this->createForm(MotivoTrasladoType::class, $motivoTraslado);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($motivoTraslado)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('motivo_traslado_index', ['id' => $motivoTraslado->getId()]);
        }

        return $this->render('motivo_traslado/edit.html.twig', [
            'motivo_traslado' => $motivoTraslado,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'motivo_traslado_delete', methods: ['POST'])]
    public function delete(Request $request, MotivoTraslado $motivoTraslado, MotivoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'motivo_traslado_index');
        if ($this->isCsrfTokenValid('delete'.$motivoTraslado->getId(), $request->request->get('_token'))) {
            $motivoTraslado->changeActivo();
            if ($manager->save($motivoTraslado)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('motivo_traslado_index');
    }

    #[Route(path: '/{id}/delete', name: 'motivo_traslado_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, MotivoTraslado $motivoTraslado, MotivoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'motivo_traslado_index', $motivoTraslado);
        if ($this->isCsrfTokenValid('delete_forever'.$motivoTraslado->getId(), $request->request->get('_token'))) {
            if ($manager->remove($motivoTraslado)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('motivo_traslado_index');
    }
}
