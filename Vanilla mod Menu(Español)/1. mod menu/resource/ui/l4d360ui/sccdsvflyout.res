"Resource/UI/SCCDSVFlyout.res"
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
	
	"BtnSCEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCEY"
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
		"navUp"					"BtnSC3"
		"navDown"				"BtnSCNM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"#map c7m1_docks survival;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnSCNM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCNM"
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
		"navUp"					"BtnSCEY"
		"navDown"				"BtnSC2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"#map c7m1_docks survival;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnSC2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSC2"
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
		"navUp"					"BtnSCNM"
		"navDown"				"BtnSC3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"#map c7m1_docks survival;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnSC3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSC3"
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
		"navUp"					"BtnSC2"
		"navDown"				"BtnSCEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"#map c7m1_docks survival;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}