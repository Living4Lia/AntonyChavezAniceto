"Resource/UI/CCCDRV1Flyout.res"
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
	
	"BtnCCEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCCEY"
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
		"navUp"					"BtnCC3"
		"navDown"				"BtnCCNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"#map c9m2_lots mutation12;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnCCNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCCNM"
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
		"navUp"					"BtnCCEY"
		"navDown"				"BtnCC2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"#map c9m2_lots mutation12;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnCC2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCC2"
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
		"navUp"					"BtnCC"
		"navDown"				"BtnCC3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"#map c9m2_lots mutation12;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnCC3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCC3"
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
		"navUp"					"BtnCC2"
		"navDown"				"BtnCCEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"#map c9m2_lots mutation12;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}