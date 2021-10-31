"Resource/UI/DCLCDRL3Flyout.res"
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

	"BtnDCLEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLEY"
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
		"navDown"				"BtnDCLNM"
		"labelText"				"#L4D360UI_Difficulty_Easy"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m4_barns realism;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDCLNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLNM"
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
		"navUp"					"BtnDCLEY"
		"navDown"				"BtnDCL2"
		"labelText"				"#L4D360UI_Difficulty_Normal"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m4_barns realism;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDCL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL2"
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
		"navUp"					"BtnDCLNM"
		"navDown"				"BtnDCL3"
		"labelText"				"#L4D360UI_Difficulty_Hard"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m4_barns realism;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDCL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL3"
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
		"navUp"					"BtnDCL2"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_Difficulty_Impossible"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m4_barns realism;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnDCL3"
		"navDown"				"BtnDCLEY"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLRLFlyout"
	}
}