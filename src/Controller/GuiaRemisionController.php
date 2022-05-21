<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\GuiaRemision;
use Pidia\Apps\Demo\Form\GuiaRemisionType;
use Pidia\Apps\Demo\Manager\GuiaRemisionManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/guiaRemision')]
class GuiaRemisionController extends BaseController
{
    #[Route(path: '/', name: 'guia_remision_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'guia_remision_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, GuiaRemisionManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'guia_remision_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('guia_remision/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'guia_remision_export', methods: ['GET'])]
    public function export(Request $request, GuiaRemisionManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'guia_remision_index');
        $headers = [
            'docTramiteSerie' => 'Nro Serie',
            'numeroGuia' => 'Nro Guia',
            'fechaTraslado' => 'Fecha de Traslado',
            'almacenOrigen' => 'Almacen Origen',
            'almacenDestino' => 'Almacen Destino',
            'periodo' => 'Periodo',
            'conductor' => 'Conductor',
            'unidadTransporte' => 'Unidad de Transporte',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var GuiaRemision $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['docTramiteSerie'] = $objeto->getDocTramiteSerie();
            $item['numeroGuia'] = $objeto->getNumeroGuia();
            $item['almacenDestino'] = $objeto->getAlmacenDestino();
            $item['almacenOrigen'] = $objeto->getAlmacenOrigen();
            $item['conductor'] = $objeto->getConductor();
            $item['fechaTraslado'] = $objeto->getFechaTraslado();
            $item['periodo'] = $objeto->getPeriodo();
            $item['unidadTransporte'] = $objeto->getUnidadTransporte();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de GuiaRemisions');
    }

    #[Route('/new', name: 'guia_remision_new', methods: ['GET', 'POST'])]
    public function new(Request $request, GuiaRemisionManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'guia_remision_index');
        $guiaRemision = new GuiaRemision();
        $form = $this->createForm(GuiaRemisionType::class, $guiaRemision);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $guiaRemision->setPropietario($this->getUser());
            if ($manager->save($guiaRemision)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('guia_remision_index');
        }

        return $this->render('guia_remision/new.html.twig', [
            'guia_remision' => $guiaRemision,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'guia_remision_show', methods: ['GET'])]
    public function show(GuiaRemision $guiaRemision): Response
    {
        $this->denyAccess(Access::VIEW, 'guia_remision_index');

        return $this->render('guia_remision/show.html.twig', [
            'guia_remision' => $guiaRemision,
        ]);
    }

    #[Route('/{id}/edit', name: 'guia_remision_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, GuiaRemision $guiaRemision, GuiaRemisionManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'guia_remision_index');
        $form = $this->createForm(GuiaRemisionType::class, $guiaRemision);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($guiaRemision)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('guia_remision_index', ['id' => $guiaRemision->getId()]);
        }

        return $this->render('guia_remision/edit.html.twig', [
            'guia_remision' => $guiaRemision,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'guia_remision_delete', methods: ['POST'])]
    public function delete(Request $request, GuiaRemision $guiaRemision, GuiaRemisionManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'guia_remision_index');
        if ($this->isCsrfTokenValid('delete'.$guiaRemision->getId(), $request->request->get('_token'))) {
            $guiaRemision->changeActivo();
            if ($manager->save($guiaRemision)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('guia_remision_index');
    }

    #[Route(path: '/{id}/delete', name: 'guia_remision_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, GuiaRemision $guiaRemision, GuiaRemisionManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'guia_remision_index', $guiaRemision);
        if ($this->isCsrfTokenValid('delete_forever'.$guiaRemision->getId(), $request->request->get('_token'))) {
            if ($manager->remove($guiaRemision)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('guia_remision_index');
    }
}
