# Test-co 
Programme en btach qui permet de faire des tests de connexion (ping) automatisés afin de savoir la durée d'une panne de connexion à Internet.

Ce programme a été developpé suite à un problème de connexion à Internet (problème chez le FAI) afin de détermnier la durée de la panne (ce nuit là, le programme à été créé 1 H après le debut de la panne à 23H30 et la panne à durré jusqu'a 5H01).

## Fonctionnalités
Liste des fonctionnalité implémentés:
- [x] Changement de la couleur de la police de la console en fonction du résultat du test.
- [x] (log) Sauvegarde des évenements dans un fichier .txt de log.
- [x] Affichage de la date et l'heure des evenements. Afin de déterminer le début, la fin et la durée de la panne de connexion.
- [ ] Affichage de la durée de la panne.
- [ ] Possibilité de lancer un test avec un paramètre de lancement (pour l'automatisation des tests)

## Utilisation du programme
Avant d'utiliser le programme, veuillez changer le répertoire de sauvegarde des fichiers de log à la variable racineLog:
```batch
::Déclartion des variables
set version=version 2.0
set racineLog=C:\Users\exempleUser\Documents\test-co-log.txt
set colorDef=07
```
Une fois le programme lancé voici ce que vous allez voir.  
*Première question:*  
" Voulez-vous lancer le test de connexion a internet ? (y/n/b/?)" Cette question vous demande ce qu'il faut faire.  
*Choix de réponse:*
- y     Pour Yes (oui) lance alorsle test de connexion.
- n     Pour No (non) ferme l'app.
- b     Pour Boucle  fait une boucle de test (!! boucle infini !!) *en béta*.
- ?     Pour Aide  Affiche l'aide.  

*Deuxième question: (si première répondu par y)*
" Voulez-vous enregistrer les logs ? (y/n)" Vous demande si vous voulez les logs dans un fichier .txt.  
*Choix de réponse:*
- y     Pour Yes (oui) Créer le fichier .txt pour l'enregistrement des logs.
- n     Pour No (non)  N'enregistre pas les logs.

**Résultat du test**
- Si le test à réussi à se connecter à internet Alors la boucle de test s'arrete et affiche "CONNEXION A x.x.x.x OK !" et le text de la console passe en vert.
- Si le test n'a pas réussi à se connecter Alors il refait les tests en boucle jusqu'a temps qu'il arrive à se connecter et le test de la console passe en rouge. 

## Versions (actuelle stable: 2.5)
- __2.5__ (bientôt) : 
    * ~~Ajout de l'affichage de la durée de la panne. (dans les logs).~~
    * Ajout d'un paramètre pour permettre l'automatisation du test (ex: déclenchement par event windows).
    * Complétion de l'aide pour l'usage du paramètre.
    * Modification de l'affichage des logs dans le fichier .txt
    * Optimisation et correction du code
- __2.0__ : Ajout de fonctionnalités. Liste des fonctionnalités:
    * Ajout de la fonctionnalité de log qui permet d'enregistrer les événements des tests dans une fichier text.
    * Modiffication de la couleur de la police de la console: Vert = le test a réussi à se connecter à Internet Rouge = erreur de connexion à Internet.
