"Resource/UI/DARVFlyout.res"
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

	"BtnDARL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDARL"
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
		"navDown"				"BtnDARL2"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C11M1"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m1_greenhouse mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDARL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDARL2"
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
		"navUp"					"BtnDARL"
		"navDown"				"BtnDARL3"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C11M2"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m2_offices mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDARL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDARL3"
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
		"navUp"					"BtnDARL2"
		"navDown"				"BtnDARL4"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C11M3"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m3_garage mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDARL4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDARL4"
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
		"navUp"					"BtnDARL3"
		"navDown"				"BtnDARL5"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C11M4"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m4_terminal mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDARL5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDARL5"
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
		"navUp"					"BtnDARL4"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C11M5"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m5_runway mutation12;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnDARL5"
		"navDown"				"BtnDARL"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRVerFlyout"
	}
}