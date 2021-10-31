"Resource/UI/PSCDRLFlyout.res"
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
	
	"BtnPSEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPSEY"
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
		"navUp"					"BtnPS3"
		"navDown"				"BtnPSNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m1_waterfront realism;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnPSNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPSNM"
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
		"navUp"					"BtnPSEY"
		"navDown"				"BtnPS2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m1_waterfront realism;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnPS2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS2"
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
		"navUp"					"BtnPSNM"
		"navDown"				"BtnPS3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m1_waterfront realism;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnPS3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPS3"
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
		"navUp"					"BtnPS2"
		"navDown"				"BtnPSEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"#map c5m1_waterfront realism;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}