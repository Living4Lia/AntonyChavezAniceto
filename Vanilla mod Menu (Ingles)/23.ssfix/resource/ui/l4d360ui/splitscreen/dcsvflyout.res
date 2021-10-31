"Resource/UI/DCSVFlyout.res"
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
		"tall"					"65"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnDCSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCSV"
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
		"navDown"				"BtnDCSV2"
		"labelText"				"#L4D360UI_LevelName_SURVIVAL_C1M2"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"#map c1m2_streets survival;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDCSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCSV2"
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
		"navUp"					"BtnDCSV"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_SURVIVAL_C1M4"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"#map c1m4_atrium survival;wait 100;connect_splitscreen localhost 2"
	}

	"BtnBack"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBack"
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
		"navUp"					"BtnDCSV2"
		"navDown"				"BtnDCSV"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitSVFlyout"
	}
}