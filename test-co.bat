setlocal enableDelayedExpansion
rem Batch pour tester la connexion à internet
rem Auteur: Benjamin Fourmaux Beruet
rem Version: 2.5
@echo off
cls

::Déclartion des variables
set version=version 2.5
set racineLog=C:\Users\Marjorie\Documents\test-co-log.txt
set colorDef=07
set colorSuccess=02
set colorError=04
set adresse=45.182.145.56
::45.182.145.56
set ifError=false
set time_run=0
color %colorDef%


:: Titre de l'app
echo ///// Test-co  by Benjamin Fourmaux--Beruet \\\\\
echo %version%
echo.

:: Test du parametre
if "%~1"=="" goto question
if "%1"=="1" goto auto_test
if "%1"=="2" goto auto_test

:question
echo Voulez-vous lancer le test de connexion a internet ? (y/n/b/?)
SET /p reponse=

if %reponse% == y (
	goto test
) else (
	if %reponse% == n (
		goto fin
	) else (
		if %reponse% == b (
			goto boucle
		) else (
			if %reponse% == ? (
				goto aide
			)
		)
	)
	color %colorDef%
	goto question
)



:: Boucle de test
:test
echo.
color %colorDef%
:: Question et création du fichier pour l'enregistrement des logs
echo Voulez-vous enregistrer les logs ? (y/n)
SET /p logOption=

if %logOption% == y (
	echo ///// Test-co  by Benjamin Fourmaux--Beruet \\\\\ >> %racineLog%
	echo %version% >> %racineLog%
	echo Fichier de sauvegarde des Logs >> %racineLog%
	echo. >> %racineLog%
) else (
	if %logOption% neq n (
		goto test
	)
)
echo.

echo ---- TEST EN COURS ... ----
if %logOption% == y echo -- [%date%] [%time%] - TEST EN COURS >> %racineLog%
:: Enregistrement du time du début de la panne




:: Test ping
:test_ping
ping %adresse%
echo.
if %errorlevel%==1 (color %colorError%
		   	echo - [%date%] [%time%] ERREUR DE CONNECTION A %adresse%
				set ifError=true
		    	:: log
				if %logOption% == y echo - [%date%] [%time%] ERREUR DE CONNECTION A %adresse% >> %racineLog%
                goto :test_ping)

if %errorlevel%==0 (color %colorSuccess%
			echo - [%date%] [%time%] CONNECTION A %adresse% OK !
			if %logOption% == y echo - [%date%] [%time%] CONNEXION A %adresse% OK ! >> %racineLog%
			:: traitement pour la durée du problème
			if %ifError% == true (
				
				
				echo - DUREE DE LA PANNE : %time_run% s
				if %logOption% == y echo - DUREE DE LA PANNE : %time_run% s >> %racineLog%
				set ifError=false
			) else (
				echo - PAS DE PROBLEME DETECTE
				if %logOption% == y echo - PAS DE PROBLEME DETECTE >> %racineLog%
			)
			:: log
			if %logOption% == y echo ______________________________________________________>>%racineLog%
			echo ---------------------------
			echo.
			goto :question)



:: Section pour les tests automatiques (via le parametre)
:auto_test
if "%1"=="2" (
	echo ///// Test-co  by Benjamin Fourmaux--Beruet \\\\\ >> %racineLog%
	echo %version% >> %racineLog%
	echo Fichier de sauvegarde des Logs >> %racineLog%
	echo. >> %racineLog%
)
echo.

echo ---- TEST EN COURS ... ----
if "%1"=="2" (
	echo [TEST AUTOMATIQUE] >> %racineLog%
	echo -- [%date%] [%time%] - TEST EN COURS >> %racineLog%
)

:auto_test_ping
:: Enregistrement du time du début de la panne


ping %adresse%
echo.
if %errorlevel%==1 (color %colorError%
		   	echo - [%date%] [%time%] ERREUR DE CONNEXION A %adresse%
			set ifError=true
		    :: log
		    if "%1"=="2" echo - [%date%] [%time%] ERREUR DE CONNECTION A %adresse% >> %racineLog%
            goto auto_test_ping)
			
if %errorlevel%==0 (color %colorSuccess%
			echo - [%date%] [%time%] CONNEXION A %adresse% OK !
			if "%1"=="2" echo - [%date%] [%time%] CONNEXION A %adresse% OK ! >> %racineLog%
			:: traitement pour la durée du problème
				echo Duree de la panne: %dureeProblem% s
				if "%1"=="2" echo - DUREE DE LA PANNE : %dureeProblem% s >> %racineLog%
				set ifError=false
			) else (
				echo - PAS DE PROBLEME DETECTE
				if "%1"=="2" echo - PAS DE PROBLEME DETECTE >> %racineLog%
			)
			:: log
			if "%1"=="2" echo ______________________________________________________>>%racineLog%
			echo ---------------------------
			echo.
			goto pause)


:auto_boucle
ping %adresse%
echo.
goto auto_boucle



:: Affichage de l'aide
:aide
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
echo		y		Yes (oui)  confirmation de la question
echo		n		No (non)  refus de la question
echo		b		Boucle  permet de faire une boucle de test
echo		?		Aide  permet d'afficher l'aide du programme
echo.
echo Parametre de lanement :
echo		1		Lancement du test sans enregistrement des logs
echo		2		Lancement du test avec enregistrement des logs
echo.
echo --------------
goto question



:fin
exit
:pause
pause
endlocal & goto :EOF