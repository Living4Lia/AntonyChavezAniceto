"Resource/UI/PGCDSE2Flyout.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"192" [$ENGLISH]
		"wide"					"270" [!$ENGLISH]
		"tall"					"65"  [$X360]
		"tall"					"85"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}
	
	"BtnPGEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGEY"
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
		"navUp"					"BtnPG3"
		"navDown"				"BtnPGNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"#map c6m3_port scavenge;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnPGNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGNM"
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
		"navUp"					"BtnPGEY"
		"navDown"				"BtnPG2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"#map c6m3_port scavenge;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnPG2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPG2"
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
		"navUp"					"BtnPGNM"
		"navDown"				"BtnPG3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"#map c6m3_port scavenge;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnPG3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPG3"
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
		"navUp"					"BtnPG2"
		"navDown"				"BtnPGEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"#map c6m3_port scavenge;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}