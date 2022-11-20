
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <array.au3>
#include <GUIConstantsEx.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>


;Opt("MustDeclareVars",1)
Opt("MouseCoordMode",1)
Opt("GUICoordMode",1)
Opt("PixelCoordMode",1)




Dim $Activate_Pseudo = 0 ; sera modifié par la suite avec un test si la fenêtre n'existe pas alors il faut lancer le jeu
Dim $Paused = False
Dim $Ndc = "yourNdc"
Dim $Mdp = "yourMdp"
Dim $Ndc_Sacri = "yourNdc"
Dim $Mdp_Sacri = "yourMdp"
;Dim $GUI
;Dim $nMsg
Dim $Journal
Dim $Id_Fichier = _Handler_Fichier_Log()

HotKeySet( "{F5}", "_Exit")
HotKeySet("{SPACE}", "_Pause")
Func _Exit()
    Exit
 EndFunc


Func _Pause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip("Le bot est en pause press SPACE pour relancer",0,0)
    WEnd
EndFunc




_Ma_GUI()
Func _Ma_GUI()
   $GUI = GUICreate("DofBot", 360, 565, 995, 0)
Local $Bouton_Pause	 =GUICtrlCreateButton("Pause", 20, 520, 75, 25)
Local $Bouton_Exit 	 =GUICtrlCreateButton("Exit", 260, 520, 75, 25)
Local $Elevage_Deja_Connecte        = GUICtrlCreateButton("Elevage pour tout les perso si un compte est deja ouvert",20,80,330,25)
Local $Elevage_Tout_Les_Perso		= GUICtrlCreateButton("Elevage Pour tout les perso",20,110,330,25)
Local $Elevage_Dofus				= GUICtrlCreateButton("Elevage Pour le perso connecté",20,50,330,25)
Local $Elevage_Bonta				= GUICtrlCreateButton("Elevage à Bonta",20,20,165,25)
Local $Elevage_Brack				= GUICtrlCreateButton("Elevage à Brackmar",185,20,165,25)
GUISetState(@SW_SHOW)
$Journal = GUICtrlCreateEdit(@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : lancement du bot..." & @CRLF, 10, 220, 340, 300, $ES_AUTOVSCROLL + $WS_VSCROLL + $ES_READONLY)
FileWrite($Id_Fichier,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : lancement du bot..." & @CRLF)
While 1
        $nMsg = GUIGetMsg()
		 Switch $nMsg
			   Case $GUI_EVENT_CLOSE
                        Exit
			   Case $Bouton_Pause
						_TogglePause()
			   Case $Bouton_Exit
						 _Exit()
			   Case $Elevage_Dofus ;Le programe vas uttiliser qu'une seul fois la fonction "Main" (C'est pour déterminer quelle personnage [fenetre] est connecté
					 $Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()
			   Case $Elevage_Bonta ; Le programe vas uttiliser qu'une seul fois la fonction "Elevage_Bonta_Button" (C'est pour déterminer quelle personnage [fenetre] est connecté
					 $Activate_Pseudo= "Heoloil"
					 Elevage_Bonta_Button()
					 $Activate_Pseudo= "Heol-ll"
					 Elevage_Bonta_Button()
					 $Activate_Pseudo= "Cocacola"
					 Elevage_Bonta_Button()
					 $Activate_Pseudo= "Heo-arrow"
					 Elevage_Bonta_Button()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Elevage_Bonta_Button()
					 $Activate_Pseudo= "Heo-wall"
					 Elevage_Bonta_Button()
			   Case $Elevage_Brack ; Le programe vas uttiliser qu'une seul fois la fonction "Elevage_Brack_Button" (C'est pour déterminer quelle personnage [fenetre] est connecté
					 $Activate_Pseudo= "Heoloil"
					 Elevage_Brack_Button()
					 $Activate_Pseudo= "Heol-ll"
					 Elevage_Brack_Button()
					 $Activate_Pseudo= "Cocacola"
					 Elevage_Brack_Button()
					 $Activate_Pseudo= "Heo-arrow"
					 Elevage_Brack_Button()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Elevage_Brack_Button()
					 $Activate_Pseudo= "Heo-wall"
					 Elevage_Brack_Button()

			   Case $Elevage_Tout_Les_Perso
				  Elevage_Pour_Tout_Les_Perso_Button()
			   Case $Elevage_Deja_Connecte
				  Elevage_Tout_Les_Perso()


		 EndSwitch
WEnd


EndFunc

Func _IsChecked($idControlID)
    Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

Func Main(); Fonction principale qui appelle toute les autres
   if ParametrerFenetreDejeu() Then
	    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "La fenetre "&$Activate_Pseudo&" est active"&@CRLF,"u")
   Elevage_Brack()
   Elevage_Bonta()
   GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le personnage "&$Activate_Pseudo&" a fini son elevage"&@CRLF,"u")

   EndIf
EndFunc

Func Elevage_Pour_Tout_Les_Perso_Button() ; Fonction tres tres tres brouillon à modifié au plus vite
   _Connection_D_Un_Personnage()
					 $Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()
EndFunc

Func Elevage_Tout_Les_Perso() ; Il faut qu'un perso soit déja connecté pour cela
					 $Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()
					 _Attendre_Etre_InGame()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()
					 _Attendre_Etre_InGame()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()
					 _Attendre_Etre_InGame()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()

					 _Changer_De_Perso()
					 _Attendre_Etre_InGame()

					$Activate_Pseudo= "Heoloil"
					 Main()
					 $Activate_Pseudo= "Heol-ll"
					 Main()
					 $Activate_Pseudo= "Cocacola"
					 Main()
					 $Activate_Pseudo= "Heo-arrow"
					 Main()
					 $Activate_Pseudo= "Eclaire-orphee"
					 Main()
					 $Activate_Pseudo= "Heo-wall"
					 Main()


EndFunc




Func Elevage_Bonta_Button()
    if ParametrerFenetreDejeu() Then
	    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "La fenetre "&$Activate_Pseudo&" est active"&@CRLF,"u")
   Elevage_Bonta()
   GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le personnage "&$Activate_Pseudo&" a fini son elevage"&@CRLF,"u")
   EndIf
EndFunc

Func Elevage_Brack_Button()
    if ParametrerFenetreDejeu() Then
	    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "La fenetre "&$Activate_Pseudo&" est active"&@CRLF,"u")
   Elevage_Brack()
   GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le personnage "&$Activate_Pseudo&" a fini son elevage"&@CRLF,"u")
   EndIf
EndFunc



Func Elevage_Brack()
    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot est en dirrection de Brackmar"&@CRLF,"u")

   AllerEnclos_Brack()

   Mangeoire(); Ici je dois deja etre A la map mangeoir de Brackmar
   GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos Mangeoire "&@CRLF,"u")

   Baffeur(); Ici je suis a la map mangeroir de Brackmar
    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos l'enclos Baffeur "&@CRLF,"u")

   Foudroyeur(); ect
    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos l'enclos Foudroyeur "&@CRLF,"u")

   Caresseur() ;ect
    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos l'enclos Caresseur "&@CRLF,"u")

   DragoFesse()
    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos l'enclos DragoFesse "&@CRLF,"u")

EndFunc

Func Elevage_Bonta()
   GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot est en dirrection de Bonta"&@CRLF,"u")
   AllerEnclos_Bonta()

   Dragofesse_Bonta()

    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos DragoFesse "&@CRLF,"u")

   Foudroyeur_Bonta()

    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos Foudroyeur "&@CRLF,"u")

   Baffeur_Bonta()

    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos Baffeur "&@CRLF,"u")

   Caresseur_Bonta()

    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos Caresseur "&@CRLF,"u")

   Mangeoire_Bonta()

    GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Le bot a fini l'enclos Mangeoire "&@CRLF,"u")

EndFunc

Func ParametrerFenetreDejeu() ; Mettre la fenetre avec les bonne coordonées et l'activé pour empecher qu'une auttre page s'ouvre par dessus
   If WinExists($Activate_Pseudo)Then
	  WinActivate($Activate_Pseudo)
	  WinWaitActive($Activate_Pseudo)
	  WinMove($Activate_Pseudo,"",0,0,1000,600)
	  Return True
   Else
	  GUICtrlSetData($Journal,@MDAY& "/" &@MON& "/" &@YEAR& " à " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & "La fenetre "&$Activate_Pseudo&" nest pas active"&@CRLF,"u")
	  Return False
   EndIf
EndFunc

Func Stocker() ; Boutton Stocker dans l'etable
 Local  $ButtonStocker_X=467
 Local  $ButtonStocker_Y=68
 MouseClick("left",$ButtonStocker_X,$ButtonStocker_Y)
EndFunc

Func Elever(); Boutton Elever dans l'etable
Local $ButtonElever_X=436
Local $ButtonElever_Y=490
 MouseClick("left",$ButtonElever_X,$ButtonElever_Y)
EndFunc


; Déplacement dans bonta et brack

Func AllerEnclos_Brack()
   Send("z") ; uttiliser popo brack
   UtiliserZappyBrack()
   Aller_HDV_Animeaux()
    MouseClick("left",603,145); Barre de recherche dans le zappy
   Sleep(500)
   Send("animaux")
   send("{enter}")
   VerifHDVAnimaux_Brack()
EndFunc

Func UtiliserZappyBrack()
  Local $CoordZappy_X =780
  Local $CoordZappy_Y =168
  Local $ColorMapZappy = PixelGetColor($CoordZappy_X,$CoordZappy_Y)
	If $ColorMapZappy = 0x1C1113 Then
		 MouseClick("left",$CoordZappy_X,$CoordZappy_Y)
	  Else
		 UtiliserZappyBrack()
	  EndIf
EndFunc

Func VerifHDVAnimaux_Brack()
 Local   $color = PixelGetColor(297, 359)
	  If $color = 0x201102 Then
		 sleep(1)
	  Else
		 VerifHDVAnimaux_Brack()
	  EndIf
EndFunc


Func AllerEnclos_Bonta()
   Send("e") ; utiliser popo bonta
   UtiliserZappyBonta()
   Aller_HDV_Animeaux()
   MouseClick("left",603,145); Barre de recherche dans le zappy
   Sleep(500)
   Send("animaux")
   send("{enter}")
   VerifHDVAnimaux_Bonta()
   Aller_Gauche()
EndFunc

Func UtiliserZappyBonta()

   $CoordZappy_X =769
   $CoordZappy_Y =280
   $ColorMapZappy = PixelGetColor(457, 76)
   Sleep(1000)
   If $ColorMapZappy = 0x5A6125 Then
	  MouseClick("left",$CoordZappy_X,$CoordZappy_Y)
   Else
	  UtiliserZappyBonta()
   EndIf
EndFunc

Func VerifHDVAnimaux_Bonta()

Local  $color = PixelGetColor(816,249)
Local  $color2  = PixelGetColor(79, 547)

	  If $color = 0x9D904F Or $color2 = 0xEDDAA3  Then
		 sleep(1)
	  Else
		 VerifHDVAnimaux_Bonta()
	  EndIf
   EndFunc


Func Aller_HDV_Animeaux()
	  $color = PixelGetColor(390,98)
   If $color = 0x5F5F5F Then
	  MouseClick("left",480,122); Boutton Hotel De Vente
   Else
	  Aller_HDV_Animeaux()
   EndIf
EndFunc


;Fonctions changement de carte vers le Top/Bot/Left/Right


Func Aller_Top()
Local   $ChangerDeCarte_X=811
Local   $ChangerDeCarte_Y=37
   MouseClick("left",$ChangerDeCarte_X,$ChangerDeCarte_Y)

EndFunc

Func Aller_Bot()
 Local  $ChangerDeCarte_X=784
 Local  $ChangerDeCarte_Y=526
   MouseClick("left",$ChangerDeCarte_X,$ChangerDeCarte_Y)

EndFunc

Func Aller_Gauche()
  Local $ChangerDeCarte_X=34
  Local $ChangerDeCarte_Y=265
   MouseClick("left",$ChangerDeCarte_X,$ChangerDeCarte_Y)
   MouseMove(0,0);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! J'ai changer qq chose
EndFunc

Func Aller_Droite()
  Local $ChangerDeCarte_X=929
  Local $ChangerDeCarte_Y=305
   MouseClick("left",$ChangerDeCarte_X,$ChangerDeCarte_Y)

EndFunc


 ; Test avant action !

Func Etable_Test_1() ; Test pour savoir quand on est dans l'etable ou pas encore :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: a chaner
 local $Color = PixelGetColor(281,331)
   If $Color = 0xF7CC00 Then
	  Sleep(1)
   Else
	  Sleep(2000)
	 Etable_Test_1()
   EndIf
EndFunc

Func Male();Pour brakmar on uttilise que les DD male (inverse pour bonta)
   WinActivate($Activate_Pseudo)
 Local  $BareDeRecherche_X=367
 Local   $BareDeRecherche_Y=90
 Local  $SelectDD_X=346
 Local  $SelectDD_X=282
 Local  $Bare_Recherche_DD_X = 389
 Local  $Bare_Recherche_DD_Y = 289

   MouseClick("left",$BareDeRecherche_X,$BareDeRecherche_Y)
   Sleep(1000)
   Send("Male")
   MouseClick("left",$Bare_Recherche_DD_X, $Bare_Recherche_DD_Y)
   Sleep("200")
   MouseClick("Left",$SelectDD_X,$SelectDD_X)
EndFunc

Func Femelle()
   WinActivate($Activate_Pseudo)
 Local  $BareDeRecherche_X=367
 Local   $BareDeRecherche_Y=90
 Local  $SelectDD_X=346
 Local  $SelectDD_X=282
 Local  $Bare_Recherche_DD_X = 389
 Local  $Bare_Recherche_DD_Y = 289
   MouseClick("left",$BareDeRecherche_X,$BareDeRecherche_Y)
   Sleep(1000)
   Send("Femelle")
   MouseClick("left",$Bare_Recherche_DD_X, $Bare_Recherche_DD_Y)
   Sleep("200")
   MouseClick("Left",$SelectDD_X,$SelectDD_X)
EndFunc

;Fonction secondaire

Func ChangerDD()
   Send("{UP}")
EndFunc

Func SelectDD()
   $DerrniereDD_X = 290
   $DerrniereDD_Y = 282
    MouseClick("Left",$DerrniereDD_X,$DerrniereDD_Y)
 EndFunc

 Func Plus_De_DD_A_Identifier()
Local $Color= PixelGetColor(390,125)

   If $Color = 0xC2E802 Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func _Nb_Max()
   Local $Nb_Max=PixelGetColor(274,484)
   If $Nb_Max = 0x7A848A Then ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Cette couleur change régulierement !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	  Return True
   Else
	  Return False
   EndIf
EndFunc


;Fonction de gestion des DD pour savoir dans quel enclos elle vont, leur fatigue .... Ect



Func DDpourBaffeur()
	  WinActivate($Activate_Pseudo)
   Local $Endurence=PixelGetColor(550,379);0xCCF600
   Local $Fatigue=PixelGetColor(550,279);0xFCC800
   Local $Amour =PixelGetColor(550,350);0xCCF600
   Local $Senerite_neg=PixelGetColor(493,421);0xFF6A3D
	  If $Endurence <> 0xCCF600 And $Fatigue <> 0xFCC800 And $Amour = 0xCCF600 And $Senerite_neg = 0xFF6A3D Then
		 Elever()
		 SelectDD()
	  else
		 If   Plus_De_DD_A_Identifier() == False And _Nb_Max() == False Then
			ChangerDD()
		 Else
			Return False
		 EndIf

	  EndIf
			Return True
EndFunc

Func DDpourFoudroyeur()
   ParametrerFenetreDejeu()
   Local $Endurence = PixelGetColor(550,379);0xCCF600
   Local $Senerite_neg = PixelGetColor(497,421);0xFF6A3D
   Local $Fatigue = PixelGetColor(550,279);0xFCC800
   Local $Senerite_Moy = PixelGetColor(475,420); 0xCCF600
	  If $Endurence <> 0xCCF600 And $Fatigue <> 0xFCC800 And $Senerite_neg <> 0xFF6A3D and $Senerite_Moy <> 0xCCF600 Then
		 Elever()
		 SelectDD()
	  Else
		 If Plus_De_DD_A_Identifier() == False And _Nb_Max() == False Then
			   ChangerDD()
			Else
			   Return False
		 EndIf
	  EndIf
			   Return True
EndFunc

Func DDpourCaresseur()
   ParametrerFenetreDejeu()
   Local $Fatigue=PixelGetColor(550,278);0xFCC800
   Local $Endurence=PixelGetColor(550,379);0xCCF600
   Local $Amour=PixelGetColor(550,350);0xCCF600
   Local $Serenite_Pisi=PixelGetColor(493,420);0xDD6AD3D
	  If $Fatigue <> 0xFCC800 And $Endurence = 0xCCF600 And $Amour <> 0xCCF600 And $Serenite_Pisi <> 0xFF6A3D Then
		 Elever()
		 SelectDD()
		 DDpourCaresseur()
	  Else
		 If Plus_De_DD_A_Identifier() == False And _Nb_Max() == False Then
			   ChangerDD()
			Else
			   Return False
		 EndIf
	  EndIf
			   Return True
EndFunc

Func DDpourDragofesse()
   ParametrerFenetreDejeu()
   Local $Amour=PixelGetColor(550,350);0xCCF600
   Local $Fatigue=PixelGetColor(550,279);0xFCC800
   Local $Serenite_Pisi=PixelGetColor(524,420);FF6A3D

   If $Fatigue <> 0xFCC800 And $Amour <> 0xCCF600 And $Serenite_Pisi = 0xFF6A3D Then
	  Elever()
	  SelectDD()
   Else
	  If Plus_De_DD_A_Identifier() == False And _Nb_Max() == False Then
			   ChangerDD()
			Else
			   Return False
		 EndIf
	  EndIf
			   Return True
EndFunc

Func DDpourMangeoir()
	WinActivate($Activate_Pseudo)
   Local $Amour =PixelGetColor(550,350);0xCCF600
   Local $Maturite=PixelGetColor(550,365);0xCCF600
   Local $Endurence=PixelGetColor(550,379);0xCCF600
   Local $Energie=PixelGetColor(582,250);0xCCF600
   Local $Fatigue=PixelGetColor(504,278);0xFCC800
	  If   $Amour = 0xCCF600 And $Maturite = 0xCCF600 And $Endurence = 0xCCF600 And $Energie <> 0xCCF600 And $Fatigue <> 0xFCC800 Then
		 Elever()
		 SelectDD()
	  else
		 If   Plus_De_DD_A_Identifier() == False And _Nb_Max() == False Then
			ChangerDD()

		 Else
			Return False
		 EndIf
	  EndIf
			Return True
EndFunc

;Fonction principales de gestions de DD dans les enclos


Func Mangeoire()
   Local $dd_a_traiter = True

   ParametrerFenetreDejeu()
    Sleep(2000)
   OuvrirMangeoire()
   Etable_Test_1()
   _Vider_Enclo()
   Male()
    while $dd_a_traiter==True
	     $dd_a_traiter=DDpourMangeoir()
   WEnd
   QuiterEtable()

   Aller_Bot()

EndFunc

Func Baffeur()
   Local $dd_a_traiter = True
   Local $Verif_Map = True

   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapBaffeur()
   WEnd
    Sleep(2000)
   OuvrirBaffeur()
   Etable_Test_1()
   _Vider_Enclo()
   Male()
    while $dd_a_traiter==True
	     $dd_a_traiter=DDpourBaffeur()
   WEnd
   QuiterEtable()
   Aller_Droite()

EndFunc

Func Foudroyeur()
   Local $dd_a_traiter = True
   Local $Verif_Map = True

   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapFoudroyeur()
   WEnd
    Sleep(2000)
   OuvrirFoudroyeur()
   Etable_Test_1()
   _Vider_Enclo()
   Male()
   while $dd_a_traiter==True
	     $dd_a_traiter=DDpourFoudroyeur()
   WEnd
   QuiterEtable()
   Aller_Droite()
EndFunc

Func Caresseur()
   Local $dd_a_traiter = True
   Local $Verif_Map = True

   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapCaresseur()
   WEnd
    Sleep(2000)
   OuvrirCaresseur()
   Etable_Test_1()
   _Vider_Enclo()

   Male()
   while $dd_a_traiter==True
	     $dd_a_traiter=DDpourCaresseur()
   WEnd
   QuiterEtable()
   Aller_Top()
EndFunc

Func DragoFesse()
   Local $dd_a_traiter = True
   Local $Verif_Map = True

   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapDragoFesse()
   WEnd
    Sleep(2000)
   OuvrirDragoFesse()
   Etable_Test_1()
   _Vider_Enclo()

   Male()
    while $dd_a_traiter==True
	     $dd_a_traiter=DDpourDragofesse()
   WEnd
   QuiterEtable()
EndFunc

Func Dragofesse_Bonta()
   Local $dd_a_traiter=True
   Local $Verif_Map = True
   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map=VerifMapDragoFesse_Bonta()
   WEnd
    Sleep(2000)
   OuvrirDragoFesse_Bonta()
   Etable_Test_1()
   _Vider_Enclo()

   Femelle()
    while $dd_a_traiter==True
	     $dd_a_traiter=DDpourDragofesse()
   WEnd
   QuiterEtable()
   Aller_Gauche()
EndFunc

Func Foudroyeur_Bonta()
  Local $dd_a_traiter = True
  Local $Verif_Map = True
   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapFoudroyeur_Bonta()
   WEnd
    Sleep(2000)
   OuvrirFoudroyeur_Bonta()
   Etable_Test_1()
   _Vider_Enclo()

   Femelle()
   while $dd_a_traiter == True
	     $dd_a_traiter = DDpourFoudroyeur()
   WEnd
   QuiterEtable()
   Aller_Top()

EndFunc

Func Baffeur_Bonta()
   Local $dd_a_traiter = True
   Local $Verif_Map = True
   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapBaffeur_Bonta()
   WEnd
    Sleep(2000)
   OuvrirBaffeur_Bonta()
   Etable_Test_1()
   _Vider_Enclo()

   Femelle()
   while $dd_a_traiter == True
	     $dd_a_traiter = DDpourBaffeur()
	  WEnd
   QuiterEtable()
   Aller_Droite()
EndFunc

Func Caresseur_Bonta()
    Local $dd_a_traiter = True
   Local $Verif_Map = True
   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapCaresseur_Bonta()
   WEnd
    Sleep(2000)
   OuvrirCaresseur_Bonta()
   Etable_Test_1()
   _Vider_Enclo()

   Femelle()
   while $dd_a_traiter == True
	     $dd_a_traiter = DDpourCaresseur()
   WEnd
   QuiterEtable()
   Aller_Top()
EndFunc

Func Mangeoire_Bonta()
   Local $dd_a_traiter = True
   Local $Verif_Map = True
   ParametrerFenetreDejeu()
   While $Verif_Map == True
	  $Verif_Map = VerifMapMangeoir_Bonta()
   WEnd
   Sleep(2000)
   OuvrirMangeoir_Bonta()
   Etable_Test_1()
   _Vider_Enclo()

   Femelle()
   while $dd_a_traiter == True
	     $dd_a_traiter = DDpourMangeoir()
   WEnd
   QuiterEtable()


EndFunc


; Ouvrir et fermer les enclos de Brackmar

Func OuvrirMangeoire();;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EN COUR
   $Coord_Enclos_X = 431
   $Coord_Enclos_Y = 282
   $Color_Enclos   = 0x272013
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
EndFunc

Func OuvrirBaffeur()

   $Coord_Enclos_X = 574
   $Coord_Enclos_Y = 177
   $Color_Enclos   = 0x463B25
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
EndFunc

Func OuvrirFoudroyeur()
    $Coord_Enclos_X = 622
   $Coord_Enclos_Y = 126
   $Color_Enclos   = 0x574A31
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
 EndFunc

Func OuvrirCaresseur()
    $Coord_Enclos_X = 400
   $Coord_Enclos_Y = 176
   $Color_Enclos   = 0x433925
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
	EndFunc

Func OuvrirDragoFesse()
    $Coord_Enclos_X = 357
   $Coord_Enclos_Y = 152
   $Color_Enclos   = 0x282114
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
EndFunc

Func OuvrirDragoFesse_Bonta()
    $Coord_Enclos_X = 594
   $Coord_Enclos_Y = 209
   $Color_Enclos   = 0x98943D
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
EndFunc

Func OuvrirFoudroyeur_Bonta()
    $Coord_Enclos_X = 620
   $Coord_Enclos_Y = 174
   $Color_Enclos   = 0x9F8958
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
	EndFunc

Func OuvrirBaffeur_Bonta()
    $Coord_Enclos_X = 376
   $Coord_Enclos_Y = 209
   $Color_Enclos   = 0xA58E5C
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
	EndFunc

Func OuvrirCaresseur_Bonta()
    $Coord_Enclos_X = 681
   $Coord_Enclos_Y = 262
   $Color_Enclos   = 0xAC9361
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
	EndFunc

Func OuvrirMangeoir_Bonta()
    $Coord_Enclos_X = 572
   $Coord_Enclos_Y = 319
   $Color_Enclos   = 0xC9AD71
   $Attitude_Pour_Faire_Bouger_DD = "q"
   If PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos Then
	  MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   Else
	  Do
		 Send($Attitude_Pour_Faire_Bouger_DD)
		 Sleep(2000)
	  Until PixelGetColor($Coord_Enclos_X, $Coord_Enclos_Y) == $Color_Enclos
		 MouseClick("Left",$Coord_Enclos_X, $Coord_Enclos_Y)
   EndIf
EndFunc



Func _Vider_Enclo ()
   $Vider_enclo_X = 388
   $Vider_enclo_Y = 354
   $Tout_Transferer_Vers_Etable_X = 437
   $Tout_Transferer_Vers_Etable_Y = 363
   MouseClick("left",$Vider_enclo_X,$Vider_enclo_Y)
   Sleep(500)
   MouseClick("left",$Tout_Transferer_Vers_Etable_X,$Tout_Transferer_Vers_Etable_Y)

EndFunc

Func QuiterEtable()
   Local $QuiterEtable_X =822
   Local $QuiterEtable_Y =66
   MouseClick("left",$QuiterEtable_X,$QuiterEtable_Y)
   Sleep(500)
EndFunc




;Verification sur quelle map on se trouve puis coordonée d'un deuxieme point de changement de carte


Func VerifMapBaffeur()

Local $Color= PixelGetColor(133, 187)
   If $Color=0x0A0C09 Then
	  Return False
   Else
	  Return True
   EndIf

EndFunc

Func VerifMapFoudroyeur()
Local $Color= PixelGetColor(223, 150)
   If $Color=0x4F3C1E Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapCaresseur()
Local $Color= PixelGetColor(165, 384)
    If $Color = 0x363A15 Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapDragoFesse()
   Local $Color= PixelGetColor(220, 221)
    If $Color= 0x6E0014 Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapDragoFesse_Bonta()
   Local $Color= PixelGetColor(255, 203)
    If $Color= 0xE0002A Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapFoudroyeur_Bonta()
	  Local $Color= PixelGetColor(218,335)

    If $Color = 0x55776A Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapBaffeur_Bonta()
    Local $Color= PixelGetColor(270, 291)
    If $Color= 0xF6DEBC Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapCaresseur_Bonta()
   Local $Color= PixelGetColor(761, 496)
   If $Color = 0xACC519 Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func VerifMapMangeoir_Bonta()
     Local $Color = PixelGetColor(321, 320)
   If $Color = 0x8A4906 Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc



;Fonction de connection


Func _Connection_D_Un_Personnage()
    Local $Identifiant_Connection[2]
	 $Identifiant_Connection=_GUI_Connection()
   _Ouvrir_Launcher()
   _Attendre_Dofus_Ouvert()
   _Ndc_Mdp($Identifiant_Connection)
   _Onglet_Choix_Perso()
   Sleep(1000)

   Send("{ENTER}")
   _Attendre_Etre_InGame()

EndFunc


;Fonction de connection (luncher)

Func _Ouvrir_Launcher()
   ShellExecute("C:\Users\Bernier\AppData\Local\Ankama\Dofus/Dofus")
   _Bouton_Jouer_Launcher()
   MouseMove(0,0)
EndFunc

Func _Bouton_Jouer_Launcher()
   Local $aCoord = PixelSearch(0, 0, 1200, 700, 0xFF9900)
If Not @error Then
    MouseClick("left",$aCoord[0],$aCoord[1])
 Else
	_Bouton_Jouer_Launcher()
 EndIf
EndFunc

Func _Attendre_Dofus_Ouvert()
Local $Color = False
   Sleep(3000)
   WinActivate("Dofus")
   WinMove("Dofus","",0,0,1000,600)

  While $Color == False
	 $Color = _Attendre_Dofus_verif()

  WEnd

EndFunc

Func _Attendre_Dofus_verif()
   MsgBox("","","")
   $Color = PixelGetColor(829, 282)
	  If  $Color <> 0x5B2746 Then
		 Return False
		 ToolTip("En attente")
	  Else
		 Return True
	  EndIf
   MsgBox("","","22")
EndFunc

Func _Onglet_Choix_Perso()
   Do
	     ToolTip("Onglet choix perso",0,0)
   Until PixelGetColor(380, 483) = 0xED9D20 Or PixelGetColor(212, 294) = 0x292A21 Or PixelGetColor(277, 483) = 0xBEE700 Or PixelGetColor(396, 485) = 0xFFFFFF
EndFunc

Func _Attendre_Etre_InGame()
  Do
  Until PixelGetColor(558, 545) = 0x303024 Or PixelGetColor(555,543) = 0x303024

EndFunc

;GUI Des nom de compte Et mots de passe

Func _Ndc_Mdp($Identifiant_Connection)
  $Ecrire_Ndc_X = 445
  $Ecrire_Ndc_Y = 210
   MouseClick("left",$Ecrire_Ndc_X,$Ecrire_Ndc_Y,3) ; La case ou l'on note le nom de compte (ndc= Nom de Compte et mdp = Mot de     Passe)
   Send($Identifiant_Connection[0])
    Sleep(200)
   Send("{TAB}")
    Sleep(200)
   Send($Identifiant_Connection[1])
    Sleep(200)
   Send("{ENTER}")

EndFunc

Func _GUI_Connection()
   Local $Identifiant_Connection[2]
    GUICreate(" Connection d'un compte", 400, 200, @DesktopWidth / 3, @DesktopHeight / 4 , -1, $WS_EX_ACCEPTFILES)
    Local $Identifiant_id= GUICtrlCreateInput($Ndc, 10, 40, 300, 20)
	GUICtrlCreateLabel("Nom de compte", 30, 15)

    GUICtrlSetState(-1, $GUI_DROPACCEPTED)
    Local $mdp_id=GUICtrlCreateInput($Mdp, 10, 100, 300, 20) ; will not accept drag&drop files
	GUICtrlCreateLabel("Mot de passe", 30, 75)  ; la première cellule de 70 de large
    $idBtn = GUICtrlCreateButton("Valider", 200, 150, 140, 20)

    GUISetState(@SW_SHOW)

    ; Loop until the user exits.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
			Case $idBtn
				$Identifiant_Connection[0]=GUICtrlRead($Identifiant_id)
				$Identifiant_Connection[1]=GUICtrlRead($mdp_id)
				;msgbox(0,"","identifiant: "&$Identifiant_Connection[0]&" mdp: "&$Identifiant_Connection[1])
				Return $Identifiant_Connection
                ExitLoop
			Case $GUI_EVENT_CLOSE
                        Exit
        EndSwitch
	 WEnd
EndFunc

;Fonctions pour changer de personnage
Func _Changer_De_Perso()
   Local $Selectioner_Dernier_Perso_X = 268
   Local $Selectioner_Dernier_Perso_Y = 356
   _Croix_Changer_Perso()
   _Boutton_Changer_Perso_True()
   _Yes_Changer_Perso_True()
   _Onglet_Choix_Perso()
   MouseClick("left",$Selectioner_Dernier_Perso_X,$Selectioner_Dernier_Perso_Y,3)
EndFunc

Func _Croix_Changer_Perso()
MouseClick("left",981,40)
EndFunc

Func _Boutton_Changer_Perso()

 $SaCoord = PixelSearch(425,250,500,269,0xBEE500)
   If @error Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func _Boutton_Changer_Perso_True()
   Local $SaCoord = False
   While False
	  $SaCoord = False
	  _Boutton_Changer_Perso = $SaCoord
   WEnd
   MouseClick("Left",441,262)
EndFunc

Func _Yes_Changer_Perso()

 $SaCoord = PixelSearch(511,321,527,334,0xEC1800)
   If @error Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func _Yes_Changer_Perso_True()

   Local $SaCoord = False
   While False
	  $SaCoord = False
	  _Yes_Changer_Perso = $SaCoord
   WEnd
   MouseClick("Left",444,328)
EndFunc

;Journal de la GUI

Func _Handler_Fichier_Log()
   Local Const $Emplacement_Fichier = "C:\Users\Bernier\Desktop\Programes\Journal.txt"
   If Not FileExists($Emplacement_Fichier) Then FileWrite($Emplacement_Fichier,"")
   Return FileOpen($Emplacement_Fichier,$FO_APPEND)
EndFunc




