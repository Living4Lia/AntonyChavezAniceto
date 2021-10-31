"Resource/UI/SplitModesFlyout.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"180" [$ENGLISH]
		"wide"					"270" [!$ENGLISH]
		"tall"					"200"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnCP"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCP"
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
		"navUp"					"BtnSplitScreenDirection"
		"navDown"				"BtnRL"
		"labelText"				"#L4D360UI_Mode_coop"
		"tooltiptext"			"Start Split-screen CoOp"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitFlyout"
		"ActivationType"		"1"
	}
	
		"BtnRL"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnRL"
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
		"navUp"					"BtnCP"
		"navDown"				"BtnVS"
		"labelText"				"#L4D360UI_Mode_realism"
		"tooltiptext"			"Start Split-screen Realism"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRLFlyout"
		"ActivationType"		"1"
	}

	"BtnVS"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnVS"
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
		"navUp"					"BtnRL"
		"navDown"				"BtnRV"
		"labelText"				"#L4D360UI_Mode_versus"
		"tooltiptext"			"Start Split-screen Versus"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitVerFlyout"
		"ActivationType"		"1"
	}
	
		"BtnRV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnRV"
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
		"navUp"					"BtnVS"
		"navDown"				"BtnSV"
		"labelText"				"#L4D360UI_Mode_mutation12"
		"tooltiptext"			"Start Split-screen Realism Versus"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitRVerFlyout"
		"ActivationType"		"1"
	}

	"BtnSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSV"
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
		"navUp"					"BtnRV"
		"navDown"				"BtnVSSV"
		"labelText"				"#L4D360UI_Mode_survival"
		"tooltiptext"			"Start Split-screen Survival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitSVFlyout"
		"ActivationType"		"1"
	}
	
		"BtnVSSV"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnVSSV"
		"xpos"					"0"
		"ypos"					"100"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnSV"
		"navDown"				"BtnSE"
		"labelText"				"#L4D360UI_Mode_mutation15"
		"tooltiptext"			"Start Split-screen Versus Survival"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitVerSVFlyout"
		"ActivationType"		"1"
	}


	"BtnSE"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSE"
		"xpos"					"0"
		"ypos"					"120"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnVSSV"
		"navDown"				"BtnSplitScreenConnection"
		"labelText"				"#L4D360UI_Mode_scavenge"
		"tooltiptext"			"Start Split-screen Scavenge"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitSEFlyout"
		"ActivationType"		"1"
	}


	"BtnSplitScreenConnection"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSplitScreenConnection"
		"xpos"					"0"
		"ypos"					"150"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnSE"
		"navDown"				"BtnSplitScreenDirection"
		"labelText"				"Conexión"
		"tooltiptext"			"#L4D360UI_GameOptions"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitScreenConnection"
		"ActivationType"		"1"
	}

	"BtnSplitScreenDirection"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSplitScreenDirection"
		"xpos"					"0"
		"ypos"					"170"
		"wide"					"50"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnSplitScreenConnection"
		"navDown"				"BtnCP"
		"labelText"				"Orientación de pantalla dividida"
		"tooltiptext"			"#L4D360UI_VideoOptions_Tooltip_SplitScreenDirection"
		"style"					"FlyoutMenuButton"
		"command"				"FlmSplitScreenDirection"
		"ActivationType"		"1"
		"EnableCondition"					"Never" [$DEMO]
	}
}