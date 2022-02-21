<?php

namespace Pidia\Apps\Demo\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Pidia\Apps\Demo\Entity\Lote;
use Pidia\Apps\Demo\Form\LoteType;
use Pidia\Apps\Demo\Manager\LoteManager;
use Pidia\Apps\Demo\Security\Access;
use Pidia\Apps\Demo\Util\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/lote')]
class LoteController extends BaseController
{
    #[Route('/', name: 'lote_index', defaults: ['page' => '1'], methods: ['GET'])]
    #[Route(path: '/page/{page<[1-9]\d*>}', name: 'lote_index_paginated', methods: ['GET'])]
    public function index(Request $request, int $page, LoteManager $manager): Response
    {
        $this->denyAccess(Access::LIST, 'lote_index');
        $paginator = $manager->list($request->query->all(), $page);

        return $this->render('lote/index.html.twig', [
            'paginator' => $paginator,
        ]);
    }

    #[Route(path: '/export', name: 'lote_export', methods: ['GET'])]
    public function export(Request $request, LoteManager $manager): Response
    {
        $this->denyAccess(Access::EXPORT, 'lote_index');
        $headers = [
            'periodo' => 'Periodo',
            'nroLote' => 'Nro Lote',
            'pesoNeto' => 'Peso Neto',
            'acopios' => 'Acopios',
        ];
        $params = Paginator::params($request->query->all());
        $objetos = $manager->repositorio()->filter($params, false);
        $data = [];
        /** @var Lote $objeto */
        foreach ($objetos as $objeto) {
            $item = [];
            $item['periodo'] = $objeto->getPeriodo();
            $item['nroLote'] = $objeto->getNroLote();
            $item['pesoNeto'] = $objeto->getPesoNeto();
            $item['acopios'] = $objeto->getAcopios();
            $data[] = $item;
            unset($item);
        }

        return $manager->export($data, $headers, 'Reporte Lotes');
    }

    #[Route('/new', name: 'lote_new', methods: ['GET', 'POST'])]
    public function new(Request $request, LoteManager $manager): Response
    {
        $this->denyAccess(Access::NEW, 'lote_index');
        $lote = new Lote();
        $form = $this->createForm(LoteType::class, $lote);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lote->setPropietario($this->getUser());
            if ($manager->save($lote)) {
                $this->addFlash('success', 'Registro creado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('lote_index');
        }

        return $this->render('lote/new.html.twig', [
            'lote' => $lote,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'lote_show', methods: ['GET'])]
    public function show(Lote $lote): Response
    {
        $this->denyAccess(Access::VIEW, 'lote_index');

        return $this->render('lote/show.html.twig', [
            'lote' => $lote,
        ]);
    }

    #[Route('/{id}/edit', name: 'lote_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Lote $lote, LoteManager $manager): Response
    {
        $this->denyAccess(Access::EDIT, 'lote_index');
        $form = $this->createForm(LoteType::class, $lote);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($manager->save($lote)) {
                $this->addFlash('success', 'Registro actualizado!!!');
            } else {
                $this->addErrors($manager->errors());
            }

            return $this->redirectToRoute('lote_index');
        }

        return $this->render('lote/edit.html.twig', [
            'lote' => $lote,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'lote_delete', methods: ['POST'])]
    public function delete(Request $request, Lote $lote, LoteManager $manager): Response
    {
        $this->denyAccess(Access::DELETE, 'lote_index');
        if ($this->isCsrfTokenValid('delete'.$lote->getId(), $request->request->get('_token'))) {
            $lote->changeActivo();
            if ($manager->save($lote)) {
                $this->addFlash('success', 'Estado ha sido actualizado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('lote_index');
    }

    #[Route(path: '/{id}/delete', name: 'lote_delete_forever', methods: ['POST'])]
    public function deleteForever(Request $request, Lote $lote, LoteManager $manager): Response
    {
        $this->denyAccess(Access::MASTER, 'cliente_index', $lote);
        if ($this->isCsrfTokenValid('delete_forever'.$lote->getId(), $request->request->get('_token'))) {
            if ($manager->remove($lote)) {
                $this->addFlash('warning', 'Registro eliminado');
            } else {
                $this->addErrors($manager->errors());
            }
        }

        return $this->redirectToRoute('lote_index');
    }
}
