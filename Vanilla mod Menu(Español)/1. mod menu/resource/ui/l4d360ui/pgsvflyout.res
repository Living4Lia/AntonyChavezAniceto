"Resource/UI/PGSVFlyout.res"
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

	"BtnPGSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPG"
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
		"navUp"					"BtnPGSV3"
		"navDown"				"BtnPGSV2"
		"labelText"				"1: Rivera"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDSVFlyout"
	}
	
	"BtnPGSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGSV2"
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
		"navUp"					"BtnPGSV"
		"navDown"				"BtnPGSV3"
		"labelText"				"2: Bajo tierra"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDSV1Flyout"
	}
	
	"BtnPGSV3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPGSV3"
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
		"navUp"					"BtnPGSV2"
		"navDown"				"BtnPGSV"
		"labelText"				"3: Puerto"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDSV2Flyout"
	}
}