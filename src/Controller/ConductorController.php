<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\Conductor;
use Pidia\Apps\Demo\Form\ConductorType;
use Pidia\Apps\Demo\Manager\ConductorManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/conductor')]
class ConductorController extends BaseController
{
    #[Route('/', name: 'conductor_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'conductor_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, ConductorManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'conductor_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('conductor/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'conductor_export', methods: ['GET'])]
    public function export(Request $request, ConductorManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'conductor_index');
        $headers = [
            'licencia' => 'Nro Licencia',
            'nombres' => 'Nombres',
            'apellidoPaterno' => 'Ap. Paterno',
            'apellidoMaterno' => 'ap. Materno',
            'documento' => 'Documento de identidad',
            'localidad' => 'Localidad',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var Conductor $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['licencia'] = $objeto->getLicencia();
            $item['nombres'] = $objeto->getNombres();
            $item['apellidoPaterno'] = $objeto->getApellidoPaterno();
            $item['apellidoMaterno'] = $objeto->getApellidoMaterno();
            $item['documento'] = $objeto->getNumDocumento();
            $item['localidad'] = $objeto->getLocalidad();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Conductores');
    }

    #[Route('/new', name: 'conductor_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ConductorManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'conductor_index');
        $conductor = new Conductor();
        $form = $this->createForm(ConductorType::class, $conductor);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $conductor->setPropietario($this->getUser());
            if ($manager->save($conductor)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('conductor_index');
        }

        return $this->render('conductor/new.html.twig', [
            'conductor' => $conductor,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'conductor_show', methods: ['GET'])]
    public function show(Conductor $conductor): Response
    {
        $this->denyAccess(Access::VIEW, 'conductor_index');

        return $this->render('conductor/show.html.twig', [
            'conductor' => $conductor,
        ]);
    }

    #[Route('/{id}/edit', name: 'conductor_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Conductor $conductor, ConductorManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'conductor_index');
        $form = $this->createForm(ConductorType::class, $conductor);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($conductor)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('conductor_index', ['id' => $conductor->getId()]);
        }

        return $this->render('conductor/edit.html.twig', [
            'conductor' => $conductor,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'conductor_delete', methods: ['POST'])]
    public function delete(Request $request, Conductor $conductor, ConductorManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'conductor_index');
        if ($this->isCsrfTokenValid('delete'.$conductor->getId(), $request->request->get('_token'))) {
            $conductor->changeActivo();
            if ($manager->save($conductor)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('conductor_index');
    }

    #[Route(path: '/{id}/delete', name: 'conductor_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, Conductor $conductor, ConductorManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'conductor_index', $conductor);
        if ($this->isCsrfTokenValid('delete_forever'.$conductor->getId(), $request->request->get('_token'))) {
            if ($manager->remove($conductor)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('conductor_index');
    }
}
