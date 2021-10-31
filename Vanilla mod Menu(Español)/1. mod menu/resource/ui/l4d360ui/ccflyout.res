"Resource/UI/CCFlyout.res"
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

	"BtnCC"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCC"
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
		"navUp"					"BtnCC2"
		"navDown"				"BtnCC2"
		"labelText"				"1: Callejones"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCCCDFlyout"
	}
	
	"BtnCC2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCC"
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
		"navUp"					"BtnCC"
		"navDown"				"BtnCC"
		"labelText"				"2: Clímax en el garaje de camiones"
		"tooltiptext"			"Start Split-screen Crash Course"
		"style"					"FlyoutMenuButton"
		"command"				"FlmCCCD1Flyout"
	}
}