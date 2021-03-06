"Resource/UI/DCLRLFlyout.res"
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
		"tall"					"105"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnDCLRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLRL"
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
		"navUp"					"BtnDCLRL5"
		"navDown"				"BtnDCLRL2"
		"labelText"				"1: Autopista"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDRLFlyout"
	}
	
	"BtnDCLRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLRL2"
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
		"navUp"					"BtnDCLRL"
		"navDown"				"BtnDCLRL3"
		"labelText"				"2: Feria"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDRL1Flyout"
	}
	
	"BtnDCLRL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLRL3"
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
		"navUp"					"BtnDCLRL2"
		"navDown"				"BtnDCLRL4"
		"labelText"				"3: Montaña rusa"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDRL2Flyout"
	}
	
	"BtnDCLRL4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLRL4"
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
		"navUp"					"BtnDCLRL3"
		"navDown"				"BtnDCLRL5"
		"labelText"				"4: Granja"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDRL3Flyout"
	}
	
	"BtnDCLRL5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCLRL5"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"		
		"navUp"					"BtnDCLRL4"
		"navDown"				"BtnDCLRL"
		"labelText"				"5: Concierto"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDRL4Flyout"
	}
}