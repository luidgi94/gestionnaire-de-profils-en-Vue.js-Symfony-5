<?php
use App\Entity\AccountParameters;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method AccountParameters|null find($id, $lockMode = null, $lockVersion = null)
 * @method AccountParameters|null findOneBy(array $criteria, array $orderBy = null)
 * @method AccountParameters[]    findAll()
 * @method AccountParameters[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AccountParametersRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AccountParameters::class);
    }

    // /**
    //  * @return AccountParameters[] Returns an array of AccountParameters objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?AccountParameters
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
