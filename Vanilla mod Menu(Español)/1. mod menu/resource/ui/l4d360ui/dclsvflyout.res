"Resource/UI/DCLSVFlyout.res"
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

	"BtnDCLSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLSV"
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
		"navUp"					"BtnDCLSV3"
		"navDown"				"BtnDCLSV2"
		"labelText"				"1. Motel"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDSVFlyout"
	}
	
	"BtnDCLSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLSV2"
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
		"navUp"					"BtnDCLSV"
		"navDown"				"BtnDCLSV3"
		"labelText"				"4. Puerta del estadio"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDSV3Flyout"
	}
	
	"BtnDCLSV3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLSV3"
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
		"navUp"					"BtnDCLSV2"
		"navDown"				"BtnDCLSV"
		"labelText"				"5: Concierto"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDSV4Flyout"
	}
}