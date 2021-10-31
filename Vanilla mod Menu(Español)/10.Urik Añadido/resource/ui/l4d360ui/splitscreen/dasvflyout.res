"Resource/UI/DASVFlyout.res"
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

	"BtnDA"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA"
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
		"navDown"				"BtnDA2"
		"labelText"				"#L4D360UI_LevelName_SCAVENGE_C11M2"	//#L4D360UI_LevelName_SURVIVAL_C11M2 does not exist
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m2_offices survival;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDA2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA2"
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
		"navUp"					"BtnDA"
		"navDown"				"BtnDA3"
		"labelText"				"#L4D360UI_LevelName_SCAVENGE_C11M3"	//#L4D360UI_LevelName_SURVIVAL_C11M3 does not exist
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m3_garage survival;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDA3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA3"
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
		"navUp"					"BtnDA2"
		"navDown"				"BtnDA4"
		"labelText"				"#L4D360UI_LevelName_SCAVENGE_C11M4"	//#L4D360UI_LevelName_SURVIVAL_C11M4 does not exist
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m4_terminal survival;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDA4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA4"
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
		"navUp"					"BtnDA3"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_SCAVENGE_C11M5"	//#L4D360UI_LevelName_SURVIVAL_C11M5 does not exist
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m5_runway survival;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnDA4"
		"navDown"				"BtnDA"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitSVFlyout"
	}
}