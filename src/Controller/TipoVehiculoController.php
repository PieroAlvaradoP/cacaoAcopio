<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\TipoVehiculo;
use Pidia\Apps\Demo\Form\TipoVehiculoType;
use Pidia\Apps\Demo\Manager\TipoVehiculoManager;
use Pidia\Apps\Demo\Repository\TipoVehiculoRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/tipoVehiculo')]
class TipoVehiculoController extends BaseController
{
    #[Route(path: '/', name: 'tipo_vehiculo_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'tipo_vehiculo_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, TipoVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'tipo_vehiculo_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('tipo_vehiculo/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'tipo_vehiculo_export', methods: ['GET'])]
    public function export(Request $request, TipoVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'tipo_vehiculo_index');
        $headers = [
            'tipoVehiculo' => 'Tipo de Vehiculo',
            'siglas' => 'Siglas',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var TipoVehiculo $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['tipoVehiculo'] = $objeto->getTipoVehiculo();
            $item['siglas'] = $objeto->getSiglas();
            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Tipos de Vehiculos');
    }

    #[Route('/new', name: 'tipo_vehiculo_new', methods: ['GET|POST'])]
    public function new(Request $request, TipoVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'tipo_vehiculo_index');
        $tipoVehiculo = new TipoVehiculo();
        $form = $this->createForm(TipoVehiculoType::class, $tipoVehiculo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $tipoVehiculo->setPropietario($this->getUser());
            if ($manager->save($tipoVehiculo)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_vehiculo_index');
        }

        return $this->render('tipo_vehiculo/new.html.twig', [
            'tipoVehiculo' => $tipoVehiculo,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_vehiculo_show', methods: ['GET'])]
    public function show(TipoVehiculo $tipoVehiculo): Response
    {
        $this->denyAccess(Access::VIEW, 'tipo_vehiculo_index');

        return $this->render('tipo_vehiculo/show.html.twig', [
            'tipoVehiculo' => $tipoVehiculo,
        ]);
    }

    #[Route('/{id}/edit', name: 'tipo_vehiculo_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, TipoVehiculo $tipoVehiculo, TipoVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'tipo_vehiculo_index');
        $form = $this->createForm(TipoVehiculoType::class, $tipoVehiculo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($tipoVehiculo)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_vehiculo_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('tipo_vehiculo/edit.html.twig', [
            'tipoVehiculo' => $tipoVehiculo,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_vehiculo_delete', methods: ['POST'])]
    public function delete(Request $request, TipoVehiculo $tipoVehiculo, TipoVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'tipo_vehiculo_index');
        if ($this->isCsrfTokenValid('delete'.$tipoVehiculo->getId(), $request->request->get('_token'))) {
            $tipoVehiculo->changeActivo();
            if ($manager->save($tipoVehiculo)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_vehiculo_index');
    }

    #[Route(path: '/{id}/delete', name: 'tipo_vehiculo_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, TipoVehiculo $tipoVehiculo, TipoVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'tipo_vehiculo_index', $tipoVehiculo);
        if ($this->isCsrfTokenValid('delete_forever'.$tipoVehiculo->getId(), $request->request->get('_token'))) {
            if ($manager->remove($tipoVehiculo)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_vehiculo_index');
    }
}
