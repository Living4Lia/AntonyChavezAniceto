"Resource/UI/DACDRL1Flyout.res"
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
	
	"BtnDAEY"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDAEY"
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
		"navUp"					"BtnDA3"
		"navDown"				"BtnDANM"
		"labelText"				"Fácil"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m2_offices realism;z_difficulty Easy;wait 100;connect_splitscreen localhost 2"
	}

	"BtnDANM"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDANM"
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
		"navUp"					"BtnDAEY"
		"navDown"				"BtnDA2"
		"labelText"				"Normal"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m2_offices realism;z_difficulty Normal;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnDA2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA2"
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
		"navUp"					"BtnDANM"
		"navDown"				"BtnDA3"
		"labelText"				"Avanzado"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m2_offices realism;z_difficulty Hard;wait 100;connect_splitscreen localhost 2"
	}
	
	"BtnDA3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDA3"
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
		"navUp"					"BtnDA2"
		"navDown"				"BtnDAEY"
		"labelText"				"Experto"
		"tooltiptext"			"Start Split-screen Dead Air"
		"style"					"FlyoutMenuButton"
		"command"				"#map c11m2_offices realism;z_difficulty Impossible;wait 100;connect_splitscreen localhost 2"
	}
}