"Resource/UI/MainMenu.res"
{
	"MainMenu"
	{
		"ControlName"			"Frame"
		"fieldName"				"MainMenu"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"f0"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"PaintBackgroundType"	"0"
	}
				
	"BtnGameModes"
	{
		"ControlName"			"GameModes"
		"fieldName"				"BtnGameModes"

		"tabPosition"			"1"
		"navUp"					"BtnQuit"			[$X360]
		"navUp"					"BtnQuit"		[$WIN32]
		"navDown"				"BtnConsole"	[$X360]
		"navDown"				"BtnConsole"	[$WIN32]

		"xpos"					"0"
		"ypos"					"35"
		
		// needed to push the game modes carousel behind the other main menu buttons
		// that overlap into the carousel rect (which needs be oversized due to flyouts)
		// and would not get mouse hittests
		"zpos"					-10				[$WIN32]
		
		"borderimage"			"vgui/menu_mode_border"	

		"leftarrow"				"vgui/arrow_left"	
		"rightarrow"			"vgui/arrow_right"	
		"arrowwidth"			21
		"arrowheight"			21
		"arrowoffsety"			-3
		"rightarrowoffsetx"		7		[$WIN32]

		// main pic, vertically centered
		"picoffsetx"			100
		"picwidth"				153
		"picheight"				153

		// menu text, underneath pic
		"menutitlex"			100
		"menutitley"			16
		// the 360 doesn't clip text, these can be more exact to the fat main menu button
		"menutitlewide"			180	[$X360 && (!$GERMAN && !$FRENCH && !$POLISH)]
		"menutitlewide"			230	[$X360 && ($GERMAN || $FRENCH)]
		"menutitlewide"			240	[$X360 && $POLISH]
		// the pc clips text, these need to be wider for the hint, but then use wideatopen to foreshorten the flyout
		"menutitlewide"			500	[$WIN32]
		"wideatopen"			180	[$WIN32 && (!$GERMAN && !$FRENCH && !$POLISH)]
		"wideatopen"			230	[$WIN32 && ($GERMAN || $FRENCH)]
		"wideatopen"			240	[$WIN32 && $POLISH]
		"menutitletall"			80

		// small pics, vertically centered, to the right of the main pic
		"subpics"				5		[$X360WIDE || $WIN32WIDE]
		"subpics"				3		[!($X360WIDE || $WIN32WIDE)]
		"subpicgap"				6		// between pics
		"subpicoffsetx"			20		[$X360]
		"subpicoffsetx"			50		[$WIN32]
		"subpicoffsety"			-10
		"subpicwidth"			86	
		"subpicheight"			86
		"subpicnamefont"		"Default"
		"hidelabels"			"1"		[!$ENGLISH]	

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSS"
			"name"				"Split-Screen"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitModesFlyout"
			"menutitle"			"PANTALLA DIVIDIDA"
			"menuhint"			"Jugar en el modo de pantalla dividida en un servidor local"
		}				

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCoOp"
			"name"				"#L4D360UI_ModeCaps_COOP"
			"image"				"vgui/menu_mode_campaign"
			"command"			"FlmCampaignFlyout"
			"menutitle"			"#L4D360UI_MainMenu_CoOp"
			"menuhint"			"#L4D360UI_MainMenu_CoOp_Tip"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPlayChallenge"
			"name"				"#L4D360UI_ModeCaps_CHALLENGE"
			"image"				"vgui/menu_mode_mutation"
			"command"			"PlayChallenge"
			"menutitle"			"#L4D360UI_MainMenu_PlayChallenge"
			"menuhint"			" "
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"challengemode"		"1"
			"enabled"			"0"									[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPlayRealism"
			"name"				"#L4D360UI_ModeCaps_REALISM"
			"image"				"vgui/menu_mode_realism"
			"command"			"FlmRealismFlyout"
			"menutitle"			"#L4D360UI_MainMenu_Realism"
			"menuhint"			"#L4D360UI_MainMenu_Realism_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"enabled"			"0"									[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnVersus"
			"name"				"#L4D360UI_ModeCaps_VERSUS"
			"image"				"vgui/menu_mode_versus"
			"command"			"VersusSoftLock"
			"menutitle"			"#L4D360UI_MainMenu_Versus"
			"menuhint"			"#L4D360UI_MainMenu_Versus_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"enabled"			"0"									[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnRealismVersus"
			"name"				"#L4D360UI_ModeCaps_mutation12_short"
			"image"				"vgui/menu_mode_realismversus"
			"command"			"FlmRealismVersusFlyout"						
			"menutitle"			"#L4D360UI_ModeCaps_mutation12"
			"menuhint"			"#L4D360UI_MainMenu_PlayChallenge_Tip_mutation12"			
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"enabled"			"0"									[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSurvival"
			"name"				"#L4D360UI_ModeCaps_SURVIVAL"
			"image"				"vgui/menu_mode_survival"
			"command"			"SurvivalCheck"
			"menutitle"			"#L4D360UI_MainMenu_Survival"
			"menuhint"			"#L4D360UI_MainMenu_Survival_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"enabled"			"0"									[$DEMO]
		}
		
				"mode" [!$X360GUEST]
		{
			"id"				"BtnVersusSurvival"
			"name"				"#L4D360UI_ModeCaps_mutation15_short"
			"image"				"vgui/menu_mode_versussurvival"
			"command"			"FlmVersusSurvivalFlyout"						
			"menutitle"			"#L4D360UI_ModeCaps_mutation15"
			"menuhint"			"#L4D360UI_MainMenu_PlayChallenge_Tip_mutation15"			
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"enabled"			"0"									[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnScavenge"
			"name"				"#L4D360UI_ModeCaps_SCAVENGE"
			"image"				"vgui/menu_mode_scavenge"
			"command"			"ScavengeCheck"
			"menutitle"			"#L4D360UI_MainMenu_Scavenge"
			"menuhint"			"#L4D360UI_MainMenu_Scavenge_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"enabled"			"0"									[$DEMO]
		}
		
		"mode" [!$X360SPLITSCREEN]
		{
			"id"				"BtnPlaySolo"
			"name"				"#L4D360UI_ModeCaps_offline_SP"
			"image"				"vgui/menu_mode_singleplayer"
			"command"			"SoloPlay"
			"menutitle"			"#L4D360UI_MainMenu_PlaySolo"
			"menuhint"			"#L4D360UI_MainMenu_PlaySolo_Tip"
		}	
		"mode" [$X360SPLITSCREEN]
		{
			"id"				"BtnPlaySolo"
			"name"				"#L4D360UI_ModeCaps_offline_SS"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"SoloPlay"
			"menutitle"			"#L4D360UI_MainMenu_PlaySplitscreen"
			"menuhint"			"#L4D360UI_MainMenu_OfflineCoOp_Tip"
		}
	}

	"BtnGameModesSS"
	{
		"ControlName"			"GameModes"
		"fieldName"				"BtnGameModesSS"
		"visible"				"0"
	    "tabPosition"			"1"
		"navUp"					"BtnBlogPost"			[$X360]
		"navUp"					"PnlQuickJoin"		[$WIN32]
		"navDown"				"BtnChangeGamers"	[$X360]
		"navDown"				"BtnModeSearch"	[$WIN32]

		"xpos"					"0"
		"ypos"					"35"
		
		// needed to push the game modes carousel behind the other main menu buttons
		// that overlap into the carousel rect (which needs be oversized due to flyouts)
		// and would not get mouse hittests
		"zpos"					-10				[$WIN32]
		
		"borderimage"			"vgui/menu_mode_border"	

		"leftarrow"				"vgui/arrow_left"	
		"rightarrow"			"vgui/arrow_right"	
		"arrowwidth"			21
		"arrowheight"			21
		"arrowoffsety"			-3
		"rightarrowoffsetx"		7		[$WIN32]

		// main pic, vertically centered
		"picoffsetx"			100
		"picwidth"				153
		"picheight"				153

		// menu text, underneath pic
		"menutitlex"			100
		"menutitley"			16
		// the 360 doesn't clip text, these can be more exact to the fat main menu button
		"menutitlewide"			180	[$X360 && (!$GERMAN && !$FRENCH && !$POLISH)]
		"menutitlewide"			230	[$X360 && ($GERMAN || $FRENCH)]
		"menutitlewide"			240	[$X360 && $POLISH]
		// the pc clips text, these need to be wider for the hint, but then use wideatopen to foreshorten the flyout
		"menutitlewide"			500	[$WIN32]
		"wideatopen"			180	[$WIN32 && (!$GERMAN && !$FRENCH && !$POLISH)]
		"wideatopen"			230	[$WIN32 && ($GERMAN || $FRENCH)]
		"wideatopen"			240	[$WIN32 && $POLISH]
		"menutitletall"			80

		// small pics, vertically centered, to the right of the main pic
		"subpics"				5		[$X360WIDE || $WIN32WIDE]
		"subpics"				3		[!($X360WIDE || $WIN32WIDE)]
		"subpicgap"				6		// between pics
		"subpicoffsetx"			20		[$X360]
		"subpicoffsetx"			50		[$WIN32]
		"subpicoffsety"			-10
		"subpicwidth"			86	
		"subpicheight"			86
		"subpicnamefont"		"Default"
		"hidelabels"			"1"		[!$ENGLISH]			

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCP"
			"name"				"CoOp"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitFlyout"
			"menutitle"			"Campaign"
			"menuhint"			"Play Split-Screen CoOp"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnRL"
			"name"				"Realism"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitRLFlyout"
			"menutitle"			"Realism"
			"menuhint"			"Play Split-Screen Realism"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnVS"
			"name"				"Versus"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitVerFlyout"
			"menutitle"			"Versus"
			"menuhint"			"Play Split-Screen Versus"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnRV"
			"name"				"Realism Versus"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitRVerFlyout"
			"menutitle"			"Relaism Versus"
			"menuhint"			"Play Split-Screen Versus"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSV"
			"name"				"Survival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitSVFlyout"
			"menutitle"			"Survival"
			"menuhint"			"Play Split-Screen Survival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSE"
			"name"				"Scavenge"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitSEFlyout"
			"menutitle"			"Scavenge"
			"menuhint"			"Play Split-Screen Scavenge"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSSMode"
			"name"				"Split-Screen Mode"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSSModeFlyout"
			"menutitle"			"SplitScreen Mode"
			"menuhint"			"Select Split-Screen Mode"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD1"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCD1Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD2"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCD2Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD3"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCD3Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD1"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD1Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD2"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD2Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD3"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD3Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD4"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD4Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD1"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCD1Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD2"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCD2Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD3"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCD3Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD1"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD1Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD2"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD2Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD3"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD3Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD4"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD4Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD1"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD1Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD2"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD2Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD3"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD3Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD4"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD4Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCD"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCD1"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCD1Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCD2"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCD2Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCD"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCD1"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCD1Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCD2"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCD2Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD1"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD1Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD2"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD2Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD3"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD3Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD4"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD4Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCD"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCD1"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCD1Flyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDSE2"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDSE2Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD1"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD1Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD2"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD2Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD3"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD3Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD4"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD4Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDFlyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDSE3"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDSE3Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD1"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD1Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD2"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD2Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD3"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD3Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD4"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD4Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDSE4"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDSE4Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD1"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD1Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD2"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD2Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD3"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD3Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD4"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD4Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD1"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCD1Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
				"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD2"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCD2Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD3"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCD3Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRLFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL1"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRL1Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL2"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRL2Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL3"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRL3Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRV"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRVFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRV1"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRV1Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRV2"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRV2Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRV3"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRV3Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRLFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL1"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL1Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL2"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL2Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL3"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL3Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL4"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL4Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
				"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRV"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRVFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRV1"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRV1Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRV2"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRV2Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRV3"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRV3Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRV4"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRV4Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRLFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL1"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRL1Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL2"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRL2Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL3"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRL3Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
			"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRV"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRVFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRV1"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRV1Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRV2"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRV2Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRV3"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRV3Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRLFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL1"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL1Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL2"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL2Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL3"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL3Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL4"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL4Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRV"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRVFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRV1"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRV1Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRV2"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRV2Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRV3"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRV3Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRV4"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRV4Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRLFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL1"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL1Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL2"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL2Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL3"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL3Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL4"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL4Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRV"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRVFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRV1"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRV1Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRV2"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRV2Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRV3"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRV3Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRV4"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRV4Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRL"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRLFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRL1"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRL1Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRL2"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRL2Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRV"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRVFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRV1"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRV1Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRV2"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRV2Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRL"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRLFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRL1"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRL1Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRL2"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRL2Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRV"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRVFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRV1"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRV1Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRV2"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRV2Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRLFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL1"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL1Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL2"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL2Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL3"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL3Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL4"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL4Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRV"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRVFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRV1"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRV1Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRV2"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRV2Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRV3"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRV3Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRV4"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRV4Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDRL"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDRLFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDRL1"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDRL1Flyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDRV"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDRVFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDRV1"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDRV1Flyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDRLFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL1"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL1Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL2"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL2Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL3"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL3Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL4"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL4Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRV"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDRVFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRV1"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRV1Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRV2"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRV2Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRV3"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRV3Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRV4"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRV4Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRLFlyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL1"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL1Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL2"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL2Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL3"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL3Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL4"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL4Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRV"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRVFlyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRV1"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRV1Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRV2"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRV2Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRV3"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRV3Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRV4"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRV4Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRLFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL1"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL1Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL2"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL2Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL3"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL3Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL4"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL4Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRV"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRVFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRV1"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRV1Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRV2"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRV2Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRV3"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRV3Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRV4"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRV4Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRLFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL1"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRL1Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
				"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL2"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRL2Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL3"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRL3Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRV"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRVFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRV1"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRV1Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
				"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRV2"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRV2Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRV3"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRV3Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDV"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDVFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDV1"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDV1Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDV2"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDV2Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDV3"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDV3Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDV"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDVFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDV1"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDV1Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDV2"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDV2Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDV3"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDV3Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDV4"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDV4Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDV"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDVFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDV1"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDV1Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDV2"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDV2Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDV3"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDV3Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDV"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDVFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDV1"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDV1Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDV2"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDV2Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDV3"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDV3Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDV4"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDV4Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDV"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDVFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDV1"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDV1Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDV2"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDV2Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDV3"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDV3Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDV4"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDV4Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDV"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDVFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDV1"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDV1Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDV2"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDV2Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDV"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDVFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDV1"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDV1Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDV2"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDV2Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDV"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDVFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDV1"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDV1Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDV2"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDV2Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDV3"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDV3Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDV4"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDV4Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDV"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDVFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDV1"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDV1Flyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDV"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDVFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDV1"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDV1Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDV2"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDV2Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDV3"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDV3Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDV4"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDV4Flyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDV"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDVFlyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDV1"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDV1Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDV2"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDV2Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDV3"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDV3Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDV4"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDV4Flyout"
			"menutitle"			"Dead Air"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDV"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDVFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDV1"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDV1Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDV2"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDV2Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDV3"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDV3Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDV4"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDV4Flyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDV"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDVFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDV1"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDV1Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
				"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDV2"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDV2Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDV3"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDV3Flyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
	    "mode" [!$X360GUEST]
		{
			"id"				"BtnDC"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCL"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSF"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHR"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPS"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPG"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSC"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNM"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCC"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDT"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTSE"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTSEFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDA"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDAFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDASE"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDASEFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBH"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHSE"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHSEFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCS"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Cold Stream"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCV"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCVFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLV"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLVFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFV"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFVFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRV"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRVFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSV"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSVFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGV"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGVFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCV"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCVFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMV"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMVFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCV"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCVFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTV"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTVFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDAV"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDAVFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHV"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHVFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSV"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSVFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Cold Stream"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCSV"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCSVFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCSE"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCSEFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLSV"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLSVFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLSE"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLSEFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFSV"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFSVFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFSE"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFSEFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRSV"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRSVFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRSE"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRSEFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSSV"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSSVFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
	"mode" [!$X360GUEST]
		{
			"id"				"BtnPSSE"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSSEFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGSV"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGSVFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGSE"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGSEFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCSV"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCSVFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCSE"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCSEFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMSV"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMSVFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMSE"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMSEFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCRL"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCRLFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCRV"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCRVFlyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLRL"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLRLFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLRV"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLRVFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFRL"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFRLFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFRV"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFRVFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRRL"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRRLFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRRV"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRRVFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSRL"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSRLFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSRV"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSRVFlyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGRL"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGRLFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGRV"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGRVFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCRL"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCRLFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCRV"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCRVFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMRL"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMRLFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMRV"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMRVFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCRL"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCRLFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCRV"
			"name"				"Crash Course"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCRVFlyout"
			"menutitle"			"Crash Course"
			"menuhint"			"Play Split-Screen Crash Course"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTRL"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTRLFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTRV"
			"name"				"Death Toll"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTRVFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Death Toll"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDARL"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDARLFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDARV"
			"name"				"Dead Air"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDARVFlyout"
			"menutitle"			"Death Toll"
			"menuhint"			"Play Split-Screen Dead Air"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHRL"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHRLFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHRV"
			"name"				"Blood Harvest"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHRVFlyout"
			"menutitle"			"Blood Harvest"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSRL"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSRLFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Cold Stream"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSRV"
			"name"				"Cold Stream"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSRVFlyout"
			"menutitle"			"Cold Stream"
			"menuhint"			"Play Split-Screen Cold Stream"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDSV3"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDSV3Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDSE3"
			"name"				"Dead Center"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDSE3Flyout"
			"menutitle"			"Dead Center"
			"menuhint"			"Play Split-Screen Dead Center"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDSV"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDSVFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDSE"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDSEFlyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDSV3"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDSV3Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDSV4"
			"name"				"Dark Carnival"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDSV4Flyout"
			"menutitle"			"Dark Carnival"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDSV"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDSVFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDSE"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDSEFlyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDSV3"
			"name"				"Swamp Fever"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDSV3Flyout"
			"menutitle"			"Swamp Fever"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDSV"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDSVFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDSV1"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDSV1Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDSE"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDSEFlyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDSE1"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDSE1Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDSE2"
			"name"				"Hard Rain"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDSE2Flyout"
			"menutitle"			"Hard Rain"
			"menuhint"			"Play Split-Screen Hard Rain"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDSV1"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDSV1Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDSE1"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDSE1Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDSV4"
			"name"				"The Parish"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDSV4Flyout"
			"menutitle"			"The Parish"
			"menuhint"			"Play Split-Screen The Parish"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDSV"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDSVFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDSV1"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDSV1Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDSV2"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDSV2Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDSE"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDSEFlyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDSE1"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDSE1Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDSE2"
			"name"				"The Passing"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDSE2Flyout"
			"menutitle"			"The Passing"
			"menuhint"			"Play Split-Screen The Passing"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDSV"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDSVFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDSV2"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDSV2Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDSE"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDSEFlyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDSE1"
			"name"				"The Sacrifice"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDSE1Flyout"
			"menutitle"			"The Sacrifice"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDSV1"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDSV1Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDSV4"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDSV4Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDSE"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDSEFlyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDSE4"
			"name"				"No Mercy"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDSE4Flyout"
			"menutitle"			"No Mercy"
			"menuhint"			"Play Split-Screen No Mercy"
		}
    }
   
	"BtnChangeGamers"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnChangeGamers"
		"xpos"					"100"
		"ypos"					"295"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"		[!$X360GUEST]
		"enabled"				"0"		[!$X360GUEST]
		"visible"				"1"		[$X360GUEST]
		"enabled"				"1"		[$X360GUEST]
		"tabPosition"			"0"
		"navUp"					"BtnGameModes"
		"navDown"				"BtnConsole"
		"labelText"				"#L4D360UI_MainMenu_SignIn"
		"tooltiptext"			"#L4D360UI_MainMenu_ChangeGamers_Tip"
		"style"					"MainMenuButton"
		"command"				"ChangeGamers"
		"ActivationType"		"1"
	}
	
	"BtnConsole"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnConsole"
		"xpos"					"100"
		"ypos"					"255"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0" [$X360]
		"visible"				"1" [$WIN32]
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnChangeGamers"
		"navDown"				"BtnOpenServer"
		"labelText"				"ABRIR CONSOLA"
		"tooltiptext"			"Open Developer Console"
		"style"					"MainMenuButton"
		"command"				"#con_enable 1;toggleconsole"
		"ActivationType"		"1"
	}	
	
	"BtnOpenServer"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnOpenServer"
		"xpos"					"100"
		"ypos"					"275"
		"wide"					"210"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"		[$X360GUEST]
		"enabled"				"1"		[$X360GUEST]
		"visible"				"1"		[!$X360GUEST]
		"enabled"				"1"		[!$X360GUEST]
		"tabPosition"			"0"
		"navUp"					"BtnConsole"
		"navDown"				"BtnStatsAndAchievements"
		"labelText"				"BUSCAR SERVIDORES"
		"tooltiptext"			"#L4D360UI_MainMenu_StatsAndAchievements_Tip"	[$X360]
		"tooltiptext"			"Look for a server using the server list."	[$WIN32]
		"style"					"MainMenuButton"
		"command"				"OpenServerBrowser"
		"ActivationType"		"1"
		"EnableCondition"		"Never" [$DEMO]
	}		

	"BtnStatsAndAchievements"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnStatsAndAchievements"
		"xpos"					"100"
		"ypos"					"295"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"		[$X360GUEST]
		"enabled"				"0"		[$X360GUEST]
		"visible"				"1"		[!$X360GUEST]
		"enabled"				"1"		[!$X360GUEST]
		"tabPosition"			"0"
		"navUp"					"BtnOpenServer"
		"navDown"				"BtnOptions"
		"labelText"				"#L4D360UI_MainMenu_StatsAndAchievements"
		"tooltiptext"			"#L4D360UI_MainMenu_StatsAndAchievements_Tip"	[$X360]
		"tooltiptext"			"#L4D360UI_MainMenu_PCStatsAndAchievements_Tip"	[$WIN32]
		"style"					"MainMenuButton"
		"command"				"StatsAndAchievements"
		"ActivationType"		"1"
		"EnableCondition"		"Never" [$DEMO]
	}
	
	"BtnOptions"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnOptions"
		"xpos"					"100"
		"ypos"					"315"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnStatsAndAchievements"
		"navDown"				"BtnExtras"
		"labelText"				"#L4D360UI_MainMenu_Options"
		"tooltiptext"			"#L4D360UI_MainMenu_Options_Tip"
		"style"					"MainMenuButton"
		"command"				"FlmOptionsFlyout"			[!$X360GUEST]
		"command"				"FlmOptionsGuestFlyout"		[$X360GUEST]	
		"ActivationType"		"1"
	}
	
	"BtnExtras"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnExtras"
		"xpos"					"100"
		"ypos"					"335"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnOptions"
		"navDown"				"BtnQuit"
		"labelText"				"#L4D360UI_MainMenu_Extras"
		"tooltiptext"			"#L4D360UI_MainMenu_Extras_Tip"
		"style"					"MainMenuButton"
		"command"				"FlmExtrasFlyoutCheck"
		"ActivationType"		"1"
		"EnableCondition"					"Never" [$DEMO]
	}

	"IconBlogPost"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconBlogPost"
		"xpos"					"75"
		"ypos"					"255"
		"wide"					"20"
		"tall"					"20"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"consolesfk"
		"frame"					"0"
		"scaleImage"			"1"
	}	

	"BtnQuit"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnQuit"
		"xpos"					"100"
		"ypos"					"355"
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0" [$X360]
		"visible"				"1" [$WIN32]
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnExtras"
		"navDown"				"BtnGameModes"
		"labelText"				"#L4D360UI_MainMenu_Quit"
		"tooltiptext"			"#L4D360UI_MainMenu_Quit_Tip"
		"style"					"MainMenuButton"
		"command"				"QuitGame"
		"ActivationType"		"1"
	}
				
	"FlmCampaignFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCampaignFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/CampaignFlyout.res"
	}

	"FlmRealismFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmRealismFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/RealismFlyout.res"
	}
	
	"FlmSurvivalFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSurvivalFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/SurvivalFlyout.res"
	}

	"FlmScavengeFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmScavengeFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/ScavengeFlyout.res"
	}
	
	"FlmSplitFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDC"
		"ResourceFile"			"resource/UI/L4D360UI/SplitFlyout.res"
	}
	
	"FlmSplitModesFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitModesFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCP"
		"ResourceFile"			"resource/UI/L4D360UI/SplitModesFlyout.res"
	}
	
	"FlmSplitVerFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitVerFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDC"
		"ResourceFile"			"resource/UI/L4D360UI/SplitVerFlyout.res"
	}
	
	"FlmSplitRVerFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitRVerFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCRV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitRVerFlyout.res"
	}
	
	"FlmSplitSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitSVFlyout.res"
	}
	
	"FlmSplitSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCSE"
		"ResourceFile"			"resource/UI/L4D360UI/SplitSEFlyout.res"
	}
	
	"FlmSplitRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnVSA"
		"ResourceFile"			"resource/UI/L4D360UI/SplitRLFlyout.res"
	}

	"FlmVersusFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVersusFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/VersusFlyout.res"
	}

	"FlmRealismVersusFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmRealismVersusFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/RealismVersusFlyout.res"
	}
	
		"FlmVersusSurvivalFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVersusSurvivalFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/VersusSurvivalFlyout.res"
	}
	
	"FlmMutationCategories"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMutationCategories"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/MutationCategoriesFlyout.res"
	}

	"FlmMutationSolo"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMutationSolo"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/MutationSoloFlyout.res"
	}

	"FlmMutationCoop"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMutationCoop"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/MutationCoopFlyout.res"
	}

	"FlmMutationVersus"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMutationVersus"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/MutationVersusFlyout.res"
	}

	"FlmChallengeFlyout1"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmChallengeFlyout1"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/mainmenu_flyout_challenge1.res"
	}

	"FlmChallengeFlyout4"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmChallengeFlyout4"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/mainmenu_flyout_challenge4.res"
	}

	"FlmChallengeFlyout8"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmChallengeFlyout8"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnQuickMatch"
		"ResourceFile"			"resource/UI/L4D360UI/mainmenu_flyout_challenge8.res"
	}
	
	"FlmBtnReAudFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBtnReAudFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnRebuildAudio"	[$X360]
		"InitialFocus"			"BtnRebuildAudio"	[$WIN32]
		"ResourceFile"			"resource/UI/L4D360UI/ReAudFlyout.res"
	}
	
    "FlmBtnSFK"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBtnSFK"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDC"	[$X360]
		"InitialFocus"			"BtnDC"	[$WIN32]
		"ResourceFile"			"resource/UI/L4D360UI/SplitFlyout.res"
	}
	
	"FlmOptionsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmOptionsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnAudioVideo"	[$X360]
		"InitialFocus"			"BtnVideo"	[$WIN32]
		"ResourceFile"			"resource/UI/L4D360UI/OptionsFlyout.res"
	}
	
	"FlmDCCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDFlyout.res"
	}
	
	"FlmDCCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCD1Flyout.res"
	}
	
	"FlmDCCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCD2Flyout.res"
	}
	
	"FlmDCCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCD3Flyout.res"
	}
	
	"FlmDCFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDC"
		"ResourceFile"			"resource/UI/L4D360UI/DCFlyout.res"
	}
	
	"FlmDCLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCL"
		"ResourceFile"			"resource/UI/L4D360UI/DCLFlyout.res"
	}
	
	"FlmDCLCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDFlyout.res"
	}
	
	"FlmDCLCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCD1Flyout.res"
	}
	
	"FlmDCLCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCD2Flyout.res"
	}
	
	"FlmDCLCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCD3Flyout.res"
	}
	
	"FlmDCLCD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCD4Flyout.res"
	}
	
	"FlmSFFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSF"
		"ResourceFile"			"resource/UI/L4D360UI/SFFlyout.res"
	}
	
	"FlmSFCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDFlyout.res"
	}
	
	"FlmSFCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCD1Flyout.res"
	}
	
	"FlmSFCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCD2Flyout.res"
	}
	
	"FlmSFCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCD3Flyout.res"
	}
	
	"FlmHRFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHR"
		"ResourceFile"			"resource/UI/L4D360UI/HRFlyout.res"
	}
	
	"FlmHRCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDFlyout.res"
	}
	
	"FlmHRCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCD1Flyout.res"
	}
	
	"FlmHRCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCD2Flyout.res"
	}
	
	"FlmHRCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCD3Flyout.res"
	}
	
	"FlmHRCD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCD4Flyout.res"
	}
	
	"FlmPSFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPS"
		"ResourceFile"			"resource/UI/L4D360UI/PSFlyout.res"
	}
	
	"FlmPSCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDFlyout.res"
	}
	
	"FlmPSCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCD1Flyout.res"
	}
	
	"FlmPSCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCD2Flyout.res"
	}
	
	"FlmPSCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCD3Flyout.res"
	}
	
	"FlmPSCD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCD4Flyout.res"
	}
	
	"FlmPGFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPG"
		"ResourceFile"			"resource/UI/L4D360UI/PGFlyout.res"
	}
	
	"FlmPGCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDFlyout.res"
	}
	
	"FlmPGCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCD1Flyout.res"
	}
	
	"FlmPGCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCD2Flyout.res"
	}
	
	"FlmSCFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSC"
		"ResourceFile"			"resource/UI/L4D360UI/SCFlyout.res"
	}
	
	"FlmSCCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDFlyout.res"
	}
	
	"FlmSCCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCD1Flyout.res"
	}
	
	"FlmSCCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCD2Flyout.res"
	}
	
	"FlmNMFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMFlyout.res"
	}
	
	"FlmNMCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDFlyout.res"
	}
	
	"FlmNMCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCD1Flyout.res"
	}
	
	"FlmNMCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCD2Flyout.res"
	}
	
	"FlmNMCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCD3Flyout.res"
	}
	
	"FlmNMCD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCD4Flyout.res"
	}
	
	"FlmCCFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCC"
		"ResourceFile"			"resource/UI/L4D360UI/CCFlyout.res"
	}
	
	"FlmCCCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDFlyout.res"
	}
	
	"FlmCCCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCD1Flyout.res"
	}
	
	"FlmDTFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDT"
		"ResourceFile"			"resource/UI/L4D360UI/DTFlyout.res"
	}
	
	"FlmDTSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDT"
		"ResourceFile"			"resource/UI/L4D360UI/DTSEFlyout.res"
	}
	
	"FlmDTCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDFlyout.res"
	}
	
	"FlmDTCDSE2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDSE2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDSE2Flyout.res"
	}
	
	"FlmDTCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCD1Flyout.res"
	}
	
	"FlmDTCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCD2Flyout.res"
	}
	
	"FlmDTCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCD3Flyout.res"
	}
	
	"FlmDTCD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCD4Flyout.res"
	}
	
	"FlmDAFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDAFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDA"
		"ResourceFile"			"resource/UI/L4D360UI/DAFlyout.res"
	}
	
	"FlmDASEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDASEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDASE"
		"ResourceFile"			"resource/UI/L4D360UI/DASEFlyout.res"
	}
	
	"FlmDACDSE3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDSE3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDSE3Flyout.res"
	}
	
	"FlmDACDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDFlyout.res"
	}
	
	"FlmDACD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACD1Flyout.res"
	}
	
	"FlmDACD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACD2Flyout.res"
	}
	
	"FlmDACD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACD3Flyout.res"
	}
	
	"FlmDACD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACD4Flyout.res"
	}
	
    "FlmBHFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/BHFlyout.res"
	}
	
	"FlmBHSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHSE"
		"ResourceFile"			"resource/UI/L4D360UI/BHSEFlyout.res"
	}
	
	"FlmBHCDSE4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDSE4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDSE4Flyout.res"
	}
	
	"FlmBHCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDFlyout.res"
	}
	
	"FlmBHCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCD1Flyout.res"
	}
	
	"FlmBHCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCD2Flyout.res"
	}
	
	"FlmBHCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCD3Flyout.res"
	}
	
	"FlmBHCD4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCD4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCD4Flyout.res"
	}
	
	"FlmCSFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCS"
		"ResourceFile"			"resource/UI/L4D360UI/CSFlyout.res"
	}
	
    "FlmCSCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDFlyout.res"
	}
	
	"FlmCSCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCD1Flyout.res"
	}
	
	"FlmCSCD2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCD2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCD2Flyout.res"
	}
	
	"FlmCSCD3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCD3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCD3Flyout.res"
	}
	
	"FlmDCVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDC"
		"ResourceFile"			"resource/UI/L4D360UI/DCVFlyout.res"
	}
	
	"FlmDCCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDVFlyout.res"
	}
	
	"FlmDCCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDV1Flyout.res"
	}
	
	"FlmDCCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDV2Flyout.res"
	}
	
	"FlmDCCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDV3Flyout.res"
	}
	
	"FlmDCLVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCL"
		"ResourceFile"			"resource/UI/L4D360UI/DCLVFlyout.res"
	}
	
	"FlmDCLCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDVFlyout.res"
	}
	
	"FlmDCLCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDV1Flyout.res"
	}
	
	"FlmDCLCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDV2Flyout.res"
	}
	
	"FlmDCLCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDV3Flyout.res"
	}
	
	"FlmDCLCDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDV4Flyout.res"
	}
	
	"FlmSFVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSF"
		"ResourceFile"			"resource/UI/L4D360UI/SFVFlyout.res"
	}
	
	"FlmSFCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDVFlyout.res"
	}
	
	"FlmSFCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDV1Flyout.res"
	}
	
	"FlmSFCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDV2Flyout.res"
	}
	
	"FlmSFCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDV3Flyout.res"
	}
	
	"FlmHRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHR"
		"ResourceFile"			"resource/UI/L4D360UI/HRVFlyout.res"
	}
	
	"FlmHRCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDVFlyout.res"
	}
	
	"FlmHRCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDV1Flyout.res"
	}
	
	"FlmHRCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDV2Flyout.res"
	}
	
	"FlmHRCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDV3Flyout.res"
	}
	
	"FlmHRCDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDV4Flyout.res"
	}
	
	"FlmPSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPS"
		"ResourceFile"			"resource/UI/L4D360UI/PSVFlyout.res"
	}
	
	"FlmPSCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDVFlyout.res"
	}
	
	"FlmPSCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDV1Flyout.res"
	}
	
	"FlmPSCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDV2Flyout.res"
	}
	
	"FlmPSCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDV3Flyout.res"
	}
	
	"FlmPSCDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDV4Flyout.res"
	}
	
	"FlmPGVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPG"
		"ResourceFile"			"resource/UI/L4D360UI/PGVFlyout.res"
	}
	
	"FlmPGCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDVFlyout.res"
	}
	
	"FlmPGCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDV1Flyout.res"
	}
	
	"FlmPGCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDV2Flyout.res"
	}
	
	"FlmSCVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSC"
		"ResourceFile"			"resource/UI/L4D360UI/SCVFlyout.res"
	}
	
	"FlmSCCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDVFlyout.res"
	}
	
	"FlmSCCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDV1Flyout.res"
	}
	
	"FlmSCCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDV2Flyout.res"
	}
	
	"FlmNMVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMVFlyout.res"
	}
	
	"FlmNMCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDVFlyout.res"
	}
	
	"FlmNMCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDV1Flyout.res"
	}
	
	"FlmNMCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDV2Flyout.res"
	}
	
	"FlmNMCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDV3Flyout.res"
	}
	
	"FlmNMCDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDV4Flyout.res"
	}
	
	"FlmCCVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCC"
		"ResourceFile"			"resource/UI/L4D360UI/CCVFlyout.res"
	}
	
	"FlmCCCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDVFlyout.res"
	}
	
	"FlmCCCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDV1Flyout.res"
	}
	
	"FlmDTVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDT"
		"ResourceFile"			"resource/UI/L4D360UI/DTVFlyout.res"
	}
	
	"FlmDTCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDVFlyout.res"
	}
	
	"FlmDTCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDV1Flyout.res"
	}
	
	"FlmDTCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDV2Flyout.res"
	}
	
	"FlmDTCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDV3Flyout.res"
	}
	
	"FlmDTCDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDV4Flyout.res"
	}
	
	"FlmDAVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDAVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDA"
		"ResourceFile"			"resource/UI/L4D360UI/DAVFlyout.res"
	}
	
	"FlmDACDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDVFlyout.res"
	}
	
	"FlmDACDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDV1Flyout.res"
	}
	
	"FlmDACDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDV2Flyout.res"
	}
	
	"FlmDACDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDV3Flyout.res"
	}
	
	"FlmDACDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDV4Flyout.res"
	}
	
    "FlmBHVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/BHVFlyout.res"
	}
	
	"FlmBHCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDVFlyout.res"
	}
	
	"FlmBHCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDV1Flyout.res"
	}
	
	"FlmBHCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDV2Flyout.res"
	}
	
	"FlmBHCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDV3Flyout.res"
	}
	
	"FlmBHCDV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDV4Flyout.res"
	}
	
	"FlmCSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCS"
		"ResourceFile"			"resource/UI/L4D360UI/CSVFlyout.res"
	}
	
	"FlmCSCDVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDVFlyout.res"
	}
	
	"FlmCSCDV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDV1Flyout.res"
	}
	
	"FlmCSCDV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDV2Flyout.res"
	}
	
	"FlmCSCDV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDV3Flyout.res"
	}
	
	"FlmDCSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCSV"
		"ResourceFile"			"resource/UI/L4D360UI/DCSVFlyout.res"
	}
	
	"FlmDCSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCSEFlyout.res"
	}
	
	"FlmDCLSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLSV"
		"ResourceFile"			"resource/UI/L4D360UI/DCLSVFlyout.res"
	}
	
	"FlmDCLSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLSE"
		"ResourceFile"			"resource/UI/L4D360UI/DCLSEFlyout.res"
	}
	
	"FlmDCLCDSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDSEFlyout.res"
	}
	
	"FlmSFSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFSV"
		"ResourceFile"			"resource/UI/L4D360UI/SFSVFlyout.res"
	}
	
	"FlmSFSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFSE"
		"ResourceFile"			"resource/UI/L4D360UI/SFSEFlyout.res"
	}
	
	"FlmHRSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRSV"
		"ResourceFile"			"resource/UI/L4D360UI/HRSVFlyout.res"
	}
	
	"FlmHRSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRSE"
		"ResourceFile"			"resource/UI/L4D360UI/HRSEFlyout.res"
	}
	
	"FlmPSSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSSV"
		"ResourceFile"			"resource/UI/L4D360UI/PSSVFlyout.res"
	}
	
	"FlmPSSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSSE"
		"ResourceFile"			"resource/UI/L4D360UI/PSSEFlyout.res"
	}
	
	"FlmPGSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGSV"
		"ResourceFile"			"resource/UI/L4D360UI/PGSVFlyout.res"
	}
	
	"FlmPGSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGSE"
		"ResourceFile"			"resource/UI/L4D360UI/PGSEFlyout.res"
	}
	
	"FlmSCSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SCSVFlyout.res"
	}
	
	"FlmSCSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCSE"
		"ResourceFile"			"resource/UI/L4D360UI/SCSEFlyout.res"
	}
	
	"FlmNMSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMSV"
		"ResourceFile"			"resource/UI/L4D360UI/NMSVFlyout.res"
	}
	
	"FlmNMSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMSE"
		"ResourceFile"			"resource/UI/L4D360UI/NMSEFlyout.res"
	}
	
	"FlmDCRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCRL"
		"ResourceFile"			"resource/UI/L4D360UI/DCRLFlyout.res"
	}
	
	"FlmDCRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCRV"
		"ResourceFile"			"resource/UI/L4D360UI/DCRVFlyout.res"
	}
	
	"FlmDCCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRLFlyout.res"
	}
	
	"FlmDCCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRL1Flyout.res"
	}
	
	"FlmDCCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRL2Flyout.res"
	}
	
	"FlmDCCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRL3Flyout.res"
	}
	
	"FlmDCCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRVFlyout.res"
	}
	
	"FlmDCCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRV1Flyout.res"
	}
	
	"FlmDCCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRV2Flyout.res"
	}
	
	"FlmDCCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDRV3Flyout.res"
	}
	
	"FlmDCLRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLRL"
		"ResourceFile"			"resource/UI/L4D360UI/DCLRLFlyout.res"
	}
	
	"FlmDCLRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLRV"
		"ResourceFile"			"resource/UI/L4D360UI/DCLRVFlyout.res"
	}
	
	"FlmDCLCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRLFlyout.res"
	}
	
	"FlmDCLCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRL1Flyout.res"
	}
	
	"FlmDCLCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRL2Flyout.res"
	}
	
	"FlmDCLCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRL3Flyout.res"
	}
	
	"FlmDCLCDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRL4Flyout.res"
	}
	
	"FlmDCLCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRVFlyout.res"
	}
	
	"FlmDCLCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRV1Flyout.res"
	}
	
	"FlmDCLCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRV2Flyout.res"
	}
	
	"FlmDCLCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRV3Flyout.res"
	}
	
	"FlmDCLCDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDRV4Flyout.res"
	}
	
	"FlmSFRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFRL"
		"ResourceFile"			"resource/UI/L4D360UI/SFRLFlyout.res"
	}
	
	"FlmSFRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFRV"
		"ResourceFile"			"resource/UI/L4D360UI/SFRVFlyout.res"
	}
	
	"FlmSFCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRLFlyout.res"
	}
	
	"FlmSFCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRL1Flyout.res"
	}
	
	"FlmSFCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRL2Flyout.res"
	}
	
	"FlmSFCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRL3Flyout.res"
	}
	
	"FlmSFCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRVFlyout.res"
	}
	
	"FlmSFCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRV1Flyout.res"
	}
	
	"FlmSFCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRV2Flyout.res"
	}
	
	"FlmSFCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDRV3Flyout.res"
	}
	
	"FlmHRRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRRL"
		"ResourceFile"			"resource/UI/L4D360UI/HRRLFlyout.res"
	}
	
	"FlmHRRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRRV"
		"ResourceFile"			"resource/UI/L4D360UI/HRRVFlyout.res"
	}
	
	"FlmHRCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRLFlyout.res"
	}
	
	"FlmHRCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRL1Flyout.res"
	}
	
	"FlmHRCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRL2Flyout.res"
	}
	
	"FlmHRCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRL3Flyout.res"
	}
	
	"FlmHRCDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRL4Flyout.res"
	}
	
	"FlmHRCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRVFlyout.res"
	}
	
	"FlmHRCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRV1Flyout.res"
	}
	
	"FlmHRCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRV2Flyout.res"
	}
	
	"FlmHRCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRV3Flyout.res"
	}
	
	"FlmHRCDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDRV4Flyout.res"
	}
	
	"FlmPSRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSRL"
		"ResourceFile"			"resource/UI/L4D360UI/PSRLFlyout.res"
	}
	
	"FlmPSRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSRL"
		"ResourceFile"			"resource/UI/L4D360UI/PSRVFlyout.res"
	}
	
	"FlmPSCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRLFlyout.res"
	}
	
	"FlmPSCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRL1Flyout.res"
	}
	
	"FlmPSCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRL2Flyout.res"
	}
	
	"FlmPSCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRL3Flyout.res"
	}
	
	"FlmPSCDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRL4Flyout.res"
	}
	
	"FlmPSCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRVFlyout.res"
	}
	
	"FlmPSCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRV1Flyout.res"
	}
	
	"FlmPSCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRV2Flyout.res"
	}
	
	"FlmPSCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRV3Flyout.res"
	}
	
	"FlmPSCDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDRV4Flyout.res"
	}
	
	"FlmPGRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGRL"
		"ResourceFile"			"resource/UI/L4D360UI/PGRLFlyout.res"
	}
	
	"FlmPGRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGRL"
		"ResourceFile"			"resource/UI/L4D360UI/PGRVFlyout.res"
	}
	
	"FlmPGCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDRLFlyout.res"
	}
	
	"FlmPGCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDRL1Flyout.res"
	}
	
	"FlmPGCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDRL2Flyout.res"
	}
	
	"FlmPGCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDRVFlyout.res"
	}
	
	"FlmPGCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDRV1Flyout.res"
	}
	
	"FlmPGCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDRV2Flyout.res"
	}
	
	"FlmSCRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCRL"
		"ResourceFile"			"resource/UI/L4D360UI/SCRLFlyout.res"
	}
	
    "FlmSCRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCRL"
		"ResourceFile"			"resource/UI/L4D360UI/SCRVFlyout.res"
	}
	
	"FlmSCCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDRLFlyout.res"
	}
	
	"FlmSCCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDRL1Flyout.res"
	}
	
	"FlmSCCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDRL2Flyout.res"
	}
	
	"FlmSCCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDRVFlyout.res"
	}
	
	"FlmSCCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDRV1Flyout.res"
	}
	
	"FlmSCCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDRV2Flyout.res"
	}
	
	"FlmNMRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMRL"
		"ResourceFile"			"resource/UI/L4D360UI/NMRLFlyout.res"
	}
	
	"FlmNMRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMRL"
		"ResourceFile"			"resource/UI/L4D360UI/NMRVFlyout.res"
	}
	
	"FlmNMCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRLFlyout.res"
	}
	
	"FlmNMCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRL1Flyout.res"
	}
	
	"FlmNMCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRL2Flyout.res"
	}
	
	"FlmNMCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRL3Flyout.res"
	}
	
	"FlmNMCDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRL4Flyout.res"
	}
	
	"FlmNMCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRVFlyout.res"
	}
	
	"FlmNMCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRV1Flyout.res"
	}
	
	"FlmNMCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRV2Flyout.res"
	}
	
	"FlmNMCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRV3Flyout.res"
	}
	
	"FlmNMCDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDRV4Flyout.res"
	}
	
	"FlmCCRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCRL"
		"ResourceFile"			"resource/UI/L4D360UI/CCRLFlyout.res"
	}
	
    "FlmCCRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCRL"
		"ResourceFile"			"resource/UI/L4D360UI/CCRVFlyout.res"
	}
	
	"FlmCCCDRLFlyout"	
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDRLFlyout.res"
	}
	
	"FlmCCCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDRL1Flyout.res"
	}
	
	"FlmCCCDRVFlyout"	
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDRVFlyout.res"
	}
	
	"FlmCCCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCNM"
		"ResourceFile"			"resource/UI/L4D360UI/CCCDRV1Flyout.res"
	}
	
	"FlmDTRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTRL"
		"ResourceFile"			"resource/UI/L4D360UI/DTRLFlyout.res"
	}
	
	"FlmDTRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTRL"
		"ResourceFile"			"resource/UI/L4D360UI/DTRVFlyout.res"
	}
	
	"FlmDTCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRLFlyout.res"
	}
	
	"FlmDTCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRL1Flyout.res"
	}
	
	"FlmDTCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRL2Flyout.res"
	}
	
	"FlmDTCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRL3Flyout.res"
	}
	
	"FlmDTCDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRL4Flyout.res"
	}
	
	"FlmDTCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRVFlyout.res"
	}
	
	"FlmDTCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRV1Flyout.res"
	}
	
	"FlmDTCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRV2Flyout.res"
	}
	
	"FlmDTCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRV3Flyout.res"
	}
	
	"FlmDTCDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTCDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTNM"
		"ResourceFile"			"resource/UI/L4D360UI/DTCDRV4Flyout.res"
	}
	
	"FlmDARLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDARLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDARL"
		"ResourceFile"			"resource/UI/L4D360UI/DARLFlyout.res"
	}
	
	"FlmDARVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDARVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDARL"
		"ResourceFile"			"resource/UI/L4D360UI/DARVFlyout.res"
	}
	
	"FlmDACDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRLFlyout.res"
	}
	
	"FlmDACDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRL1Flyout.res"
	}
	
	"FlmDACDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRL2Flyout.res"
	}
	
	"FlmDACDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRL3Flyout.res"
	}
	
	"FlmDACDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRL4Flyout.res"
	}
	
	"FlmDACDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRVFlyout.res"
	}
	
	"FlmDACDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRV1Flyout.res"
	}
	
	"FlmDACDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRV2Flyout.res"
	}
	
	"FlmDACDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRV3Flyout.res"
	}
	
	"FlmDACDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDACDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDANM"
		"ResourceFile"			"resource/UI/L4D360UI/DACDRV4Flyout.res"
	}
	
    "FlmBHRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHRL"
		"ResourceFile"			"resource/UI/L4D360UI/BHRLFlyout.res"
	}
	
	"FlmBHRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHRL"
		"ResourceFile"			"resource/UI/L4D360UI/BHRVFlyout.res"
	}
	
	"FlmBHCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRLFlyout.res"
	}
	
	"FlmBHCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRL1Flyout.res"
	}
	
	"FlmBHCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRL2Flyout.res"
	}
	
	"FlmBHCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRL3Flyout.res"
	}
	
	"FlmBHCDRL4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRL4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRL4Flyout.res"
	}
	
	"FlmBHCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRVFlyout.res"
	}
	
	"FlmBHCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRV1Flyout.res"
	}
	
	"FlmBHCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRV2Flyout.res"
	}
	
	"FlmBHCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRV3Flyout.res"
	}
	
	"FlmBHCDRV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/BHCDRV4Flyout.res"
	}
	
	"FlmCSRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSRL"
		"ResourceFile"			"resource/UI/L4D360UI/CSRLFlyout.res"
	}
	
	"FlmCSRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSRL"
		"ResourceFile"			"resource/UI/L4D360UI/CSRVFlyout.res"
	}
	
	"FlmCSCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRLFlyout.res"
	}
	
	"FlmCSCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRL1Flyout.res"
	}
	
	"FlmCSCDRL2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRL2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRL2Flyout.res"
	}
	
	"FlmCSCDRL3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRL3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRL3Flyout.res"
	}
	
    "FlmCSCDRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRVFlyout.res"
	}
	
	"FlmCSCDRV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRV1Flyout.res"
	}
	
	"FlmCSCDRV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRV2Flyout.res"
	}
	
	"FlmCSCDRV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSCDRV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCSNM"
		"ResourceFile"			"resource/UI/L4D360UI/CSCDRV3Flyout.res"
	}
	
	"FlmDCCDSV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDSV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDSV3Flyout.res"
	}
	
	"FlmDCCDSE3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCCDSE3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCCDSE3Flyout.res"
	}
	
	"FlmDCLCDSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDSVFlyout.res"
	}
	
	"FlmDCLCDSV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDSV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDSV3Flyout.res"
	}
	
	"FlmDCLCDSV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLCDSV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLNM"
		"ResourceFile"			"resource/UI/L4D360UI/DCLCDSV4Flyout.res"
	}
	
	"FlmSFCDSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDSVFlyout.res"
	}
	
	"FlmSFCDSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDSEFlyout.res"
	}
	
	"FlmSFCDSV3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFCDSV3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFNM"
		"ResourceFile"			"resource/UI/L4D360UI/SFCDSV3Flyout.res"
	}
	
	"FlmHRCDSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDSVFlyout.res"
	}
	
	"FlmHRCDSV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDSV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDSV1Flyout.res"
	}
	
	"FlmHRCDSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDSEFlyout.res"
	}
	
	"FlmHRCDSE1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDSE1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDSE1Flyout.res"
	}
	
	"FlmHRCDSE2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRCDSE2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRNM"
		"ResourceFile"			"resource/UI/L4D360UI/HRCDSE2Flyout.res"
	}
	
	"FlmPSCDSV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDSV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDSV1Flyout.res"
	}
	
	"FlmPSCDSE1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDSE1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDSE1Flyout.res"
	}
	
	"FlmPSCDSV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSCDSV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSNM"
		"ResourceFile"			"resource/UI/L4D360UI/PSCDSV4Flyout.res"
	}
	
	"FlmPGCDSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDSVFlyout.res"
	}
	
	"FlmPGCDSV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDSV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDSV1Flyout.res"
	}
	
	"FlmPGCDSV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDSV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDSV2Flyout.res"
	}
	
	"FlmPGCDSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDSEFlyout.res"
	}
	
	"FlmPGCDSE1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDSE1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDSE1Flyout.res"
	}
	
	"FlmPGCDSE2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGCDSE2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGNM"
		"ResourceFile"			"resource/UI/L4D360UI/PGCDSE2Flyout.res"
	}
	
	"FlmSCCDSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDSVFlyout.res"
	}
	
	"FlmSCCDSV2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDSV2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDSV2Flyout.res"
	}
	
	"FlmSCCDSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDSEFlyout.res"
	}
	
	"FlmSCCDSE1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCCDSE1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCNM"
		"ResourceFile"			"resource/UI/L4D360UI/SCCDSE1Flyout.res"
	}
	
	"FlmNMCDSV1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDSV1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDSV1Flyout.res"
	}
	
	"FlmNMCDSV4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDSV4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDSV4Flyout.res"
	}
	
	"FlmNMCDSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDSEFlyout.res"
	}
	
	"FlmNMCDSE4Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMCDSE4Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMNM"
		"ResourceFile"			"resource/UI/L4D360UI/NMCDSE4Flyout.res"
	}
	
	"FlmSSModeFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSSModeFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSSHL"
		"ResourceFile"			"resource/UI/L4D360UI/SSModeFlyout.res"
	}
	
	"FlmOptionsGuestFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmOptionsGuestFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnAudioVideo"
		"ResourceFile"			"resource/UI/L4D360UI/OptionsGuestFlyout.res"
	}

	"FlmExtrasFlyout_Simple"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmExtrasFlyout_Simple"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnAddons"
		"ResourceFile"			"resource/UI/L4D360UI/ExtrasFlyout.res"
	}

	"FlmExtrasFlyout_Live"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmExtrasFlyout_Live"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnAddons"
		"ResourceFile"			"resource/UI/L4D360UI/ExtrasFlyoutLive.res"
	}
			
	"PnlQuickJoin"
	{
		"ControlName"			"QuickJoinPanel"
		"fieldName"				"PnlQuickJoin"
		"ResourceFile"			"resource/UI/L4D360UI/QuickJoin.res"
		"visible"				"0"
		"wide"					"500"	[$X360]
		"wide"					"240"	[$WIN32]
		"tall"					"300"
		"xpos"					"r260"	[$X360]
		"xpos"					"80"	[$WIN32]
		"ypos"					"r120"	[$X360]
		"ypos"					"r75"	[$WIN32]
		"navUp"					"BtnQuit"
		"navDown"				"BtnGameModes"
	}
	
	"PnlQuickJoinGroups"	[$WIN32]
	{
		"ControlName"			"QuickJoinGroupsPanel"
		"fieldName"				"PnlQuickJoinGroups"
		"ResourceFile"			"resource/UI/L4D360UI/QuickJoinGroups.res"
		"visible"				"0"
		"wide"					"500"
		"tall"					"300"
		"xpos"					"c0"
		"ypos"					"r75"
		"navUp"					""
		"navDown"				""
	}

	"LblPlayer1GamerTag"	[$X360]
	{
		"ControlName"			"Label"
		"fieldName"				"LblPlayer1GamerTag"
		"xpos"					"100"
		"ypos"					"r120"
		"wide"					"300"
		"tall"					"16"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"Font"					"DefaultMedium"
		"fgcolor_override"		"125 125 125 255"
		"noshortcutsyntax"		"1"
	}
	
	// either this or the enable
	"LblPlayer2GamerTag"	[$X360]
	{
		"ControlName"			"Label"
		"fieldName"				"LblPlayer2GamerTag"
		"xpos"					"100"
		"ypos"					"r100"
		"wide"					"300"
		"tall"					"16"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"Font"					"DefaultMedium"
		"fgcolor_override"		"125 125 125 255"
		"noshortcutsyntax"		"1"
	}
	
	"LblPlayer2Enable"	[$X360]
	{
		"ControlName"			"Label"
		"fieldName"				"LblPlayer2Enable"
		"xpos"					"100"
		"ypos"					"r100"
		"wide"					"300"
		"tall"					"16"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"#L4D360UI_MainMenu_SignInMessageSsStart2"
		"Font"					"DefaultMedium"
		"fgcolor_override"		"125 125 125 255"
	}
	
	"LblPlayer2DisableIcon"		[$X360]
	{
		"ControlName"			"Label"
		"fieldName"				"LblPlayer2DisableIcon"
		"xpos"					"100"
		"ypos"					"r140"
		"wide"					"30"
		"tall"					"16"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"Font"					"GameUIButtonsMini"
		"labelText"				"#GameUI_Icons_BACK"
	}
	
	"LblPlayer2Disable"		[$X360]
	{
		"ControlName"			"Label"
		"fieldName"				"LblPlayer2Disable"
		"xpos"					"125"
		"ypos"					"r140"
		"wide"					"300"
		"tall"					"16"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"Font"					"DefaultMedium"
		"labelText"				"#L4D360UI_MainMenu_SignInMessageSsDisable"
		"fgcolor_override"		"125 125 125 255"
	}
}
