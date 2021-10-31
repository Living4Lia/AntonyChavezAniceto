"Resource/UI/BHCD2Flyout.res"
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

	"BtnBHEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBHEY"
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
		"navDown"				"BtnBHNM"
		"labelText"				"#L4D360UI_Difficulty_Easy"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m3_bridge coop;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnBHNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBHNM"
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
		"navUp"					"BtnBHEY"
		"navDown"				"BtnBHNM"
		"labelText"				"#L4D360UI_Difficulty_Normal"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m3_bridge coop;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}

	"BtnBH2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBH2"
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
		"navUp"					"BtnBHNM"
		"navDown"				"BtnBH3"
		"labelText"				"#L4D360UI_Difficulty_Hard"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m3_bridge coop;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}

	"BtnBH3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBH3"
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
		"navUp"					"BtnBH2"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_Difficulty_Impossible"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m3_bridge coop;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}

	"BtnBack"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBack"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnBH3"
		"navDown"				"BtnBHEY"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmBHFlyout"
	}
}