"Resource/UI/NMCD3Flyout.res"
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
	
	"BtnNMEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNMEY"
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
		"navUp"					"BtnNM3"
		"navDown"				"BtnNMNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m4_interior coop;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnNMNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNMNM"
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
		"navUp"					"BtnNMEY"
		"navDown"				"BtnNM2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m4_interior coop;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnNM2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM2"
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
		"navUp"					"BtnNMNM"
		"navDown"				"BtnNM3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m4_interior coop;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnNM3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNM3"
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
		"navUp"					"BtnNM2"
		"navDown"				"BtnNMEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"#map c8m4_interior coop;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}