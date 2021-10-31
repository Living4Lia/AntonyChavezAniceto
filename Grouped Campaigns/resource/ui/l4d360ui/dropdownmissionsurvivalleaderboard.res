"Resource/UI/DropDownMissionSurvivalLeaderboard.res"
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
		"wide"					"260" [$ENGLISH]
		"wide"					"350" [!$ENGLISH]
		"tall"					"180" [$X360]
		"tall"					"180" [$WIN32]
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
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaignCustom"
		"navDown"				"BtnCampaign6"
		"navLeft"				"BtnCampaign8"
		"navRight"				"BtnCampaign8"
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
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign1"
		"navDown"				"BtnCampaign2"
		"navLeft"				"BtnCampaign9"
		"navRight"				"BtnCampaign9"
		"labelText"				"#L4D360UI_CampaignName_C6" [!($X360 && !$DLC1_INSTALLED)] //Defunción
		"labelText"				"#L4D360UI_CampaignName_C6_DLC" [$X360 && !$DLC1_INSTALLED]
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
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign6"
		"navDown"				"BtnCampaign3"
		"navLeft"				"BtnCampaign10"
		"navRight"				"BtnCampaign10"
		"labelText"				"#L4D360UI_CampaignName_C2" //Feria Siniestra
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
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign2"
		"navDown"				"BtnCampaign4"
		"navLeft"				"BtnCampaign11"
		"navRight"				"BtnCampaign11"
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
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign3"
		"navDown"				"BtnCampaign5"
		"navLeft"				"BtnCampaign12"
		"navRight"				"BtnCampaign12"
		"labelText"				"#L4D360UI_CampaignName_C4" //El Diluvio
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
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign4"
		"navDown"				"BtnCampaign13"
		"navLeft"				"BtnCampaign7"
		"navRight"				"BtnCampaign7"
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
		"xpos"					"125"
		"ypos"					"0"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign14"
		"navDown"				"BtnCampaign9"
		"navLeft"				"BtnCampaign1"
		"navRight"				"BtnCampaign1"
		"labelText"				"#L4D360UI_CampaignName_C8" [!($X360 && !$DLC2_INSTALLED)] //Alta Medica
		"labelText"				"#L4D360UI_CampaignName_C8_DLC" [$X360 && !$DLC2_INSTALLED]
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C8"
	}

	"BtnCampaign9"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign9"
		"xpos"					"125"
		"ypos"					"20"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign8"
		"navDown"				"BtnCampaign10"
		"navLeft"				"BtnCampaign6"
		"navRight"				"BtnCampaign6"
		"labelText"				"#L4D360UI_CampaignName_C9" [!($X360 && !$DLC3_INSTALLED)] //Terapia de Choque
		"labelText"				"#L4D360UI_CampaignName_C9_DLC" [$X360 && !$DLC3_INSTALLED]
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C9"
	}

	"BtnCampaign10"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign10"
		"xpos"					"125"
		"ypos"					"40"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign9"
		"navDown"				"BtnCampaign11"
		"navLeft"				"BtnCampaign2"
		"navRight"				"BtnCampaign2"
		"labelText"				"#L4D360UI_CampaignName_C10" [!($X360 && !$DLC3_INSTALLED)] //Toque de difuntos
		"labelText"				"#L4D360UI_CampaignName_C10_DLC" [$X360 && !$DLC3_INSTALLED]
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C10"
	}

	"BtnCampaign11"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign11"
		"xpos"					"125"
		"ypos"					"60"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign10"
		"navDown"				"BtnCampaign12"
		"navLeft"				"BtnCampaign3"
		"navRight"				"BtnCampaign3"
		"labelText"				"#L4D360UI_CampaignName_C11" [!($X360 && !$DLC3_INSTALLED)] //Ultimo vuelo
		"labelText"				"#L4D360UI_CampaignName_C11_DLC" [$X360 && !$DLC3_INSTALLED]
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C11"
	}

	"BtnCampaign12"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign12"
		"xpos"					"125"
		"ypos"					"80"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign11"
		"navDown"				"BtnCampaign7"
		"navLeft"				"BtnCampaign4"
		"navRight"				"BtnCampaign4"
		"labelText"				"#L4D360UI_CampaignName_C12" [!($X360 && !$DLC3_INSTALLED)] //Cosecha de sangre
		"labelText"				"#L4D360UI_CampaignName_C12_DLC" [$X360 && !$DLC3_INSTALLED]
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C12"
	}
	
	"BtnCampaign7"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign7"
		"xpos"					"125"
		"ypos"					"100"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign12"
		"navDown"				"BtnCampaign14"
		"navLeft"				"BtnCampaign5"
		"navRight"				"BtnCampaign5"
		"labelText"				"#L4D360UI_CampaignName_C7" [!($X360 && !$DLC2_INSTALLED)]
		"labelText"				"#L4D360UI_CampaignName_C7_DLC" [$X360 && !$DLC2_INSTALLED] //El Sacrificio
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C7"
	}

	"BtnCampaign13"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign13"
		"xpos"					"0"
		"ypos"					"130"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign5"
		"navDown"				"BtnCampaignCustom"
		"navLeft"				"BtnCampaign14"
		"navRight"				"BtnCampaign14"
		"labelText"				"#L4D360UI_CampaignName_C13" [!($X360 && !$DLC3_INSTALLED)] 
		"labelText"				"#L4D360UI_CampaignName_C13_DLC" [$X360 && !$DLC3_INSTALLED] //Aguas turbulentas
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C13"
	}

	"BtnCampaign14"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign14"
		"xpos"					"125"
		"ypos"					"130"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign7"
		"navDown"				"BtnCampaignCustom"
		"navLeft"				"BtnCampaign13"
		"navRight"				"BtnCampaign13"
		"labelText"				"#L4D360UI_CampaignName_C14" [!($X360 && !$DLC3_INSTALLED)]
		"labelText"				"#L4D360UI_CampaignName_C14_DLC" [$X360 && !$DLC3_INSTALLED] //La batalla final
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_L4D2C14"
	}
	
	"BtnCampaignCustom"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaignCustom"
		"xpos"					"0"
		"ypos"					"150"
		"zpos"					"1"
		"wide"					"125"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1" [$WIN32]
		"visible"				"0" [$X360]
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCampaign13"
		"navDown"				"BtnCampaign1"
		"navLeft"				"BtnCampaign14"
		"navRight"				"BtnCampaign14"
		"labelText"				"#L4D360UI_Campaign_Custom"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_addoncampaign"
	}
}
