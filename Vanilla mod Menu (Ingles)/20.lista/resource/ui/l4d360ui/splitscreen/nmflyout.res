"Resource/UI/NMFlyout.res"
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

	"BtnNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM"
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
		"navDown"				"BtnNM2"
		"labelText"				"#L4D360UI_LevelName_COOP_C8M1"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCDFlyout"
	}

	"BtnNM2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM2"
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
		"navUp"					"BtnNM"
		"navDown"				"BtnNM3"
		"labelText"				"#L4D360UI_LevelName_COOP_C8M2"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCD1Flyout"
	}

	"BtnNM3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM3"
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
		"navUp"					"BtnNM2"
		"navDown"				"BtnNM4"
		"labelText"				"#L4D360UI_LevelName_COOP_C8M3"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCD2Flyout"
	}

	"BtnNM4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM4"
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
		"navUp"					"BtnNM3"
		"navDown"				"BtnNM5"
		"labelText"				"#L4D360UI_LevelName_COOP_C8M4"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCD3Flyout"
	}

	"BtnNM5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM5"
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
		"navUp"					"BtnNM4"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_COOP_C8M5"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCD4Flyout"
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
		"navUp"					"BtnNM5"
		"navDown"				"BtnNM"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitFlyout"
	}
}