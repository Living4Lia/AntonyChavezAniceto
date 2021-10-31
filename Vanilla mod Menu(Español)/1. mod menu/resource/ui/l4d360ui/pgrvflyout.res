"Resource/UI/PGRVFlyout.res"
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
		"tall"					"65"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnPGRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGRL"
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
		"navUp"					"BtnPGRL3"
		"navDown"				"BtnPGRL2"
		"labelText"				"1: Rivera"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDRVFlyout"
	}
	
	"BtnPGRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGRL2"
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
		"navUp"					"BtnPGRL"
		"navDown"				"BtnPGRL3"
		"labelText"				"2: Bajo tierra"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDRV1Flyout"
	}
	
	"BtnPGRL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGRL3"
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
		"navUp"					"BtnPGRL2"
		"navDown"				"BtnPGRL"
		"labelText"				"3: Puerto"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDRV2Flyout"
	}
}