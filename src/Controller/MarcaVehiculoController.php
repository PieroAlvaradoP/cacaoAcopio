<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\MarcaVehiculo;
use Pidia\Apps\Demo\Form\MarcaVehiculoType;
use Pidia\Apps\Demo\Manager\MarcaVehiculoManager;
use Pidia\Apps\Demo\Repository\MarcaVehiculoRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/marcaVehiculo')]
class MarcaVehiculoController extends BaseController
{
    #[Route(path: '/', name: 'marca_vehiculo_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'marca_vehiculo_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, MarcaVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'marca_vehiculo_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('marca_vehiculo/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'marca_vehiculo_export', methods: ['GET'])]
    public function export(Request $request, MarcaVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'marca_vehiculo_index');
        $headers = [
            'nombre' => 'Marca',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var MarcaVehiculo $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['marcaVehiculo'] = $objeto->getNombre();
            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Tipos de Vehiculos');
    }

    #[Route('/new', name: 'marca_vehiculo_new', methods: ['GET|POST'])]
    public function new(Request $request, MarcaVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'marca_vehiculo_index');
        $marcaVehiculo = new MarcaVehiculo();
        $form = $this->createForm(MarcaVehiculoType::class, $marcaVehiculo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $marcaVehiculo->setPropietario($this->getUser());
            if ($manager->save($marcaVehiculo)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('marca_vehiculo_index');
        }

        return $this->render('marca_vehiculo/new.html.twig', [
            'marcaVehiculo' => $marcaVehiculo,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'marca_vehiculo_show', methods: ['GET'])]
    public function show(MarcaVehiculo $marcaVehiculo): Response
    {
        $this->denyAccess(Access::VIEW, 'marca_vehiculo_index');

        return $this->render('marca_vehiculo/show.html.twig', [
            'marcaVehiculo' => $marcaVehiculo,
        ]);
    }

    #[Route('/{id}/edit', name: 'marca_vehiculo_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, MarcaVehiculo $marcaVehiculo, MarcaVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'marca_vehiculo_index');
        $form = $this->createForm(MarcaVehiculoType::class, $marcaVehiculo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($marcaVehiculo)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('marca_vehiculo_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('marca_vehiculo/edit.html.twig', [
            'marcaVehiculo' => $marcaVehiculo,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'marca_vehiculo_delete', methods: ['POST'])]
    public function delete(Request $request, MarcaVehiculo $marcaVehiculo, MarcaVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'marca_vehiculo_index');
        if ($this->isCsrfTokenValid('delete'.$marcaVehiculo->getId(), $request->request->get('_token'))) {
            $marcaVehiculo->changeActivo();
            if ($manager->save($marcaVehiculo)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('marca_vehiculo_index');
    }

    #[Route(path: '/{id}/delete', name: 'marca_vehiculo_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, MarcaVehiculo $marcaVehiculo, MarcaVehiculoManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'marca_vehiculo_index', $marcaVehiculo);
        if ($this->isCsrfTokenValid('delete_forever'.$marcaVehiculo->getId(), $request->request->get('_token'))) {
            if ($manager->remove($marcaVehiculo)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('marca_vehiculo_index');
    }
}
