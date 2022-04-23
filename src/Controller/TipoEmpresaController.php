<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\TipoEmpresa;
use Pidia\Apps\Demo\Form\TipoEmpresaType;
use Pidia\Apps\Demo\Manager\TipoEmpresaManager;
use Pidia\Apps\Demo\Repository\TipoEmpresaRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/tipoEmpresa')]
class TipoEmpresaController extends BaseController
{
    #[Route(path: '/', name: 'tipo_empresa_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'tipo_empresa_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, TipoEmpresaManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'tipo_empresa_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('tipo_empresa/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'tipo_empresa_export', methods: ['GET'])]
    public function export(Request $request, TipoEmpresaManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'tipo_empresa_index');
        $headers = [
            'tipo_empresa' => 'Tipo de Empresa',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var TipoEmpresa $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['tipo_empresa'] = $objeto->getTipoEmpresa();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Tipos de Empresas');
    }

    #[Route('/new', name: 'tipo_empresa_new', methods: ['GET|POST'])]
    public function new(Request $request, TipoEmpresaManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'tipo_empresa_index');
        $tipoEmpresa = new tipoEmpresa();
        $form = $this->createForm(tipoEmpresaType::class, $tipoEmpresa);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $tipoEmpresa->setPropietario($this->getUser());
            if ($manager->save($tipoEmpresa)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_empresa_index');
        }

        return $this->render('tipo_empresa/new.html.twig', [
            'tipo_empresa' => $tipoEmpresa,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_empresa_show', methods: ['GET'])]
    public function show(tipoEmpresa $tipoEmpresa): Response
    {
        $this->denyAccess(Access::VIEW, 'tipo_empresa_index');

        return $this->render('tipo_empresa/show.html.twig', [
            'tipo_empresa' => $tipoEmpresa,
        ]);
    }

    #[Route('/{id}/edit', name: 'tipo_empresa_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, tipoEmpresa $tipoEmpresa, TipoEmpresaManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'tipo_empresa_index');
        $form = $this->createForm(tipoEmpresaType::class, $tipoEmpresa);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($tipoEmpresa)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('tipo_empresa_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('tipo_empresa/edit.html.twig', [
            'tipo_empresa' => $tipoEmpresa,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'tipo_empresa_delete', methods: ['POST'])]
    public function delete(Request $request, tipoEmpresa $tipoEmpresa, TipoEmpresaManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'tipo_empresa_index');
        if ($this->isCsrfTokenValid('delete'.$tipoEmpresa->getId(), $request->request->get('_token'))) {
            $tipoEmpresa->changeActivo();
            if ($manager->save($tipoEmpresa)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_empresa_index');
    }

    #[Route(path: '/{id}/delete', name: 'tipo_empresa_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, TipoEmpresa $tipoEmpresa, TipoEmpresaManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'tipo_empresa_index', $tipoEmpresa);
        if ($this->isCsrfTokenValid('delete_forever'.$tipoEmpresa->getId(), $request->request->get('_token'))) {
            if ($manager->remove($tipoEmpresa)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('tipo_empresa_index');
    }
}
