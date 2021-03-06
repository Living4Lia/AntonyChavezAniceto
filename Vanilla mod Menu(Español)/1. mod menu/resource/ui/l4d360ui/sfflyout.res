"Resource/UI/SFFlyout.res"
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

	"BtnSF"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF"
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
		"navUp"					"BtnSF4"
		"navDown"				"BtnSF2"
		"labelText"				"1: Tablones"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFCDFlyout"
	}
	
	"BtnSF2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF2"
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
		"navUp"					"BtnSF"
		"navDown"				"BtnSF3"
		"labelText"				"2: Pantano"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFCD1Flyout"
	}
	
	"BtnSF3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF3"
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
		"navUp"					"BtnSF2"
		"navDown"				"BtnSF4"
		"labelText"				"3: Chabolas"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFCD2Flyout"
	}
	
	"BtnSF4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSF4"
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
		"navUp"					"BtnSF3"
		"navDown"				"BtnSF"
		"labelText"				"4: Plantaci??n"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFCD3Flyout"
	}
}