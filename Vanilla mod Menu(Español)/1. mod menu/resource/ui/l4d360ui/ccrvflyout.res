"Resource/UI/CCRVFlyout.res"
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
		"tall"					"45"  [$X360]
		"tall"					"45"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnCCRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCCRL"
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
		"navUp"					"BtnCCRL2"
		"navDown"				"BtnCCRL2"
		"labelText"				"1: Callejones"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCCCDRVFlyout"
	}
	
	"BtnCCRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCCRL"
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
		"navUp"					"BtnCCRL"
		"navDown"				"BtnCCRL"
		"labelText"				"2: Clímax en el garaje de camiones"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCCCDRV1Flyout"
	}
}