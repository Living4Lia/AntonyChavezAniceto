"Resource/UI/PSVFlyout.res"
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

	"BtnPS"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS"
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
		"navDown"				"BtnPS2"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C5M1"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m1_waterfront versus;wait 100;connect_splitscreen localhost 2"
	}

	"BtnPS2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS2"
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
		"navUp"					"BtnPS"
		"navDown"				"BtnPS3"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C5M2"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m2_park versus;wait 100;connect_splitscreen localhost 2"
	}

	"BtnPS3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS3"
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
		"navUp"					"BtnPS2"
		"navDown"				"BtnPS4"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C5M3"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m3_cemetery versus;wait 100;connect_splitscreen localhost 2"
	}

	"BtnPS4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS4"
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
		"navUp"					"BtnPS3"
		"navDown"				"BtnPS5"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C5M4"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m4_quarter versus;wait 100;connect_splitscreen localhost 2"
	}

	"BtnPS5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS5"
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
		"navUp"					"BtnPS4"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C5M5"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m5_bridge versus;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnPS5"
		"navDown"				"BtnPS"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitVerFlyout"
	}
}