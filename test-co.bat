rem Batch pour tester la connexion à internet
rem Auteur: Benjamin Fourmaux Beruet
rem Version: 2.0
@echo off
cls

::Déclartion des variables
set version=version 2.0
set racineLog=C:\Users\Marjorie\Documents\test-co-log.txt
set colorDef=07
set colorSuccess=02
set colorError=04
set adresse=8.8.8.8
color %colorDef%

::titre de l'app
echo ///// Test-co  by Benjamin Fourmaux--Beruet \\\\\
echo %version%
echo.

: question
echo Voulez-vous lancer le test de connexion a internet ? (y/n/b/?)
SET /p reponse=
rem Mettre ici le test si c'est autre chose que y / n goto question
if %reponse% == y goto test
if %reponse% == n goto fin
if %reponse% == b goto boucle
if %reponse% == ? goto aide


:: Boucle de test
: test
echo.
:: Question et création du fichier pour l'enregistrement des logs
echo Voulez-vous enregistrer les logs ? (y/n)
SET /p logOption=
rem Pourquoi utiliser le double pipe pour les echo 
if %logOption% == y echo ///// Test-co  by Benjamin Fourmaux--Beruet \\\\\ >> %racineLog%
if %logOption% == y echo %version% >> %racineLog%
if %logOption% == y echo Fichier de sauvegarde des Logs >> %racineLog%
if %logOption% == y echo. >> %racineLog%
echo.

echo ---- TEST EN COURS ... ----
if %logOption% == y echo -- [%date%] [%time%] - TEST EN COURS >> %racineLog%

: test_ping
ping %adresse%
echo.
if %errorlevel%==1 (color %colorError%
		   	echo - [%date%] [%time%] ERREUR DE CONNECTION A %adresse%
		    	if %logOption% == y echo - [%date%] [%time%] ERREUR DE CONNECTION A %adresse% >> %racineLog%
                   	goto :test_ping)
if %errorlevel%==0 (color %colorSuccess%
			echo - [%date%] [%time%] CONNECTION A %adresse% OK !
			if %logOption% == y echo - [%date%] [%time%] CONNECTION A %adresse% OK ! >> %racineLog%
			echo.
			goto question)


: boucle
ping %adresse%
echo.
goto boucle


:: Affichage de l'aide
: aide
color %colorDef%
echo ---- Aide ----
echo.
echo Ce programme vous permet de lancer un test de connexion vers l'exterieur 
echo de votre reseau (ping).
echo Afin de savoir quand la panne a eu lieu et quand elle est a ete repare
echo De plus vous pouvez choisir d'enregistrer les logs dans un fichier text.
echo.
echo Utilisation : [y] [n] [b] [?]
echo.
echo Options : 
echo           y	Yes (oui)  confirmation de la question
echo           n	No (non)  refus de la question
echo           b	Boucle  permet de faire une boucle de test
echo           ?        Aide  permet d'afficher l'aide du programme
echo.
echo --------------
goto question


: fin
exit