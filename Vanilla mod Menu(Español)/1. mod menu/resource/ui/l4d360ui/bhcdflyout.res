"Resource/UI/BHCDFlyout.res"
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
		"navUp"					"BtnBH3"
		"navDown"				"BtnBHNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m1_hilltop coop;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
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
		"navDown"				"BtnBH2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m1_hilltop coop;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
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
		"navUp"					"BtnBH"
		"navDown"				"BtnBH3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m1_hilltop coop;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
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
		"navDown"				"BtnBHEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Blood Harvest"
		"style"					"FlyoutMenuButton"
		"command"				"#map c12m1_hilltop coop;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}