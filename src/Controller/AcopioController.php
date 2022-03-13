<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\Acopio;
use Pidia\Apps\Demo\Form\AcopioType;
use Pidia\Apps\Demo\Manager\AcopioManager;
use Pidia\Apps\Demo\Repository\AcopioRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/acopio')]
class AcopioController extends BaseController
{
    #[Route(path: '/', name: 'acopio_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'acopio_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, AcopioManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'acopio_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('acopio/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'acopio_export', methods: ['GET'])]
    public function export(Request $request, AcopioManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'acopio_index');
        $headers = [
            'periodo' => 'Periodo',
            'fecha' => 'Fecha',
            'socio' => 'Socio',
            'certificacion' => 'certificacion',
            'almacen' => 'Almacen',
            'ticket' => 'Ticket',
            'pesoBruto' => 'Peso Bruto',
            'cantidadUnidad' => 'Unidad Peso Bruto',
            'tara' => 'Tara',
            'taraTotal' => 'Tara Total',
            'pesoNeto' => 'Peso Neto',
            'pesoNetoUnidad' => 'Unidad Peso Neto',
            'observaciones' => 'Observaciones',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var Acopio $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['periodo'] = $objeto->getPeriodo();
            $item['fecha'] = $objeto->getFecha();
            $item['socio'] = $objeto->getSocio();
            $item['certificacion'] = $objeto->getCertificacion();
            $item['almacen'] = $objeto->getAlmacen();
            $item['ticket'] = $objeto->getTicket();
            $item['pesoBruto'] = $objeto->getPesoBruto();
            $item['cantidadUnidad'] = $objeto->getCantidadUnidad();
            $item['tara'] = $objeto->getTara();
            $item['taraTotal'] = $objeto->getTaraTotal();
            $item['pesoNeto'] = $objeto->getPesoNeto();
            $item['pesoNetoUnidad'] = $objeto->getCantidadUnidad();
            $item['obserbaciones'] = $objeto->getObservaciones();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Acopios');
    }

    #[Route('/new', name: 'acopio_new', methods: ['GET', 'POST'])]
    public function new(Request $request, AcopioManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'acopio_index');
        $acopio = new Acopio();
        $form = $this->createForm(AcopioType::class, $acopio);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $acopio->setPropietario($this->getUser());
            if ($manager->save($acopio)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('acopio_index');
        }

        return $this->render('acopio/new.html.twig', [
            'acopio' => $acopio,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'acopio_show', methods: ['GET'])]
    public function show(Acopio $acopio): Response
    {
        $this->denyAccess(Access::VIEW, 'acopio_index');

        return $this->render('acopio/show.html.twig', [
            'acopio' => $acopio,
        ]);
    }

    #[Route('/{id}/edit', name: 'acopio_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Acopio $acopio, AcopioManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'acopio_index');
        $form = $this->createForm(AcopioType::class, $acopio);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($acopio)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('acopio_index', ['id' => $acopio->getId()]);
        }

        return $this->render('acopio/edit.html.twig', [
            'acopio' => $acopio,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'acopio_delete', methods: ['POST'])]
    public function delete(Request $request, Acopio $acopio, AcopioManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'acopio_index');
        if ($this->isCsrfTokenValid('delete'.$acopio->getId(), $request->request->get('_token'))) {
            $acopio->changeActivo();
            if ($manager->save($acopio)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('acopio_index');
    }

    #[Route(path: '/{id}/delete', name: 'acopio_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, Acopio $acopio, AcopioManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'acopio_index', $acopio);
        if ($this->isCsrfTokenValid('delete_forever'.$acopio->getId(), $request->request->get('_token'))) {
            if ($manager->remove($acopio)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('acopio_index');
    }
}
