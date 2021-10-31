"Resource/UI/PSSVFlyout.res"
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
		"tall"					"45"  [$X360]
		"tall"					"45"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnPSSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPSSV"
		"xpos"					"0"
		"ypos"					"00"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"		
		"navUp"					"BtnPSSV2"
		"navDown"				"BtnPSSV2"
		"labelText"				"2: Estación de autobuses"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPSCDSV1Flyout"
	}
	
	"BtnPSSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPSSV2"
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
		"navUp"					"BtnPSSV"
		"navDown"				"BtnPSSV"
		"labelText"				"5: Puente"
		"tooltiptext"			"Start Split-screen The Parish"
		"style"					"FlyoutMenuButton"
		"command"				"FlmPSCDSV4Flyout"
	}
}