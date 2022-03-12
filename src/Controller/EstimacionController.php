<?php

namespace Pidia\Apps\Demo\Controller;

use Pidia\Apps\Demo\Repository\EstimacionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EstimacionController extends AbstractController
{
    #[Route('/estimacion', name: 'app_estimacion')]
    public function index(): Response
    {
        return $this->render('estimacion/index.html.twig', [
            'controller_name' => 'EstimacionController',
        ]);
    }

    #[Route(path: '/estimaciones_socio/ajax', name: 'estimacion_socio_ajax', methods: ['POST'])]
    public function pedidoAjax(Request $request, EstimacionRepository $repository): Response
    {
        $id = $request->request->get('idSocio');
        $estimacion = $repository->findEstimaciones($id);
        if (null === $estimacion) {
            return $this->json(['status' => false, 'message' => 'No se encontraron estimaciones']);
        }

        $data = [
            'estimacion' => $estimacion,
        ];

        return $this->json(['status' => true, 'data' => $data]);
    }
}
