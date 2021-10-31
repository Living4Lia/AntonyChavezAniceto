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
			"menutitle"			"JUGAR EN PANTALLA DIVIDIDA"
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
			"menuhint"			""
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
			"custommode"		"1"
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
		
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnCusMutations"
			"name"				"CUS MUTATIONS"
			"image"				"vgui/menu_mode_biohazard"
			"command"			"FlmCusMutationsFlyout"
			"menutitle"			"MUTACIONES PERSONALIZADAS"
			"menuhint"			"Seleccione una categoría de mutación de la lista"
		}
		
		"mode" [!$X360GUEST]
		{
			"id"				"BtnZSL"
			"name"				"          ZSL"
			"image"				"vgui/menu_mode_ZSL"
			"command"			"FlmZSLFlyout"
			"menutitle"			"HEAD2HEAD - EVENTOS COMPETITIVOS"
			"menuhint"			"¡Entra en la Liga Deportiva de infectados y derrota a tus amigos!"
		}
		
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
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
			"name"				"#L4D360UI_ModeCaps_COOP"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitFlyout"
			"menutitle"			"#L4D360UI_MainMenu_CoOp"
			"menuhint"			"#L4D360UI_MainMenu_CoOp_Tip"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnVS"
			"name"				"#L4D360UI_ModeCaps_VERSUS"
			"image"				"vgui/menu_mode_versus"
			"command"			"FlmSplitVerFlyout"
			"menutitle"			"#L4D360UI_MainMenu_Versus"
			"menuhint"			"#L4D360UI_MainMenu_Versus_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSV"
			"name"				"#L4D360UI_ModeCaps_SURVIVAL"
			"image"				"vgui/menu_mode_Survival"
			"command"			"FlmSplitSVFlyout"
			"menutitle"			"#L4D360UI_MainMenu_Survival"
			"menuhint"			"#L4D360UI_MainMenu_Survival_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSE"
			"name"				"#L4D360UI_ModeCaps_SCAVENGE"
			"image"				"vgui/menu_mode_Scavenge"
			"command"			"FlmSplitSEFlyout"
			"menutitle"			"#L4D360UI_MainMenu_Scavenge"
			"menuhint"			"#L4D360UI_MainMenu_Scavenge_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnRL"
			"name"				"#L4D360UI_ModeCaps_REALISM"
			"image"				"vgui/menu_mode_Realism"
			"command"			"FlmSplitRLFlyout"
			"menutitle"			"#L4D360UI_MainMenu_Realism"
			"menuhint"			"#L4D360UI_MainMenu_Realism_Tip"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnRV"
			"name"				"#L4D360UI_ModeCaps_mutation12_short"
			"image"				"vgui/menu_mode_realismversus"
			"command"			"FlmSplitRVerFlyout"
			"menutitle"			"#L4D360UI_ModeCaps_mutation12"
			"menuhint"			"#L4D360UI_MainMenu_PlayChallenge_Tip_mutation12"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnVSV"
			"name"				"#L4D360UI_ModeCaps_mutation15_short"
			"image"				"vgui/menu_mode_versussurvival"
			"command"			"FlmSplitVerSVFlyout"
			"menutitle"			"#L4D360UI_ModeCaps_mutation15"
			"menuhint"			"#L4D360UI_MainMenu_PlayChallenge_Tip_mutation15"
			"menuhintdisabled"	"#L4D360UI_MainMenu_DemoVersion"	[$DEMO]
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSplitScreenDirection"
			"name"				"#L4D360UI_ModeCaps_offline_SS"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitScreenDirection"
			"menutitle"			"#L4D360UI_MainMenu_PlaySplitscreen"
			"menuhint"			"#L4D360UI_MainMenu_OfflineCoOp_Tip"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSplitScreenConnection"
			"name"				"#L4D360UI_ModeCaps_offline_SS"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSplitScreenConnection"
			"menutitle"			"#L4D360UI_MainMenu_PlaySplitscreen"
			"menuhint"			"#L4D360UI_MainMenu_OfflineCoOp_Tip"
		}

	    "mode" [!$X360GUEST]
		{
			"id"				"BtnDC"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD1"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD2"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCD3"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCV"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCSV"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCSE"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCRL"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL1"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL2"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCCDRL3"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCRV"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCVSV"
			"name"				"#L4D360UI_CampaignName_C1"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C1"
			"menuhint"			"Play Split-Screen Dead Center"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCL"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD1"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD2"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD3"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCD4"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLV"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLSV"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLSE"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLRL"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL1"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL2"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL3"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLCDRL4"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLCDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLRV"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDCLVSV"
			"name"				"#L4D360UI_CampaignName_C2"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDCLVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C2"
			"menuhint"			"Play Split-Screen Dark Carnival"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSF"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD1"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD2"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCD3"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFV"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFSV"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFSE"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDSE"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFRL"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL1"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL2"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFCDRL3"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFRV"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSFVSV"
			"name"				"#L4D360UI_CampaignName_C3"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSFVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C3"
			"menuhint"			"Play Split-Screen Swamp Fever"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHR"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD1"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD2"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD3"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCD4"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRV"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRSV"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRSE"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRRL"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL1"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL2"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL3"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRCDRL4"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRCDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRRV"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnHRVSV"
			"name"				"#L4D360UI_CampaignName_C4"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmHRVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C4"
			"menuhint"			"Play Split-Screen Hard Rain"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPS"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD1"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD2"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD3"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCD4"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSV"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSSV"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSSE"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSRL"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL1"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL2"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL3"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSCDRL4"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSCDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSRV"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPSVSV"
			"name"				"#L4D360UI_CampaignName_C5"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPSVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C5"
			"menuhint"			"Play Split-Screen The Parish"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPG"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCD"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCD1"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCD2"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGV"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGSV"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGSE"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGRL"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRL"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRL1"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGCDRL2"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGRV"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnPGVSV"
			"name"				"#L4D360UI_CampaignName_C6"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmPGVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C6"
			"menuhint"			"Play Split-Screen The Passing"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSC"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCD"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCD1"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCD2"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCV"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCSV"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCSE"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCRL"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRL"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRL1"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCCDRL2"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCRV"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnSCVSV"
			"name"				"#L4D360UI_CampaignName_C7"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmSCVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C7"
			"menuhint"			"Play Split-Screen The Sacrifice"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNM"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD1"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD2"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD3"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCD4"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMV"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMSV"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMSE"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMRL"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL1"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL2"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL3"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMCDRL4"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMCDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMRV"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnNMVSV"
			"name"				"#L4D360UI_CampaignName_C8"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmNMVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C8"
			"menuhint"			"Play Split-Screen No Mercy"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCC"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCD"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCD1"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCV"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCSV"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCSE"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCRL"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDRL"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCCDRL1"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCRV"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCCVSV"
			"name"				"#L4D360UI_CampaignName_C9"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCCVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C9"
			"menuhint"			"Play Split-Screen Crash Course"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDT"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD1"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD2"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD3"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCD4"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTV"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTSV"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTSE"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTRL"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"			
			"command"			"FlmDTCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL1"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL2"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL3"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTCDRL4"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTCDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTRV"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDTVSV"
			"name"				"#L4D360UI_CampaignName_C10"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDTVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C10"
			"menuhint"			"Play Split-Screen Death Toll"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDA"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDAFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD1"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD2"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD3"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACD4"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDAV"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDAVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDASV"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDASVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDASE"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDASEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDARL"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDARLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL1"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL2"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL3"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDACDRL4"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDACDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDARV"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDARVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnDAVSV"
			"name"				"#L4D360UI_CampaignName_C11"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmDAVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C11"
			"menuhint"			"Play Split-Screen Dead Air"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBH"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD1"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD2"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD3"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCD4"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCD4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHV"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHSV"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHSE"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHRL"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL1"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL2"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL3"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHCDRL4"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHCDRL4Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHRV"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnBHVSV"
			"name"				"#L4D360UI_CampaignName_C12"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmBHVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C12"
			"menuhint"			"Play Split-Screen Blood Harvest"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCS"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD1"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD2"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCD2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCD3"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCD3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSV"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSSV"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSRL"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL1"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL2"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRL2Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSCDRL3"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSCDRL3Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSRV"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnCSVSV"
			"name"				"#L4D360UI_CampaignName_C13"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmCSVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C13"
			"menuhint"			"Play Split-Screen Cold Stream"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLS"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSCD"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSCDFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSCD1"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSCD1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSV"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSSV"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSSE"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSSEFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSRL"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSCDRL"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSCDRLFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSCDRL1"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSCDRL1Flyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSRV"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSRVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}

		"mode" [!$X360GUEST]
		{
			"id"				"BtnLSVSV"
			"name"				"#L4D360UI_CampaignName_C14"
			"image"				"vgui/menu_mode_offline_coop"
			"command"			"FlmLSVSVFlyout"
			"menutitle"			"#L4D360UI_CampaignName_C14"
			"menuhint"			"Play Split-Screen The Last Stand"
		}
    }
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Custom Flyouts Buttons Start
	// Rayman start
	"BtnCustomMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCustomMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCustomMutationsFlyout"
	}              
	"BtnSVSMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnSVSMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmSVSMutationsFlyout"
	}
	"BtnCustomMutations0"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCustomMutations0"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCustomMutations0Flyout"
	}
	"BtnCustomMutations1"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCustomMutations1"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCustomMutations1Flyout"
	}
	"BtnCampaignMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCampaignMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCampaignMutationsFlyout"
	}
	"BtnCampaignMutations1"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCampaignMutations1"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCampaignMutations1Flyout"
	}
	"BtnCampaignMutations2"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCampaignMutations2"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCampaignMutations2Flyout"
	}
	"BtnCampaignMutations3"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnCampaignMutations3"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmCampaignMutations3Flyout"
	}
	"BtnParasiteMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnParasiteMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmParasiteMutationsFlyout"
	}
	"Btn1L2LMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "Btn1L2LMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "Flm1L2LMutationsFlyout"
	}
	"BtnVIPMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnVIPMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmVIPMutationsFlyout"
	}
	"BtnViralMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnViralMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmViralMutationsFlyout"
	}
	"BtnM60Mutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnM60Mutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmM60MutationsFlyout"
	}
	"BtnDeathThrowsMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnDeathThrowsMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmDeathThrowsMutationsFlyout"
	}
	"BtnUncommonMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnUncommonMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmUncommonMutationsFlyout"
	}
	"BtnAntiSpecialSquadMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnAntiSpecialSquadMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmAntiSpecialSquadMutationsFlyout"
	}
	"BtnDeathClockMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnDeathClockMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmDeathClockMutationsFlyout"
	}
	"BtnGunGame2Mutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGunGame2Mutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGunGame2MutationsFlyout"
	}
	"BtnGunGameMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGunGameMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGunGameMutationsFlyout"
	}
	"BtnVersusTrainingMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnVersusTrainingMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmVersusTrainingMutationsFlyout"
	}
	"BtnVersusMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnVersusMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmVersusMutationsFlyout"
	}
	"BtnVersusMutations1"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnVersusMutations1"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmVersusMutations1Flyout"
	}
	"BtnSurvivalMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnSurvivalMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmSurvivalMutationsFlyout"
	}
	"BtnScavengeMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnScavengeMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmScavengeMutationsFlyout"
	}
	"BtnClassicMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnClassicMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmClassicMutationsFlyout"
	}
	"BtnRealismMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnRealismMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmRealismMutationsFlyout"
	}
	"BtnSoloMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnSoloMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmSoloMutationsFlyout"
	}
	"Btn2PMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "Btn2PMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "Flm2PMutationsFlyout"
	}
	"BtnZSLWeekly"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnZSLWeekly"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmZSLWeeklyFlyout"
	}
	"BtnZSLSurvival"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnZSLSurvival"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmZSLSurvivalFlyout"
	}
	"BtnGuestMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestMutationsFlyout"
	}
	"BtnGuestCampaignMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestCampaignMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestCampaignMutationsFlyout"
	}
	"BtnGuestClassicMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestClassicMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestClassicMutationsFlyout"
	}
	"BtnGuestRealismMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestRealismMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestRealismMutationsFlyout"
	}
	"BtnGuestScavengeMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestScavengeMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestScavengeMutationsFlyout"
	}
	"BtnGuestSoloMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestSoloMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestSoloMutationsFlyout"
	}
	"BtnGuest2PMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuest2PMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuest2PMutationsFlyout"
	}
	"BtnGuestSurvivalMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestSurvivalMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestSurvivalMutationsFlyout"
	}
	"BtnGuestVersusMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestVersusMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestVersusMutationsFlyout"
	}
	"BtnGuestUncommonMutations"
	{
		"ControlName"                           "L4D360HybridButton"
		"FieldName"                             "BtnGuestUncommonMutations"
		"xpos"                                  "280"//flyouts xpos. This has to be adjusted to match gamemodes' initial flyouts xpos, which depend on "wideatopen" setting
		"ypos"                                  "203"//flyouts ypos
		"wide"                                  "0"//flyouts width
		"tall"                                  "20"
		"visible"                               "0"
		"enabled"                               "1"
		"labeltext"                             ""
		"tooltiptext"                           ""
		"style"                                 "MainMenuButton"
		"command"                               "FlmGuestUncommonMutationsFlyout"
	}
	//Rayman End
	// Custom Flyouts Buttons End
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
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
		"wide"					"180"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"		[$X360GUEST]
		"enabled"				"1"		[$X360GUEST]
		"visible"				"1"		[!$X360GUEST]
		"enabled"				"1"		[!$X360GUEST]
		"tabPosition"			"0"
		"navUp"					"BtnConsole"
		"navDown"				"BtnAddons"
		"labelText"				"BUSCAR SERVIDORES"
		"tooltiptext"			"#L4D360UI_MainMenu_StatsAndAchievements_Tip"	[$X360]
		"tooltiptext"			"Look for a server using the server list."	[$WIN32]
		"style"					"MainMenuButton"
		"command"				"FlmSearchGamesFlyout"
		"ActivationType"		"1"
		"EnableCondition"		"Never" [$DEMO]
	}		
	
		"IconAddons"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconAddons"
		"xpos"					"75"
		"ypos"					"295"
		"wide"					"20"
		"tall"					"20"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"common/l4d_spinner"
		"frame"					"0"
		"scaleImage"			"1"
	}	

	"BtnAddons"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAddons"
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
		"labelText"				"#L4D360UI_Extras_Addons"
		"tooltiptext"			"#L4D360UI_Extras_Addons_Tip"	[$X360]
		"tooltiptext"			"#L4D360UI_Extras_Addons_Tip"	[$WIN32]
		"style"					"MainMenuButton"
		"command"				"Addons"
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
		"navUp"					"BtnAddons"
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
	
	// Rayman start
	"FlmCusMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCusMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnMutationList1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CustomMutationsFlyout.res"
	}
	
	"FlmCustomMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCustomMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CustomMutationsFlyout.res"
	}
	
	"FlmSVSMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSVSMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/SVSMutationsFlyout.res"
	}
	
	"FlmCustomMutations0Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCustomMutations0Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnMutationList1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CustomMutations0Flyout.res"
	}
	
	"FlmCustomMutations1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCustomMutations1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CustomMutations1Flyout.res"
	}
	
	"FlmCampaignMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCampaignMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnMutationList1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CampaignMutationsFlyout.res"
	}
	
	"FlmCampaignMutations1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCampaignMutations1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CampaignMutations1Flyout.res"
	}
	
	"FlmCampaignMutations2Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCampaignMutations2Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CampaignMutations2Flyout.res"
	}
	
	"FlmCampaignMutations3Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCampaignMutations3Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/CampaignMutations3Flyout.res"
	}
	
	"FlmParasiteMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmParasiteMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ParasiteMutationsFlyout.res"
	}
	
	"Flm1L2LMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"Flm1L2LMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/1L2LMutationsFlyout.res"
	}
	
	"FlmVIPMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVIPMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/VIPMutationsFlyout.res"
	}
	
	"FlmViralMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmViralMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ViralMutationsFlyout.res"
	}
	
	"FlmM60MutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmM60MutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/M60MutationsFlyout.res"
	}
	
	"FlmDeathThrowsMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDeathThrowsMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/DeathThrowsMutationsFlyout.res"
	}
	
	"FlmUncommonMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmUncommonMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/UncommonMutationsFlyout.res"
	}
	
	"FlmAntiSpecialSquadMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmAntiSpecialSquadMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/AntiSpecialSquadMutationsFlyout.res"
	}
	
	"FlmDeathClockMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDeathClockMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/DeathClockMutationsFlyout.res"
	}
	
	"FlmGunGame2MutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGunGame2MutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GunGame2MutationsFlyout.res"
	}
	
	"FlmGunGameMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGunGameMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GunGameMutationsFlyout.res"
	}
	
	"FlmSurvivalMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSurvivalMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/SurvivalMutationsFlyout.res"
	}
	
	"FlmScavengeMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmScavengeMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ScavengeMutationsFlyout.res"
	}
	
	"FlmVersusTrainingMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVersusTrainingMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/VersusTrainingMutationsFlyout.res"
	}
	
	"FlmVersusMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVersusMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnMutationList1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/VersusMutationsFlyout.res"
	}
	
	"FlmVersusMutations1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVersusMutations1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/VersusMutations1Flyout.res"
	}
	
	"FlmClassicMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmClassicMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ClassicMutationsFlyout.res"
	}
	
	"FlmRealismMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmRealismMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/RealismMutationsFlyout.res"
	}
	
	"FlmSoloMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSoloMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlaySoloMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/SoloMutationsFlyout.res"
	}
	
	"Flm2PMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"Flm2PMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/2PMutationsFlyout.res"
	}
	
	"FlmZSLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmZSLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnMutationList1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ZSLFlyout.res"
	}
	
	"FlmZSLWeeklyFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmZSLWeeklyFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ZSLWeeklyFlyout.res"
	}
	
	"FlmZSLSurvivalFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmZSLSurvivalFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/ZSLSurvivalFlyout.res"
	}
	
	"FlmGuestMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnMutationList1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestMutationsFlyout.res"
	}
	
	"FlmGuestCampaignMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestCampaignMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestCampaignMutationsFlyout.res"
	}
	
	"FlmGuestClassicMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestClassicMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestClassicMutationsFlyout.res"
	}
	
	"FlmGuestRealismMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestRealismMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestRealismMutationsFlyout.res"
	}
	
	"FlmGuestScavengeMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestScavengeMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestScavengeMutationsFlyout.res"
	}
	
	"FlmGuestSoloMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestSoloMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestSoloMutationsFlyout.res"
	}
	
	"FlmGuest2PMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuest2PMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/Guest2PMutationsFlyout.res"
	}
	
	"FlmGuestSurvivalMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestSurvivalMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestSurvivalMutationsFlyout.res"
	}
	
	"FlmGuestVersusMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestVersusMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestVersusMutationsFlyout.res"
	}
	
	"FlmGuestUncommonMutationsFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGuestUncommonMutationsFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPlayMutation1"
		"ResourceFile"			"resource/UI/L4D360UI/Mutations/GuestUncommonMutationsFlyout.res"
	}
	// Rayman end
	
	
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
	
// Split screen flyouts directories start

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
		"InitialFocus"			"BtnDC"
		"ResourceFile"			"resource/UI/L4D360UI/SplitRLFlyout.res"
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

	"FlmSplitVerSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitVerSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitVerSVFlyout.res"
	}

	"FlmSplitScreenDirection"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitScreenDirection"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDefault"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownSplitScreenDirection.res"
	}

	"FlmSplitScreenConnection"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSplitScreenConnection"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnOnline"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownSplitScreenConnection.res"
	}

//Maps & difficulty flyouts

	"FlmDCFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDC"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCSVFlyout.res"
	}

	"FlmDCSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCSE"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCRVFlyout.res"
	}

	"FlmDCVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLCDRL4Flyout.res"
	}

	"FlmDCLRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCL"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLRVFlyout.res"
	}

	"FlmDCLVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDCLVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDCLSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DCLVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFSEFlyout.res"
	}

	"FlmSFRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSF"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFCDRL3Flyout.res"
	}

	"FlmSFRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSF"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFRVFlyout.res"
	}

	"FlmSFVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSFVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSFSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SFVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRCDRL4Flyout.res"
	}

	"FlmHRRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRRL"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRRVFlyout.res"
	}

	"FlmHRVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmHRVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnHRSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/HRVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSCDRL4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSRVFlyout.res"
	}

	"FlmPSVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPSVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPSSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PSVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGRVFlyout.res"
	}

	"FlmPGVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmPGVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPGSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/PGVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCRVFlyout.res"
	}

	"FlmSCVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSCVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnSCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/SCVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMCDRL4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMRVFlyout.res"
	}

	"FlmNMVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmNMVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnNMSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/NMVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCVFlyout.res"
	}

	"FlmCCSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCSVFlyout.res"
	}

	"FlmCCSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCSE"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCRVFlyout.res"
	}

	"FlmCCVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCCVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCCSV"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CCVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTVFlyout.res"
	}

	"FlmDTSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDT"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTSVFlyout.res"
	}

	"FlmDTSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDTSE"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTCDRL4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTRVFlyout.res"
	}

	"FlmDTVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDTVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDT"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DTVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DAFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DAVFlyout.res"
	}

	"FlmDASVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDASVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDA"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DASVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DASEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DARLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DACDRL4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DARVFlyout.res"
	}

	"FlmDAVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDAVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnDA"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/DAVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHFlyout.res"
	}

	"FlmBHCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCD4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHVFlyout.res"
	}

    "FlmBHSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHSEFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHRLFlyout.res"
	}

	"FlmBHCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBHNM"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHCDRL4Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHRVFlyout.res"
	}

    "FlmBHVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmBHVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnBH"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/BHVSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCDFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCD1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCD2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCD3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSVFlyout.res"
	}

	"FlmCSSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSSVFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCDRLFlyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCDRL1Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCDRL2Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSCDRL3Flyout.res"
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
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSRVFlyout.res"
	}

	"FlmCSVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCSVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnCS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/CSVSVFlyout.res"
	}

	"FlmLSFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSFlyout.res"
	}

    "FlmLSCDFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSCDFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLSNM"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSCDFlyout.res"
	}

	"FlmLSCD1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSCD1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLSNM"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSCD1Flyout.res"
	}

	"FlmLSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSVFlyout.res"
	}

	"FlmLSSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSSVFlyout.res"
	}

	"FlmLSSEFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSSEFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSSEFlyout.res"
	}

	"FlmLSRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSRLFlyout.res"
	}

    "FlmLSCDRLFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSCDRLFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLSNM"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSCDRLFlyout.res"
	}

	"FlmLSCDRL1Flyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSCDRL1Flyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLSNM"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSCDRL1Flyout.res"
	}

	"FlmLSRVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSRVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSRVFlyout.res"
	}

	"FlmLSVSVFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmLSVSVFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnLS"
		"ResourceFile"			"resource/UI/L4D360UI/SplitScreen/LSVSVFlyout.res"
	}

//Others

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
	
		"FlmExtrasFlyout_Simple"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmExtrasFlyout_Simple"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnStatsAndAchievements"
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
		"InitialFocus"			"BtnStatsAndAchievements"
		"ResourceFile"			"resource/UI/L4D360UI/ExtrasFlyoutLive.res"
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
	
		"FlmSearchGamesFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmSearchGamesFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnGameBrowser"
		"ResourceFile"			"resource/UI/L4D360UI/SearchGamesFlyout.res"
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
}
