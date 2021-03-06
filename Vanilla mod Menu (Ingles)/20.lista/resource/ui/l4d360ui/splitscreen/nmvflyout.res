"Resource/UI/NMVFlyout.res"
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
		"labelText"				"#L4D360UI_LevelName_VERSUS_C8M1"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m1_apartment versus;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"#L4D360UI_LevelName_VERSUS_C8M2"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m2_subway versus;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"#L4D360UI_LevelName_VERSUS_C8M3"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m3_sewers versus;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"#L4D360UI_LevelName_VERSUS_C8M4"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m4_interior versus;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"#L4D360UI_LevelName_VERSUS_C8M5"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m5_rooftop versus;wait 100;connect_splitscreen localhost 2"
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
		"command"				"FlmSplitVerFlyout"
	}
}