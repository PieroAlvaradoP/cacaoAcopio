<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Entity\BaseSocial;
use Pidia\Apps\Demo\Form\BaseSocialType;
use Pidia\Apps\Demo\Manager\BaseSocialManager;
use Pidia\Apps\Demo\Repository\BaseSocialRepository;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/baseSocial')]
class BaseSocialController extends BaseController
{
    #[Route(path: '/', name: 'base_social_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'base_social_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, BaseSocialManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'base_social_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('base_social/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'base_social_export', methods: ['GET'])]
    public function export(Request $request, BaseSocialManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'base_social_index');
        $headers = [
            'nombre' => 'Nombre',
            'localidad' => 'Localidad',
            'almacen' => 'Almacen',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var BaseSocial $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['nombre'] = $objeto->getNombre();
            $item['localidad'] = $objeto->getLocalidad();
            $item['almacen'] = $objeto->getAlmacenAcopio();

            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte de Bases Sociales');
    }

    #[Route('/new', name: 'base_social_new', methods: ['GET|POST'])]
    public function new(Request $request, BaseSocialManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'base_social_index');
        $base_social = new BaseSocial();
        $form = $this->createForm(BaseSocialType::class, $base_social);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $base_social->setPropietario($this->getUser());
            if ($manager->save($base_social)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('base_social_index');
        }

        return $this->render('base_social/new.html.twig', [
            'base_social' => $base_social,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'base_social_show', methods: ['GET'])]
    public function show(BaseSocial $base_social): Response
    {
        $this->denyAccess(Access::VIEW, 'base_social_index');

        return $this->render('base_social/show.html.twig', [
            'base_social' => $base_social,
        ]);
    }

    #[Route('/{id}/edit', name: 'base_social_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, BaseSocial $base_social, BaseSocialManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'base_social_index');
        $form = $this->createForm(BaseSocialType::class, $base_social);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($base_social)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('base_social_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('base_social/edit.html.twig', [
            'base_social' => $base_social,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'base_social_delete', methods: ['POST'])]
    public function delete(Request $request, BaseSocial $base_social, BaseSocialManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'base_social_index');
        if ($this->isCsrfTokenValid('delete'.$base_social->getId(), $request->request->get('_token'))) {
            $base_social->changeActivo();
            if ($manager->save($base_social)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('base_social_index');
    }

    #[Route(path: '/{id}/delete', name: 'base_social_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, BaseSocial $base_social, BaseSocialManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'base_social_index', $base_social);
        if ($this->isCsrfTokenValid('delete_forever'.$base_social->getId(), $request->request->get('_token'))) {
            if ($manager->remove($base_social)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('base_social_index');
    }

    /**
     * @throws \Doctrine\ORM\NonUniqueResultException
     * @throws \Doctrine\ORM\NoResultException
     */
    #[Route(path: '/busqueda/localidad', name: 'base_social_busqueda', methods: ['POST'])]
    public function busqueda(Request $request, BaseSocialRepository $repository): Response
    {
        $localidad = (int) $request->request->get('localidad');
        $result = $repository->getNombrePadre($localidad);

        return $this->json([$result]);
    }
}
