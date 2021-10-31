"Resource/UI/SplitRLFlyout.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"180" [$ENGLISH]
		"wide"					"270" [!$ENGLISH]
		"tall"					"330"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnDC"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDC"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"		
		"navUp"					"BtnBack"
		"navDown"				"BtnPG"
		"labelText"				"#L4D360UI_CampaignName_C1"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCRLFlyout"
		"ActivationType"		"1"
	}
	
		"BtnPG"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPG"
		"xpos"					"0"
		"ypos"					"20"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnDC"
		"navDown"				"BtnDCL"
		"labelText"				"#L4D360UI_CampaignName_C6"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGRLFlyout"
		"ActivationType"		"1"
	}

	"BtnDCL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL"
		"xpos"					"0"
		"ypos"					"40"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnPG"
		"navDown"				"BtnSF"
		"labelText"				"#L4D360UI_CampaignName_C2"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLRLFlyout"
		"ActivationType"		"1"
	}
   
   "BtnSF"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF"
		"xpos"					"0"
		"ypos"					"60"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnDCL"
		"navDown"				"BtnHR"
		"labelText"				"#L4D360UI_CampaignName_C3"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFRLFlyout"
		"ActivationType"		"1"
	}			

	"BtnHR"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHR"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnSF"
		"navDown"				"BtnPH"
		"labelText"				"#L4D360UI_CampaignName_C4"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"FlmHRRLFlyout"
		"ActivationType"		"1"
	}			

	"BtnPH"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPH"
		"xpos"					"0"
		"ypos"					"100"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnHR"
		"navDown"				"BtnNM"
		"labelText"				"#L4D360UI_CampaignName_C5"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPSRLFlyout"
		"ActivationType"		"1"
	}





	"BtnNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM"
		"xpos"					"0"
		"ypos"					"130"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnPH"
		"navDown"				"BtnCC"
		"labelText"				"#L4D360UI_CampaignName_C8"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMRLFlyout"
		"ActivationType"		"1"
	}

	"BtnCC"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCC"
		"xpos"					"0"
		"ypos"					"150"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnNM"
		"navDown"				"BtnDT"
		"labelText"				"#L4D360UI_CampaignName_C9"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCCRLFlyout"
		"ActivationType"		"1"
	}

	"BtnDT"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT"
		"xpos"					"0"
		"ypos"					"170"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnCC"
		"navDown"				"BtnDA"
		"labelText"				"#L4D360UI_CampaignName_C10"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTRLFlyout"
		"ActivationType"		"1"
	}

	"BtnDA"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA"
		"xpos"					"0"
		"ypos"					"190"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnDT"
		"navDown"				"BtnBH"
		"labelText"				"#L4D360UI_CampaignName_C11"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDARLFlyout"
		"ActivationType"		"1"
	}	

	"BtnBH"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBH"
		"xpos"					"0"
		"ypos"					"210"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnDA"
		"navDown"				"BtnSC"
		"labelText"				"#L4D360UI_CampaignName_C12"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"FlmBHRLFlyout"
		"ActivationType"		"1"
	}
	
		"BtnSC"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSC"
		"xpos"					"0"
		"ypos"					"230"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnBH"
		"navDown"				"BtnCS"
		"labelText"				"#L4D360UI_CampaignName_C7"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCRLFlyout"
		"ActivationType"		"1"
	}

	"BtnCS"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCS"
		"xpos"					"0"
		"ypos"					"260"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnSC"
		"navDown"				"BtnLS"
		"labelText"				"#L4D360UI_CampaignName_C13"
		"tooltiptext"			"Start Split-screen Cold Stream"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCSRLFlyout"
		"ActivationType"		"1"
	}

	"BtnLS"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnLS"
		"xpos"					"0"
		"ypos"					"280"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnCS"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_CampaignName_C14"
		"tooltiptext"			"Start Split-screen The Last Stand"
		"style"					"FlyoutMenuButton"
		"command"				"FlmLSRLFlyout"
		"ActivationType"		"1"
	}
	
	"BtnBack"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBack"
		"xpos"					"0"
		"ypos"					"300"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"		
		"navUp"					"BtnLS"
		"navDown"				"BtnDC"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitModesFlyout"
	}
}


