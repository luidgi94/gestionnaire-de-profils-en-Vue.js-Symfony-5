Ce projet est crée avec les frameworks  [VueJs et Symfony 5](https://github.com/luidgi94/gestionnaire-de-profils-en-Vue.js-Symfony-5).

Vous devez installer composer et symfony pour php 7.1.33

Pour installer les dépendances avec composer:
### `composer install`
### `composer update`

Pour installer les dépendances avec npm:
### `npm install`
### `npm run build`

importez la base de donnée "codesk_db.sql" dans mysql
contenue dans le repertoire ./Doc de connexion et DB

Dans le repertoire du projet faites :

### `symfony server:start`

Cela va démarrer l'application en mode developpement.<br />
Ouvrez ensuite [http://127.0.0.1:8000/](http://127.0.0.1:8000/)pour voir l'application dans le navigateur.

n'oubliez pas de configurer votre compte gmail pour utiliser swift mailer:
configuration  email dans le fichier .env
# For Gmail as a transport for Swift mailer, use: "gmail://username:password@localhost"


Si vous rencontrer un problème avec la dernière version de doctrine faites:
### `composer recipes:install --force -v`
