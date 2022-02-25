<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\Localidad;
use Pidia\Apps\Demo\Form\LocalidadType;
use Pidia\Apps\Demo\Manager\LocalidadManager;
use Pidia\Apps\Demo\Repository\LocalidadRepository;
use Doctrine\ORM\EntityManagerInterface;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/localidad')]
class LocalidadController extends BaseController
{
    #[Route(path: '/', name: 'localidad_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'localidad_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, LocalidadManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'localidad_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('localidad/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'localidad_export', methods: ['GET'])]
    public function export(Request $request, LocalidadManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'localidad_index');
        $headers = [
            'nombre' => 'Nombre de Localidad',
            'codigo' => 'Codigo de Localidad',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var Localidad $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['nombre'] = $objeto->getNombre();
            $item['codigo'] = $objeto->getCodigo();
            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Localidades');
    }

    #[Route('/new', name: 'localidad_new', methods: ['GET|POST'])]
    public function new(Request $request, LocalidadManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'localidad_index');
        $localidad = new Localidad();
        $form = $this->createForm(LocalidadType::class, $localidad);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $localidad->setPropietario($this->getUser());
            if ($manager->save($localidad)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('localidad_index');
        }

        return $this->render('localidad/new.html.twig', [
            'localidad' => $localidad,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'localidad_show', methods: ['GET'])]
    public function show(Localidad $localidad): Response
    {
        $this->denyAccess(Access::VIEW, 'localidad_index');

        return $this->render('localidad/show.html.twig', [
            'localidad' => $localidad,
        ]);
    }

    #[Route('/{id}/edit', name: 'localidad_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Localidad $localidad, LocalidadManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'localidad_index');
        $form = $this->createForm(LocalidadType::class, $localidad);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($localidad)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('localidad_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('localidad/edit.html.twig', [
            'localidad' => $localidad,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'localidad_delete', methods: ['POST'])]
    public function delete(Request $request, Localidad $localidad, LocalidadManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'localidad_index');
        if ($this->isCsrfTokenValid('delete'.$localidad->getId(), $request->request->get('_token'))) {
            $localidad->changeActivo();
            if ($manager->save($localidad)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('localidad_index');
    }

    #[Route(path: '/{id}/delete', name: 'localidad_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, Localidad $localidad, LocalidadManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'localidad_index', $localidad);
        if ($this->isCsrfTokenValid('delete_forever'.$localidad->getId(), $request->request->get('_token'))) {
            if ($manager->remove($localidad)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('localidad_index');
    }
}
