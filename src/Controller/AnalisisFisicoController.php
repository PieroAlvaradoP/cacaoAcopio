<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\AnalisisFisico;
use Pidia\Apps\Demo\Form\AnalisisFisicoType;
use Pidia\Apps\Demo\Manager\AnalisisFisicoManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/analisis/fisico')]
class AnalisisFisicoController extends BaseController
{
    #[Route('/', name: 'analisis_fisico_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'analisis_fisico_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, AnalisisFisicoManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'analisis_fisico_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('analisis_fisico/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'analisis_fisico_export', methods: ['GET'])]
    public function export(Request $request, AnalisisFisicoManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'analisis_fisico_index');
        $headers = [
            'periodo' => 'Periodo',
            'fecha' => 'Fecha',
            'ticket' => 'Ticket',
            'muestra' => 'Muestra',
            'exportable' => 'Exportable',
            'humedad' => 'Humedad',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var AnalisisFisico $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['periodo'] = $objeto->getPeriodo();
            $item['fecha'] = $objeto->getFecha();
            $item['ticket'] = $objeto->getTicket();
            $item['muestra'] = $objeto->getMuestra();
            $item['exportable'] = $objeto->getExportable();
            $item['humedad'] = $objeto->getHumedad();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte Analisís Fisico');
    }

    #[Route('/new', name: 'analisis_fisico_new', methods: ['GET', 'POST'])]
    public function new(Request $request, AnalisisFisicoManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'analisis_fisico_index');
        $analisisFisico = new AnalisisFisico();
        $form = $this->createForm(AnalisisFisicoType::class, $analisisFisico);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $analisisFisico->setPropietario($this->getUser());
            if ($manager->save($analisisFisico)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('analisis_fisico_index');
        }

        return $this->render('analisis_fisico/new.html.twig', [
            'analisis_fisico' => $analisisFisico,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'analisis_fisico_show', methods: ['GET'])]
    public function show(AnalisisFisico $analisisFisico): Response
    {
        $this->denyAccess(Access::VIEW, 'analisis_fisico_index');

        return $this->render('analisis_fisico/show.html.twig', [
            'analisis_fisico' => $analisisFisico,
        ]);
    }

    #[Route('/{id}/edit', name: 'analisis_fisico_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, AnalisisFisico $analisisFisico, AnalisisFisicoManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'analisis_fisico_index');
        $form = $this->createForm(AnalisisFisicoType::class, $analisisFisico);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($analisisFisico)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('analisis_fisico_index', ['id' => $analisisFisico->getId()]);
        }

        return $this->render('analisis_fisico/edit.html.twig', [
            'analisis_fisico' => $analisisFisico,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'analisis_fisico_delete', methods: ['POST'])]
    public function delete(Request $request, AnalisisFisico $analisisFisico, AnalisisFisicoManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'analisis_fisico_index');
        if ($this->isCsrfTokenValid('delete'.$analisisFisico->getId(), $request->request->get('_token'))) {
            $analisisFisico->changeActivo();
            if ($manager->save($analisisFisico)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('analisis_fisico_index');
    }

    #[Route(path: '/{id}/delete', name: 'analisis_fisico_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, AnalisisFisico $analisisFisico, AnalisisFisicoManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'analisis_fisico_index', $analisisFisico);
        if ($this->isCsrfTokenValid('delete_forever'.$analisisFisico->getId(), $request->request->get('_token'))) {
            if ($manager->remove($analisisFisico)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('analisis_fisico_index');
    }

    #[Route(path: '/call/porcet', name: 'porcent')]
    public function calPorcen(): response
    {
        return $this->json(['exito']);
    }
}
