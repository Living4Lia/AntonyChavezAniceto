"Resource/UI/DCLCDVFlyout.res"
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
		"navUp"					"BtnDCL3"
		"navDown"				"BtnDCLNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m1_highway versus;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m1_highway versus;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m1_highway versus;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
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
		"navDown"				"BtnDCLEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"#map c2m1_highway versus;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}