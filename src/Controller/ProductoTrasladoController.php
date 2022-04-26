<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\ProductoTraslado;
use Pidia\Apps\Demo\Form\ProductoTrasladoType;
use Pidia\Apps\Demo\Manager\ProductoTrasladoManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/productoTraslado')]
class ProductoTrasladoController extends BaseController
{
    #[Route('/', name: 'producto_traslado_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'producto_traslado_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, ProductoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'producto_traslado_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('producto_traslado/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'producto_traslado_export', methods: ['GET'])]
    public function export(Request $request, ProductoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'producto_traslado_index');
        $headers = [
            'id' => 'Id',
            'productoT' => 'Producto',
            'certificacion' => 'Certificación',
            'cantSacos' => 'Cantidad de Sacos',
            'pesoBruto' => 'Kilos Brutos',
            'tara' => 'Tara',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var ProductoTraslado $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['id'] = $objeto->getId();
            $item['productoT'] = $objeto->getProductoT();
            $item['certificacion'] = $objeto->getCertificacion();
            $item['cantSacos'] = $objeto->getCantSacos();
            $item['pesoBruto'] = $objeto->getPesoBruto();
            $item['tara'] = $objeto->getTara();
            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Productos');
    }

    #[Route('/new', name: 'producto_traslado_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ProductoTrasladoManager $manager): Response
    {
        $productoTraslado = new ProductoTraslado();
        $form = $this->createForm(ProductoTrasladoType::class, $productoTraslado);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $productoTraslado->setPropietario($this->getUser());
            if ($manager->save($productoTraslado)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('producto_traslado_index');
        }

        return $this->render('producto_traslado/new.html.twig', [
            'producto_traslado' => $productoTraslado,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'producto_traslado_show', methods: ['GET'])]
    public function show(ProductoTraslado $productoTraslado): Response
    {
        $this->denyAccess(Access::VIEW, 'producto_traslado_index');

        return $this->render('producto_traslado/show.html.twig', [
            'producto_traslado' => $productoTraslado,
        ]);
    }

    #[Route('/{id}/edit', name: 'producto_traslado_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, ProductoTraslado $productoTraslado, ProductoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'producto_index');
        $form = $this->createForm(ProductoTrasladoType::class, $productoTraslado);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($productoTraslado)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('producto_traslado_index', ['id' => $productoTraslado->getId()]);
        }

        return $this->render('producto_traslado/edit.html.twig', [
            'producto' => $productoTraslado,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'producto_traslado_delete', methods: ['POST'])]
    public function delete(Request $request, ProductoTraslado $productoTraslado, ProductoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'producto_traslado_index');
        if ($this->isCsrfTokenValid('delete'.$productoTraslado->getId(), $request->request->get('_token'))) {
            $productoTraslado->changeActivo();
            if ($manager->save($productoTraslado)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('producto_traslado_index');
    }

    #[Route(path: '/{id}/delete', name: 'producto_traslado_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, ProductoTraslado $productoTraslado, ProductoTrasladoManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'producto_traslado_index', $productoTraslado);
        if ($this->isCsrfTokenValid('delete_forever'.$productoTraslado->getId(), $request->request->get('_token'))) {
            if ($manager->remove($productoTraslado)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('producto_traslado_index');
    }
}
