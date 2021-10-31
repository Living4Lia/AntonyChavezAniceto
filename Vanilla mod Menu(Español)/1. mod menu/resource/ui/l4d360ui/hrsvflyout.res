"Resource/UI/HRSVFlyout.res"
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

	"BtnHRSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRSV"
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
		"navUp"					"BtnHRSV2"
		"navDown"				"BtnHRSV2"
		"labelText"				"1: Ciudad factoría"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"FlmHRCDSVFlyout"
	}
	
	"BtnHRSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHRSV2"
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
		"navUp"					"BtnHRSV"
		"navDown"				"BtnHRSV"
		"labelText"				"2: Azucarera"
		"tooltiptext"			"Start Split-screen Hard Rain"
		"style"					"FlyoutMenuButton"
		"command"				"FlmHRCDSV1Flyout"
	}
}