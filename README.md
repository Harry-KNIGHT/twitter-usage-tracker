Voici le README avec la mise en forme Markdown :

# Twitter Usage Tracker

Ce projet est une application Vapor (Swift) permettant de suivre et comptabiliser les ouvertures de l'application Twitter par les utilisateurs. Il utilise une base de données PostgreSQL pour stocker les informations sur les utilisateurs et le nombre de fois où ils ont ouvert Twitter.

## Table des matières

- [Fonctionnalités](#fonctionnalités)
- [Architecture](#architecture)
- [Configuration et Installation](#configuration-et-installation)
- [Utilisation](#utilisation)
- [Endpoints de l'API](#endpoints-de-lapi)
- [Déploiement avec Docker](#déploiement-avec-docker)
- [Développement local avec Ngrok](#développement-local-avec-ngrok)

---

## Fonctionnalités

- Compte et stocke les ouvertures de l'application Twitter pour chaque utilisateur.
- API RESTful pour interagir avec la base de données.
- Migration facile de la base de données avec Docker.
- Suivi des utilisateurs et de leurs activités de manière sécurisée et optimisée.

## Architecture

Le projet est développé avec l'architecture Vapor (Swift), et repose sur plusieurs composants :

- **Vapor** : Framework backend Swift pour créer des API performantes et évolutives.
- **PostgreSQL** : Base de données pour stocker les informations sur les utilisateurs et le nombre d'ouvertures.
- **Docker** : Conteneurisation pour simplifier le déploiement et la gestion de l'application.

## Configuration et Installation

1. **Cloner le dépôt :**
   
   `git clone https://github.com/Harry-KNIGHT/twitter-usage-tracker.git`
   `cd twitter-usage-tracker`

	2.	Configurer les variables d’environnement : Créez un fichier .env dans la racine du projet avec les informations de la base de données (nom, utilisateur, mot de passe).
	3.	Installer les dépendances :
Assurez-vous que Swift et Vapor sont installés.
	4.	Lancer le projet :

vapor run serve


	5.	Utiliser Docker pour PostgreSQL :
Pour lancer le serveur PostgreSQL en local, utilisez Docker :

docker-compose up -d



Utilisation

L’application dispose de plusieurs routes API pour gérer le suivi des ouvertures de Twitter. Vous pouvez utiliser des outils comme Postman ou curl pour tester les endpoints de l’API.

Endpoints de l’API

	1.	POST /api/twitter-opened
 
Enregistre une ouverture de Twitter pour un utilisateur donné.
	•	Paramètres :
	•	userId (String) : Identifiant de l’utilisateur.
	•	Exemple :

{
  "userId": "elliot"
}


	2.	GET /api/twitter-usage
Récupère toutes les ouvertures de Twitter pour tous les utilisateurs.
	3.	DELETE /api/twitter-usage
Supprime tous les enregistrements d’ouverture de Twitter dans la base de données.

Déploiement avec Docker

	1.	Construire l’image Docker :

docker-compose build


	2.	Lancer l’application et la base de données :

docker-compose up -d


	3.	Migrer la base de données :

docker-compose run migrate



Développement local pour l'instant

Auteurs

	•	Elliot Harry Knight - Développeur iOS et créateur de ce projet.

Tu peux copier ce texte dans un fichier `README.md` pour conserver la mise en forme Markdown.
