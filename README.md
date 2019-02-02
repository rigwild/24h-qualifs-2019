# Kaleeis Games
## Installation
### Pré-requis
 - Serveur PHP version 7+
 - Base de données PostgreSQL

### Installer
Télécharger le contenu du repository GitHub
```sh
git clone https://github.com/rigwild/24h-qualifs-2019.git
```

Place le contenu du repository dans un serveur web type Apache ou Nginx avec PHP 7+.

Copier le fichier `/api/lib/DatabaseConfig.default.class.php` vers `/api/lib/DatabaseConfig.class.php` et renseignez vos informations de connexion à votre base de données.

Importer le script `24hqualif.sql` dans votre base de données.

## Jeux de test
Un jeu de test est fournis dans la base de données.
Identifiants de connexion administrateur :
Identifiant : `Minigugus`, mot de passe : `test`.

(Pour les )

## Fonctionnalités
 - Connexion
 - Déconnexion
 - Liste des jeux empruntés avec leur emprunteur
 - Ajouter un jeu
 - Supprimer un jeu
 - Retourner un jeu
 - Emprunter un jeu (Via l'id de l'utilisateur)
 - Affichage de l'état d'un jeu
 - Recherche un jeu emprunté via `nom prénom` ou `nom du jeu`
 - Trigger BDD qui banni utilisateur après 3 blâmes (Mais blâmes pas mis en place !)

## Adresse du serveur
[https://demo.asauvage.fr/](https://demo.asauvage.fr/)

## Licence
[The MIT License](LICENSE)