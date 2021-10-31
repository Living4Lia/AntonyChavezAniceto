"Resource/UI/SFCD3Flyout.res"
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
	
	"BtnSFEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSFEY"
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
		"navUp"					"BtnSF3"
		"navDown"				"BtnSFNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"#map c3m4_plantation coop;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnSFNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSFNM"
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
		"navUp"					"BtnSFEY"
		"navDown"				"BtnSF2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"#map c3m4_plantation coop;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnSF2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF2"
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
		"navUp"					"BtnSFNM"
		"navDown"				"BtnSF3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"#map c3m4_plantation coop;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnSF3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF3"
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
		"navUp"					"BtnSF2"
		"navDown"				"BtnSFEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"#map c3m4_plantation coop;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}