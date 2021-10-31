"Resource/UI/SFSVFlyout.res"
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

	"BtnSFSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSFSV"
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
		"navUp"					"BtnSFSV2"
		"navDown"				"BtnSFSV2"
		"labelText"				"1: Ciudad cocodrilo"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFCDSVFlyout"
	}
	
	"BtnSFSV2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSFSV2"
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
		"navUp"					"BtnSFSV"
		"navDown"				"BtnSFSV"
		"labelText"				"4: Plantación"
		"tooltiptext"			"Start Split-screen Swamp Fever"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSFCDSV3Flyout"
	}
}