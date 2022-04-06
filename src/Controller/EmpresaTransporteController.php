<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\EmpresaTransporte;
use Pidia\Apps\Demo\Form\EmpresaTransporteType;
use Pidia\Apps\Demo\Manager\EmpresaTransporteManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/empresaTransporte')]
class EmpresaTransporteController extends BaseController
{
    #[Route('/', name: 'empresa_transporte_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'empresa_transporte_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, EmpresaTransporteManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'empresa_transporte_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('empresa_transporte/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'empresa_transporte_export', methods: ['GET'])]
    public function export(Request $request, EmpresaTransporteManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'empresa_transporte_index');
        $headers = [
            'nombre' => 'Nombre',
            'ruc' => 'RUC',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var EmpresaTransporte $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['nombre'] = $objeto->getNombre();
            $item['ruc'] = $objeto->getRuc();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Empresas de Transporte');
    }

    #[Route('/new', name: 'empresa_transporte_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EmpresaTransporteManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'empresa_transporte_index');
        $empresaTransporte = new EmpresaTransporte();
        $form = $this->createForm(EmpresaTransporteType::class, $empresaTransporte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $empresaTransporte->setPropietario($this->getUser());
            if ($manager->save($empresaTransporte)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('empresa_transporte_index');
        }

        return $this->render('empresa_transporte/new.html.twig', [
            'empresaTransporte' => $empresaTransporte,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'empresa_transporte_show', methods: ['GET'])]
    public function show(EmpresaTransporte $empresaTransporte): Response
    {
        $this->denyAccess(Access::VIEW, 'empresa_transporte_index');

        return $this->render('empresa_transporte/show.html.twig', [
            'empresaTransporte' => $empresaTransporte,
        ]);
    }

    #[Route('/{id}/edit', name: 'empresa_transporte_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, EmpresaTransporte $empresaTransporte, EmpresaTransporteManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'empresa_transporte_index');
        $form = $this->createForm(EmpresaTransporteType::class, $empresaTransporte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($empresaTransporte)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('empresa_transporte_index', ['id' => $empresaTransporte->getId()]);
        }

        return $this->render('empresa_transporte/edit.html.twig', [
            'empresaTransporte' => $empresaTransporte,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'empresa_transporte_delete', methods: ['POST'])]
    public function delete(Request $request, EmpresaTransporte $empresaTransporte, EmpresaTransporteManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'empresa_transporte_index');
        if ($this->isCsrfTokenValid('delete'.$empresaTransporte->getId(), $request->request->get('_token'))) {
            $empresaTransporte->changeActivo();
            if ($manager->save($empresaTransporte)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('empresa_transporte_index');
    }

    #[Route(path: '/{id}/delete', name: 'empresa_transporte_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, EmpresaTransporte $empresaTransporte, EmpresaTransporteManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'empresa_index', $empresaTransporte);
        if ($this->isCsrfTokenValid('delete_forever'.$empresaTransporte->getId(), $request->request->get('_token'))) {
            if ($manager->remove($empresaTransporte)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('empresa_transporte_index');
    }
}
