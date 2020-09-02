<?php

/*
 * g.ponty@dev-web.io
 */

declare(strict_types=1);

namespace App\Repository;

use App\Entity\Professeur;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Professeur|null find($id, $lockMode = null, $lockVersion = null)
 * @method Professeur|null findOneBy(array $criteria, array $orderBy = null)
 * @method Professeur[]    findAll()
 * @method Professeur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProfesseurRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Professeur::class);
    }


      /**
     * @return Session[]
     */
    public function findAllGreaterThanPrice($price): array
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery(
            'SELECT p
            FROM App\Entity\Session p
            WHERE p.price > :price
            ORDER BY p.price ASC'
        )->setParameter('price', $price);

        // returns an array of Session objects
        return $query->getResult();
    }

    public function getSessionForProfessor() {

        $data = $this->createQueryBuilder('c')
            ->select('c.id, pc.name')
            ->innerJoin('CMSGBundle:PostToCategory', 'ptc', 'WITH', 'ptc.postId = c.id')
            ->innerJoin('CMSGBundle:PostCategory', 'pc', 'WITH', 'ptc.categoryId = pc.id')
            ->getQuery()
            ->getArrayResult();
 
        return $data;
 
 }
}
