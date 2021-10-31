"Resource/UI/LSRVFlyout.res"
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

	"BtnLS"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnLS"
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
		"navDown"				"BtnLS2"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C14M1"
		"tooltiptext"			"Start Split-screen The Last Stand"
		"style"					"FlyoutMenuButton"
		"command"				"#map c14m1_junkyard mutation12;wait 100;connect_splitscreen localhost 2"
	}

	"BtnLS2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnLS2"
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
		"navUp"					"BtnLS"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_LevelName_VERSUS_C14M2"
		"tooltiptext"			"Start Split-screen The Last Stand"
		"style"					"FlyoutMenuButton"
		"command"				"#map c14m2_lighthouse mutation12;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnLS2"
		"navDown"				"BtnLS"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRVerFlyout"
	}
}