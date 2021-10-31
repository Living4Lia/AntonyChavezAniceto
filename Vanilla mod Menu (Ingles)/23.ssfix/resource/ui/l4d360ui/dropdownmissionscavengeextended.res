"Resource/UI/DropDownMission.res"
{
	"FlyoutMenuSettings"
	{
		"noblindnavigation"		"1"
	}

	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"156"
		"tall"					"330" [$X360]
		"tall"					"330" [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

		"BtnCampaign1"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaignCustom" [$X360]
		"navUp"					"BtnCampaignCustom" [$WIN32]
		"navDown"				"BtnCampaign6"
		"labelText"				"#L4D360UI_CampaignName_C1" //Punto Muerto
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C1"
	}
	
		"BtnCampaign6"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign6"
		"xpos"					"0"
		"ypos"					"20"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign1"
		"navDown"				"BtnCampaign2" [$X360]
		"navDown"				"BtnCampaign2" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C6" //Defunción
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C6"
	}
	
		"BtnCampaign2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign2"
		"xpos"					"0"
		"ypos"					"40"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign6"
		"navDown"				"BtnCampaign3"
		"labelText"				"#L4D360UI_CampaignName_C2"  //Feria Siniestra
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C2"
	}
	
		"BtnCampaign3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign3"
		"xpos"					"0"
		"ypos"					"60"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign2"
		"navDown"				"BtnCampaign4"
		"labelText"				"#L4D360UI_CampaignName_C3" //Pantanos
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C3"
	}	
	
	
		"BtnCampaign4"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign4"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign3"
		"navDown"				"BtnCampaign5"
		"labelText"				"#L4D360UI_CampaignName_C4"  //El Diluvio
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C4"
	}
	
		"BtnCampaign5"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign5"
		"xpos"					"0"
		"ypos"					"100"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign4"
		"navDown"				"BtnCampaign8" [$X360]
		"navDown"				"BtnCampaign8" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C5" //La Parroquia
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C5"
	}
	
		"BtnCampaign8"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign8"
		"xpos"					"0"
		"ypos"					"130"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign5"
		"navDown"				"BtnCampaign9" [$X360]
		"navDown"				"BtnCampaign9" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C8" //Alta Medica
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C8"
	}
	
		"BtnCampaign9"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign9"
		"xpos"					"0"
		"ypos"					"150"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign8"
		"navDown"				"BtnCampaign10" [$X360]
		"navDown"				"BtnCampaign10" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C9" //Terapia de Choque
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C9"
	}
	
		"BtnCampaign10"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign10"
		"xpos"					"0"
		"ypos"					"170"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign9"
		"navDown"				"BtnCampaign11" [$X360]
		"navDown"				"BtnCampaign11" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C10" //Toque de difuntos
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C10"
	}
	
		"BtnCampaign11"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign11"
		"xpos"					"0"
		"ypos"					"190"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign10"
		"navDown"				"BtnCampaign12" [$X360]
		"navDown"				"BtnCampaign12" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C11" //Ultimo vuelo
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C11"
	}

		"BtnCampaign12"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign12"
		"xpos"					"0"
		"ypos"					"210"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign11"
		"navDown"				"BtnCampaign7" [$X360]
		"navDown"				"BtnCampaign7" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C12" //Cosecha de sangre
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C12"
	}
	
		"BtnCampaign7"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign7"
		"xpos"					"0"
		"ypos"					"230"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign12"
		"navDown"				"BtnCampaign13" [$X360]
		"navDown"				"BtnCampaign13" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C7" //El Sacrificio
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C7"
	}
	
		"BtnCampaign14"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign14"
		"xpos"					"0"
		"ypos"					"260"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign13"
		"navDown"				"BtnCampaignCustom" [$X360]
		"navDown"				"BtnCampaignCustom" [$WIN32]
		"labelText"				"#L4D360UI_CampaignName_C14" //La batalla final
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C14"
	}

	"BtnAny"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAny"
		"xpos"					"0"
		"ypos"					"280"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign14"
		"navDown"				"BtnCampaignCustom"
		"labelText"				"#L4D360UI_Campaign_Any"
		"tooltiptext"			"#L4D360UI_Campaign_Tooltip_Any"
		"disabled_tooltiptext"	"#L4D360UI_Campaign_Tooltip_Any_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_"
	}

	"BtnCampaignCustom"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaignCustom"
		"xpos"					"0"
		"ypos"					"300"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1" [$WIN32]
		"visible"				"0" [$X360]
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnAny"
		"navDown"				"BtnCampaign1"
		"labelText"				"#L4D360UI_Campaign_Custom"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_addoncampaign"
	}
}