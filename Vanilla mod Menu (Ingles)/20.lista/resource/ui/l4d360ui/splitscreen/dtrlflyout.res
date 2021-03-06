"Resource/UI/DTRLFlyout.res"
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
		"tall"					"125"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnDTRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTRL"
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
		"navDown"				"BtnDTRL2"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M1"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCDRLFlyout"
	}

	"BtnDTRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTRL2"
		"xpos"					"0"
		"ypos"					"20"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnDTRL"
		"navDown"				"BtnDTRL3"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M2"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCDRL1Flyout"
	}

	"BtnDTRL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTRL3"
		"xpos"					"0"
		"ypos"					"40"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnDTRL2"
		"navDown"				"BtnDTRL4"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M3"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCDRL2Flyout"
	}

	"BtnDTRL4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTRL4"
		"xpos"					"0"
		"ypos"					"60"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnDTRL3"
		"navDown"				"BtnDTRL5"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M4"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCDRL3Flyout"
	}

	"BtnDTRL5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTRL5"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnDTRL4"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M5"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCDRL4Flyout"
	}

	"BtnBack"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBack"
		"xpos"					"0"
		"ypos"					"100"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnDTRL5"
		"navDown"				"BtnDTRL"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRLFlyout"
	}
}