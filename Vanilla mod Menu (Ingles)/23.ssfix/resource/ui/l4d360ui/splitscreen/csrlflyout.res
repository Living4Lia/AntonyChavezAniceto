"Resource/UI/CSRLFlyout.res"
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
		"tall"					"105"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnCSRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCSRL"
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
		"navDown"				"BtnCSRL2"
		"labelText"				"#L4D360UI_LevelName_COOP_C13M1"
		"tooltiptext"			"Start Split-screen Cold Stream"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCSCDRLFlyout"
	}

	"BtnCSRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCSRL2"
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
		"navUp"					"BtnCSRL"
		"navDown"				"BtnCSRL3"
		"labelText"				"#L4D360UI_LevelName_COOP_C13M2"
		"tooltiptext"			"Start Split-screen Cold Stream"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCSCDRL1Flyout"
	}

	"BtnCSRL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCSRL3"
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
		"navUp"					"BtnCSRL2"
		"navDown"				"BtnCSRL4"
		"labelText"				"#L4D360UI_LevelName_COOP_C13M3"
		"tooltiptext"			"Start Split-screen Cold Stream"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCSCDRL2Flyout"
	}

	"BtnCSRL4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCSRL4"
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
		"navUp"					"BtnCSRL3"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_COOP_C13M4"
		"tooltiptext"			"Start Split-screen Cold Stream"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCSCDRL3Flyout"
	}

	"BtnBack"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBack"
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
		"navUp"					"BtnCSRL4"
		"navDown"				"BtnCSRL"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRLFlyout"
	}
}