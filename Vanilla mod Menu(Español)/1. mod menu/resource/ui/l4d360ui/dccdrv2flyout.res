"Resource/UI/DCCDRV2Flyout.res"
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
	
	"BtnDCEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCEY"
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
		"navUp"					"BtnDC3"
		"navDown"				"BtnDCNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"#map c1m3_mall mutation12;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDCNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCNM"
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
		"navUp"					"BtnDCEY"
		"navDown"				"BtnDC2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"#map c1m3_mall mutation12;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnDC2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDC2"
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
		"navUp"					"BtnDCNM"
		"navDown"				"BtnDC3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"#map c1m3_mall mutation12;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnDC3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDC3"
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
		"navUp"					"BtnDC2"
		"navDown"				"BtnDCEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"#map c1m3_mall mutation12;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}