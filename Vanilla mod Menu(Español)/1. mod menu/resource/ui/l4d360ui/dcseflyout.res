"Resource/UI/DCSEFlyout.res"
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
		"tall"					"25"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnDCSE"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDCSV"
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
		"navUp"					"BtnDCSV"
		"navDown"				"BtnDCSV"
		"labelText"				"4: Atrio"
		"tooltiptext"			"Start Split-screen Dead Center"
		"style"					"FlyoutMenuButton"
		"command"				"FlmDCCDSE3Flyout"
	}
}