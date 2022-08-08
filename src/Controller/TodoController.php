<?php
namespace App\Controller;

use App\Entity\Events;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Form\TodoType;




class TodoController extends AbstractController
{
  #[Route('/', name: 'todo')]
  public function index(ManagerRegistry $doctrine): Response
  {
    $todos = $doctrine->getRepository(Events::class)->findAll();
    return $this->render('todo/index.html.twig', ['todos' => $todos]);
  }

  #[Route('/create', name: 'todo_create')]
  public function create(Request $request, ManagerRegistry $doctrine): Response
  {
      $todo = new events();
      $form = $this->createForm(TodoType::class, $todo);

      $form->handleRequest($request);

      if ($form->isSubmitted() && $form->isValid()) {
          $now = new \DateTime('now');

          $todo = $form->getData();
          $todo->setDate($now);  
          $em = $doctrine->getManager();
          $em->persist($todo);
          $em->flush();

          $this->addFlash(
              'notice',
              'Event Added'
              );
    
          return $this->redirectToRoute('todo');
      }

      return $this->render('todo/create.html.twig', ['form' => $form->createView()]);
  }


  #[Route('/edit/{id}', name: 'todo_edit')]
  public function edit(Request $request, ManagerRegistry $doctrine, $id): Response
  {
      $todo = $doctrine->getRepository(events::class)->find($id);
      $form = $this->createForm(TodoType::class, $todo);
      $form->handleRequest($request);

      if ($form->isSubmitted() && $form->isValid()) {
          $now = new \DateTime('now');
          $todo = $form->getData();
          $todo->setDate($now);
          $em = $doctrine->getManager();
          $em->persist($todo);
          $em->flush();
          $this->addFlash(
               'notice',
               'Event Edited'
               );

          return $this->redirectToRoute('todo');
      }

      return $this->render('todo/edit.html.twig', ['form' => $form->createView()]);
  }

  #[Route('/details/{id}', name: 'todo_details')]
  public function details(ManagerRegistry $doctrine, $id): Response
  {
      $todo = $doctrine->getRepository(events::class)->find($id);

      return $this->render('todo/details.html.twig', ['todo' => $todo]);
  }

  
  #[Route('/delete/{id}', name: 'todo_delete')]   
  public function delete($id, ManagerRegistry $doctrine): Response    
  {
  $todo = $doctrine->getRepository(events::class)->find($id);
  $em= $doctrine->getManager();        
  $em->remove($todo);        
  $em->flush();        
  $this->addFlash(
    'notice',
    'Event deleted'
    );               
    return $this->redirectToRoute('todo');
  }

  #[Route('/{type}', name: 'filter')]
  public function filter(ManagerRegistry $doctrine, $type): Response
  {
    $todos = $doctrine->getRepository(Events::class)->findBy(['type' => '$type']);
    return $this->render('todo/index.html.twig', ['todos' => $todos]);
  }
}