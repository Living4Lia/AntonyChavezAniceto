"Resource/UI/NMSVFlyout.res"
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

	"BtnNMSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNMSV"
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
		"navUp"					"BtnNMSV2"
		"navDown"				"BtnNMSV2"
		"labelText"				"2: Cuarto del generador"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCDSV1Flyout"
	}

	"BtnNMSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnNMSV2"
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
		"navUp"					"BtnSV"
		"navDown"				"BtnSV"
		"labelText"				"5: Clímax en la azotea"
		"tooltiptext"			"Start Split-screen No Mercy"
		"style"					"FlyoutMenuButton"
		"command"				"FlmNMCDSV4Flyout"
	}
}