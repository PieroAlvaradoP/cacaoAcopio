<?php

namespace Pidia\Apps\Demo\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Pidia\Apps\Demo\Entity\Unidad;
use Pidia\Apps\Demo\Form\UnidadType;
use Pidia\Apps\Demo\Manager\UnidadManager;
use Pidia\Apps\Demo\Repository\UnidadRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/unidad')]
class UnidadController extends BaseController
{
    #[Route(path: '/', name: 'unidad_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'unidad_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, UnidadManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'unidad_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('unidad/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'unidad_export', methods: ['GET'])]
    public function export(Request $request, UnidadManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'unidad_index');
        $headers = [
            'unidad' => 'Unidad de Medida',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var Unidad $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['unidad'] = $objeto->getUnidad();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Unidades de Medida');
    }

    #[Route('/new', name: 'unidad_new', methods: ['GET|POST'])]
    public function new(Request $request, UnidadManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'unidad_index');
        $unidad = new Unidad();
        $form = $this->createForm(UnidadType::class, $unidad);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $unidad->setPropietario($this->getUser());
            if ($manager->save($unidad)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('unidad_index');
        }

        return $this->render('unidad/new.html.twig', [
            'unidad' => $unidad,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'unidad_show', methods: ['GET'])]
    public function show(Unidad $unidad): Response
    {
        $this->denyAccess(Access::VIEW, 'unidad_index');

        return $this->render('unidad/show.html.twig', [
            'unidad' => $unidad,
        ]);
    }

    #[Route('/{id}/edit', name: 'unidad_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Unidad $unidad, UnidadManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'unidad_index');
        $form = $this->createForm(UnidadType::class, $unidad);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($unidad)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('unidad_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('unidad/edit.html.twig', [
            'unidad' => $unidad,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'unidad_delete', methods: ['POST'])]
    public function delete(Request $request, Unidad $unidad, UnidadManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'unidad_index');
        if ($this->isCsrfTokenValid('delete'.$unidad->getId(), $request->request->get('_token'))) {
            $unidad->changeActivo();
            if ($manager->save($unidad)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('unidad_index');
    }

    #[Route(path: '/{id}/delete', name: 'unidad_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, Unidad $unidad, UnidadManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'unidad_index', $unidad);
        if ($this->isCsrfTokenValid('delete_forever'.$unidad->getId(), $request->request->get('_token'))) {
            if ($manager->remove($unidad)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('unidad_index');
    }
}
