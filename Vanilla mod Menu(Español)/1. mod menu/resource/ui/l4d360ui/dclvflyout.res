"Resource/UI/DCLVFlyout.res"
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

	"BtnDCL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL"
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
		"navUp"					"BtnDCL5"
		"navDown"				"BtnDCL2"
		"labelText"				"1: Autopista"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDVFlyout"
	}
	
	"BtnDCL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL2"
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
		"navUp"					"BtnDCL"
		"navDown"				"BtnDCL3"
		"labelText"				"2: Feria"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDV1Flyout"
	}
	
	"BtnDCL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL3"
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
		"navUp"					"BtnDCL2"
		"navDown"				"BtnDCL4"
		"labelText"				"3: Montaña rusa"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDV2Flyout"
	}
	
	"BtnDCL4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL4"
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
		"navUp"					"BtnDCL3"
		"navDown"				"BtnDCL5"
		"labelText"				"4: Granja"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDV3Flyout"
	}
	
	"BtnDCL5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCL5"
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
		"navUp"					"BtnDCL4"
		"navDown"				"BtnDCL"
		"labelText"				"5: Concierto"
		"tooltiptext"			"Start Split-screen Dark Carnival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCLCDV4Flyout"
	}
}