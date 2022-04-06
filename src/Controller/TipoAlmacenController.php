<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\TipoAlmacen;
use Pidia\Apps\Demo\Form\TipoAlmacenType;
use Pidia\Apps\Demo\Manager\TipoAlmacenManager;
use Pidia\Apps\Demo\Repository\TipoAlmacenRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/tipoAlmacen')]
class TipoAlmacenController extends BaseController
{
    #[Route(path: '/', name: 'tipo_almacen_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'tipo_almacen_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, TipoAlmacenManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'tipo_almacen_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('tipo_almacen/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'tipo_almacen_export', methods: ['GET'])]
    public function export(Request $request, TipoAlmacenManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'tipo_almacen_index');
        $headers = [
            'tipo_almacen' => 'Tipo de Almacen',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var TipoAlmacen $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['tipo_almacen'] = $objeto->getTipoAlmacen();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Tipos de Almacen');
    }

    #[Route('/new', name: 'tipo_almacen_new', methods: ['GET|POST'])]
    public function new(Request $request, TipoAlmacenManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'tipo_almacen_index');
        $tipoAlmacen = new TipoAlmacen();
        $form = $this->createForm(TipoAlmacenType::class, $tipoAlmacen);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $tipoAlmacen->setPropietario($this->getUser());
            if ($manager->save($tipoAlmacen)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_almacen_index');
        }

        return $this->render('tipo_almacen/new.html.twig', [
            'tipo_almacen' => $tipoAlmacen,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_almacen_show', methods: ['GET'])]
    public function show(TipoAlmacen $tipoAlmacen): Response
    {
        $this->denyAccess(Access::VIEW, 'tipo_almacen_index');

        return $this->render('tipo_almacen/show.html.twig', [
            'tipo_almacen' => $tipoAlmacen,
        ]);
    }

    #[Route('/{id}/edit', name: 'tipo_almacen_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, TipoAlmacen $tipoAlmacen, TipoAlmacenManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'tipo_almacen_index');
        $form = $this->createForm(TipoAlmacenType::class, $tipoAlmacen);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($tipoAlmacen)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_almacen_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('tipo_almacen/edit.html.twig', [
            'tipo_almacen' => $tipoAlmacen,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_almacen_delete', methods: ['POST'])]
    public function delete(Request $request, TipoAlmacen $tipoAlmacen, TipoAlmacenManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'tipo_almacen_index');
        if ($this->isCsrfTokenValid('delete'.$tipoAlmacen->getId(), $request->request->get('_token'))) {
            $tipoAlmacen->changeActivo();
            if ($manager->save($tipoAlmacen)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_almacen_index');
    }

    #[Route(path: '/{id}/delete', name: 'tipo_almacen_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, TipoAlmacen $tipoAlmacen, TipoAlmacenManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'tipo_almacen_index', $tipoAlmacen);
        if ($this->isCsrfTokenValid('delete_forever'.$tipoAlmacen->getId(), $request->request->get('_token'))) {
            if ($manager->remove($tipoAlmacen)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_almacen_index');
    }
}
