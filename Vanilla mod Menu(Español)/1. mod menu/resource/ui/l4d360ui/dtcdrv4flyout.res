"Resource/UI/DTCDRV4Flyout.res"
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
		"navUp"					"BtnDT3"
		"navDown"				"BtnDTNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m5_houseboat mutation12;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m5_houseboat mutation12;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
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
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m5_houseboat mutation12;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
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
		"navDown"				"BtnDTEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Death Toll"
		"style"					"FlyoutMenuButton"
		"command"				"#map c10m5_houseboat mutation12;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}