"Resource/UI/DTCDRL3Flyout.res"
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

	"BtnDTEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTEY"
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
		"navDown"				"BtnDTNM"
		"labelText"				"#L4D360UI_Difficulty_Easy"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m4_mainstreet realism;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDTNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDTNM"
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
		"navUp"					"BtnDTEY"
		"navDown"				"BtnDT2"
		"labelText"				"#L4D360UI_Difficulty_Normal"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m4_mainstreet realism;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDT2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT2"
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
		"navUp"					"BtnDTNM"
		"navDown"				"BtnDT3"
		"labelText"				"#L4D360UI_Difficulty_Hard"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m4_mainstreet realism;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDT3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDT3"
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
		"navUp"					"BtnDT2"
		"navDown"				"BtnBack"
		"labelText"				"#L4D360UI_Difficulty_Impossible"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m4_mainstreet realism;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnDT3"
		"navDown"				"BtnDTEY"
		"labelText"				"#L4D360UI_Tooltip_Back"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"FlmDTRLFlyout"
	}
}