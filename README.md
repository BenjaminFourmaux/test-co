# Test-co 
Programme en btach qui permet de faire des tests de connexion (ping) automatisés afin de savoir la durée d'une panne de connexion à Internet.

Ce programme a été developpé suite à un problème de connexion à Internet (problème chez le FAI) afin de détermnier la durée de la panne (ce nuit là, le programme à été créé 1 H après le debut de la panne à 23H30 et la panne à durré jusqu'a 5H01).

## Utilisation du programme
Avant d'utiliser le programme, veuillez changer le répertoire de sauvegarde des fichier de log à la variable racineLog:
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
