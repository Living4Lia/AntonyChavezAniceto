"Resource/UI/PGVFlyout.res"
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

	"BtnPG"
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
		"navUp"					"BtnPG3"
		"navDown"				"BtnPG2"
		"labelText"				"1: Rivera"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDVFlyout"
	}
	
	"BtnPG2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPG2"
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
		"navUp"					"BtnPG"
		"navDown"				"BtnPG3"
		"labelText"				"2: Bajo tierra"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDV1Flyout"
	}
	
	"BtnPG3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPG3"
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
		"navUp"					"BtnPG2"
		"navDown"				"BtnPG"
		"labelText"				"3: Puerto"
		"tooltiptext"			"Start Split-screen The Passing"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPGCDV2Flyout"
	}
}