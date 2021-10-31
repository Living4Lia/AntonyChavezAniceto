"Resource/UI/NMSEFlyout.res"
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

	"BtnNMSE"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNMSE"
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
		"navUp"					"BtnNMSE2"
		"navDown"				"BtnNMSE2"
		"labelText"				"1: Apartamentos"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCDSEFlyout"
	}

	"BtnNMSE2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNMSE2"
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
		"navUp"					"BtnNMSE"
		"navDown"				"BtnNMSE"
		"labelText"				"5: Clímax en la azotea"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCDSE4Flyout"
	}
}