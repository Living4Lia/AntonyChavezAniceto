"Resource/UI/SCFlyout.res"
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

	"BtnSC"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSC"
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
		"navUp"					"BtnSC3"
		"navDown"				"BtnSC2"
		"labelText"				"1: Muelles"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCDFlyout"
	}
	
	"BtnSC2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSC2"
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
		"navUp"					"BtnSC"
		"navDown"				"BtnSC3"
		"labelText"				"2: Barco"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCD1Flyout"
	}
	
	"BtnSC3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSC3"
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
		"navUp"					"BtnSC2"
		"navDown"				"BtnSC"
		"labelText"				"3: Final en el puerto"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCD2Flyout"
	}
}