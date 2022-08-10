<?php
namespace App\Controller;

use App\Entity\Events;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Form\TodoType;




class EventController extends AbstractController
{
  #[Route('/', name: 'event')]
  public function index(ManagerRegistry $doctrine): Response
  {
    $events = $doctrine->getRepository(Events::class)->findAll();
    return $this->render('event/index.html.twig', ['events' => $events]);
  }

  #[Route('/create', name: 'event_create')]
  public function create(Request $request, ManagerRegistry $doctrine): Response
  {
      $event = new events();
      $form = $this->createForm(TodoType::class, $event);

      $form->handleRequest($request);

      if ($form->isSubmitted() && $form->isValid()) {
          $now = new \DateTime('now');

          $event = $form->getData();
          $event->setDate($now);  
          $em = $doctrine->getManager();
          $em->persist($event);
          $em->flush();

          $this->addFlash(
              'notice',
              'Event Added'
              );
    
          return $this->redirectToRoute('event');
      }

      return $this->render('event/create.html.twig', ['form' => $form->createView()]);
  }


  #[Route('/edit/{id}', name: 'event_edit')]
  public function edit(Request $request, ManagerRegistry $doctrine, $id): Response
  {
      $events = $doctrine->getRepository(Events::class)->find($id);
      $form = $this->createForm(ToDoType::class, $events);
      $form->handleRequest($request);

      if ($form->isSubmitted() && $form->isValid()) {
          $now = new \DateTime('now');
          $event = $form->getData();
          $event->setDate($now);
          $em = $doctrine->getManager();
          $em->persist($event);
          $em->flush();
          $this->addFlash(
               'notice',
               'Event Edited'
               );

          return $this->redirectToRoute('event');
      }

      return $this->render('event/edit.html.twig', ['form' => $form->createView()]);
  }

  #[Route('/details/{id}', name: 'event_details')]
  public function details(ManagerRegistry $doctrine, $id): Response
  {
      $event = $doctrine->getRepository(events::class)->find($id);

      return $this->render('event/details.html.twig', ['event' => $event]);
  }

  
  #[Route('/delete/{id}', name: 'event_delete')]   
  public function delete($id, ManagerRegistry $doctrine): Response    
  {
  $event = $doctrine->getRepository(events::class)->find($id);
  $em= $doctrine->getManager();        
  $em->remove($event);        
  $em->flush();        
  $this->addFlash(
    'notice',
    'Event deleted'
    );               
    return $this->redirectToRoute('event');
  }

  #[Route('type/{type}', name: 'filter')]
  public function filter(ManagerRegistry $doctrine, $type): Response
  {
    $events = $doctrine->getRepository(Events::class)->findBy(['type' => $type]);
    return $this->render('event/index.html.twig', ['events' => $events]);
  }
}