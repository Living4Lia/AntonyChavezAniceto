"Resource/UI/DTFlyout.res"
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

	"BtnDT"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT"
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
		"navDown"				"BtnDT2"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M1"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCDFlyout"
	}

	"BtnDT2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT2"
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
		"navUp"					"BtnDT"
		"navDown"				"BtnDT3"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M2"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCD1Flyout"
	}

	"BtnDT3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT3"
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
		"navUp"					"BtnDT2"
		"navDown"				"BtnDT4"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M3"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCD2Flyout"
	}

	"BtnDT4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT4"
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
		"navUp"					"BtnDT3"
		"navDown"				"BtnDT5"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M4"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCD3Flyout"
	}

	"BtnDT5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT5"
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
		"navUp"					"BtnDT4"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_COOP_C10M5"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTCD4Flyout"
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
		"navUp"					"BtnDT5"
		"navDown"				"BtnDT"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitFlyout"
	}
}