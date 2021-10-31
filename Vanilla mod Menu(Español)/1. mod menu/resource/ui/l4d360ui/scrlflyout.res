"Resource/UI/SCRLFlyout.res"
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

	"BtnSCRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCRL"
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
		"navUp"					"BtnSCRL3"
		"navDown"				"BtnSCRL2"
		"labelText"				"1: Muelles"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCDRLFlyout"
	}
	
	"BtnSCRL2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCRL2"
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
		"navUp"					"BtnSCRL"
		"navDown"				"BtnSCRL3"
		"labelText"				"2: Barco"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCDRL1Flyout"
	}
	
	"BtnSCRL3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCRL3"
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
		"navUp"					"BtnSCRL2"
		"navDown"				"BtnSCRL"
		"labelText"				"3: Final en el puerto"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCDRL2Flyout"
	}
}