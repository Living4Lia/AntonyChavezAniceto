"Resource/UI/SCSVFlyout.res"
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
		"tall"					"45"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnSCSE"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCSE"
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
		"navUp"					"BtnSCSE2"
		"navDown"				"BtnSCSE2"
		"labelText"				"1: Fábrica de ladrillos"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCDSEFlyout"
	}
	
	"BtnSCSE2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSCSE2"
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
		"navUp"					"BtnSCSE"
		"navDown"				"BtnSCSE"
		"labelText"				"2: Barco"
		"tooltiptext"			"Start Split-screen The Sacrifice"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSCCDSE1Flyout"
	}
}