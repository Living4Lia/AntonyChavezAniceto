"Resource/UI/HRSEFlyout.res"
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
		"tall"					"65"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnHRSE"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRSE"
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
		"navUp"					"BtnHRSE3"
		"navDown"				"BtnHRSE2"
		"labelText"				"1: Ciudad factoría"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"FlmHRCDSEFlyout"
	}
	
	"BtnHRSE2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRSE2"
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
		"navUp"					"BtnHRSE"
		"navDown"				"BtnHRSE3"
		"labelText"				"2: Azucarera"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"FlmHRCDSE1Flyout"
	}
	
	"BtnHRSE3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRSE3"
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
		"navUp"					"BtnHRSE2"
		"navDown"				"BtnHRSE"
		"labelText"				"3: Huída de la azucarera"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"FlmHRCDSE2Flyout"
	}
}