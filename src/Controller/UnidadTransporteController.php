<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\UnidadTransporte;
use Pidia\Apps\Demo\Form\UnidadTransporteType;
use Pidia\Apps\Demo\Manager\UnidadTransporteManager;
use Pidia\Apps\Demo\Repository\UnidadTransporteRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/unidadTransporte')]
class UnidadTransporteController extends BaseController
{
    #[Route(path: '/', name: 'unidad_transporte_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'unidad_transporte_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, UnidadTransporteManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'unidad_transporte_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('unidad_transporte/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'unidad_transporte_export', methods: ['GET'])]
    public function export(Request $request, UnidadTransporteManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'unidad_transporte_index');
        $headers = [
            'empresaTransporte' => 'Empresa de Transportes',
            'tipoVehiculo' => 'Tipo de Vehiculo',
            'direccion' => 'Numero de ejes',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var UnidadTransporte $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['Empresa de Transportes'] = $objeto->getEmpresaTransporte();
            $item['Tipo de Vehiculo'] = $objeto->getTipoVehiculo();
            $item['Numero de ejes'] = $objeto->getNumEjes();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Unidades de Transporte');
    }

    #[Route('/new', name: 'unidad_transporte_new', methods: ['GET|POST'])]
    public function new(Request $request, UnidadTransporteManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'unidad_transporte_index');
        $unidadTransporte = new UnidadTransporte();
        $form = $this->createForm(UnidadTransporteType::class, $unidadTransporte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $unidadTransporte->setPropietario($this->getUser());
            if ($manager->save($unidadTransporte)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('unidad_transporte_index');
        }

        return $this->render('unidad_transporte/new.html.twig', [
            'unidadTransporte' => $unidadTransporte,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'unidad_transporte_show', methods: ['GET'])]
    public function show(UnidadTransporte $unidadTransporte): Response
    {
        $this->denyAccess(Access::VIEW, 'unidad_transporte_index');

        return $this->render('unidad_transporte/show.html.twig', [
            'unidadTransporte' => $unidadTransporte,
        ]);
    }

    #[Route('/{id}/edit', name: 'unidad_transporte_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, UnidadTransporte $unidadTransporte, UnidadTransporteManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'unidad_transporte_index');
        $form = $this->createForm(UnidadTransporteType::class, $unidadTransporte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($unidadTransporte)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('unidad_transporte_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('unidad_transporte/edit.html.twig', [
            'unidadTransporte' => $unidadTransporte,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'unidad_transporte_delete', methods: ['POST'])]
    public function delete(Request $request, UnidadTransporte $unidadTransporte, UnidadTransporteManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'unidad_transporte_index');
        if ($this->isCsrfTokenValid('delete'.$unidadTransporte->getId(), $request->request->get('_token'))) {
            $unidadTransporte->changeActivo();
            if ($manager->save($unidadTransporte)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('unidad_transporte_index');
    }

    #[Route(path: '/{id}/delete', name: 'unidad_transporte_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, UnidadTransporte $unidadTransporte, UnidadTransporteManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'unidad_transporte_index', $unidadTransporte);
        if ($this->isCsrfTokenValid('delete_forever'.$unidadTransporte->getId(), $request->request->get('_token'))) {
            if ($manager->remove($unidadTransporte)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('unidad_transporte_index');
    }
}
