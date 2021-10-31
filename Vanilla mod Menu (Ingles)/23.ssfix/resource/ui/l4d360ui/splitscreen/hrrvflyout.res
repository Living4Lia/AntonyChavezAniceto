"Resource/UI/HRRVFlyout.res"
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

	"BtnHRRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRRL"
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
		"navDown"				"BtnHRRL2"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C4M1"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"#map c4m1_milltown_a mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnHRRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRRL2"
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
		"navUp"					"BtnHRRL"
		"navDown"				"BtnHRRL3"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C4M2"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"#map c4m2_sugarmill_a mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnHRRL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRRL3"
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
		"navUp"					"BtnHRRL2"
		"navDown"				"BtnHRRL4"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C4M3"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"#map c4m3_sugarmill_b mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnHRRL4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRRL4"
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
		"navUp"					"BtnHRRL3"
		"navDown"				"BtnHRRL5"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C4M4"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"#map c4m4_milltown_b mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnHRRL5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRRL5"
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
		"navUp"					"BtnHRRL4"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C4M5"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"#map c4m5_milltown_escape mutation12;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnHRRL5"
		"navDown"				"BtnHRRL"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRVerFlyout"
	}
}