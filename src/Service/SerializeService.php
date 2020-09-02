<?php
namespace App\Service;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;

class SerializeService
{
    // Serialize les info du user pour la partie profile (ajout des information des collegues et des eleves) !!!
    public function serializeUserProfile($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);

        return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','username','email','createdAt','updatedAt','parameter',
         'professeur'=>[ 'id','formation' => ['id','title']
         ,'session'=>['id','entitled',
            'professeur'=>['id','matter','user'=>['id','username','email','parameter'=>['firstName','lastName','telephone','avatarFileName']]], 
            'eleves'=>['user'=>['id','email','username','parameter'=>['firstName','lastName','telephone','avatarFileName']]]]]]]);
    }

     // Serialize les Categories 
     public function serializeSessionDirection($object)
     {
         $encoders = new JsonEncoder();
         $defaultContext = [
             AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                 return $object->getId();
             },
         ];
 
         $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
         $serializer = new Serializer([$normalizers], [$encoders]);
         return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','entitled','start','end','created','modified',
         'professeur'=>['id','matter','user'=>['id','username','email','parameter'=>['firstName','lastName','telephone','avatarFileName']]], 
            'eleves'=>['user'=>['id','email','username','parameter'=>['firstName','lastName','telephone','avatarFileName']]],
         'formations' => ['id','title','session'=>['id','entitled'],'modules'=>['id','title'],
         ]
         ]]);
     }
    
    // Serialize les info du user !!!
    public function serializeUser($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);

        return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','username','email','createdAt','updatedAt','parameter',
         'professeur'=>[ 'id','formation' => ['id','title',
                                            'session'=>['id','entitled'],
                                            'seances'=>['id','title', 'published','supportLink',
                                                'categorie'=>['id','title'],
                                                'module'=>['id','title']]]
         ,'session'=>['id','entitled']]]]);
    }
    
    // Serialize la Liste des Seances 
    public function serializeSeanceListe($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);

        return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','published', 'formation' => ['id','title',
        'modules'=>['id','title'],
        'session'=>['id','entitled']]]]);
    }
    
    // Serialize les Categories 
    public function serializeCategorieListe($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);

        return $serializer->serialize($object, 'json', [AbstractNormalizer::IGNORED_ATTRIBUTES => ['seances', 'modified','created']]);
    }


    // Serialize l'entité
    public function serializeObject($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);
        return $serializer->serialize($object, 'json');
    }

    
     // Serialize les Categories 
     public function serializeMessage($object)
     {
         $encoders = new JsonEncoder();
         $defaultContext = [
             AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                 return $object->getId();
             },
         ];
         $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
         $serializer = new Serializer([$normalizers], [$encoders]);
         return $serializer->serialize($object, 'json');
     }

     // Serialize les Categories 
    public function serializeMail($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);
        return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','email']]);
    }
     // Serialize les Categories 
     public function serializeSession($object)
     {
         $encoders = new JsonEncoder();
         $defaultContext = [
             AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                 return $object->getId();
             },
         ];
 
         $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
         $serializer = new Serializer([$normalizers], [$encoders]);
         return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','entitled','start','end','created','modified',
         'formations' => ['id','title','session'=>['id','entitled'],'modules'=>['id','title'],
         ]
         ]]);
     }

    

     public function serializeFormation($object)
     {
         $encoders = new JsonEncoder();
         $defaultContext = [
             AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                 return $object->getId();
             },
         ];
 
         $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
         $serializer = new Serializer([$normalizers], [$encoders]);
         return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','title','created','modified',
          'session'=>['id','entitled']
          ]]);
     }

     // Serialize les info du user !!!
    public function serializeUserProfesseur($object)
    {
        $encoders = new JsonEncoder();
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getId();
            },
        ];

        $normalizers = new ObjectNormalizer(null, null, null, null, null, null, $defaultContext);
        $serializer = new Serializer([$normalizers], [$encoders]);

        return $serializer->serialize($object, 'json', [AbstractNormalizer::ATTRIBUTES => ['id','username','email','createdAt','updatedAt','parameter',
         'professeur'=>[ 'id','matter','formation' => ['id','title',
                                            'session'=>['id','entitled'],
                                            'seances'=>['id','title', 'published','supportLink',
                                                'categorie'=>['id','title'],
                                                'module'=>['id','title']]]
         ,'session'=>['id','entitled','formations' => ['id','title']]]]]);
    }

}