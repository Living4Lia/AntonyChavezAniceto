"Resource/UI/CampaignFlyout.res"
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
		"tall"					"65"  [$X360]
		"tall"					"105"  [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnQuickMatch"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnQuickMatch"
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
		"navUp"					"BtnPlayRealismWithFriends"	[$X360]
		"navUp"					"BtnPlayOnGroupServer"		[$WIN32]
		"navDown"				"BtnSinglePlayer"
		"labelText"				"#L4D360UI_QuickMatch"
		"tooltiptext"			"#L4D360UI_QuickMatch_Tip"
		"disabled_tooltiptext"	"#L4D360UI_QuickMatch_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"QuickMatch_realism"
	}

	"BtnSinglePlayer"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnSinglePlayer"
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
		"navUp"					"BtnQuickMatch"
		"navDown"				"BtnPlayRealismWithAnyone"
		"labelText"				"#L4D360UI_Mode_offline_SP"
		"tooltiptext"			"#L4D360UI_MainMenu_PlaySolo_Tip"
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"SoloPlay_realism"
	}

	"BtnPlayRealismWithAnyone"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayRealismWithAnyone"
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
		"navUp"					"BtnSinglePlayer"
		"navDown"				"BtnPlayRealismWithFriends"
		"labelText"				"#L4D360UI_CustomMatch"	[$X360]
		"labelText"				"#L4D360UI_MainMenu_PlayOnline" [$WIN32]
		"tooltiptext"			"#L4D360UI_MainMenu_PlayRealismWithAnyone_Tip"
		"disabled_tooltiptext"	"#L4D360UI_MainMenu_PlayRealismWithAnyone_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"CustomMatch_realism"
	}	
	
	"BtnPlayRealismWithFriends"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayRealismWithFriends"
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
		"navUp"					"BtnPlayRealismWithAnyone"
		"navDown"				"BtnQuickMatch"			[$X360]
		"navDown"				"BtnPlayOnGroupServer"	[$WIN32]
		"labelText"				"#L4D360UI_MainMenu_PlayRealismWithFriends"
		"tooltiptext"			"#L4D360UI_MainMenu_PlayRealismWithFriends_Tip"
		"disabled_tooltiptext"	"#L4D360UI_MainMenu_PlayRealismWithFriends_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"FriendsMatch_realism"
	}
	
	"BtnPlayOnGroupServer" [$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayOnGroupServer"
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
		"navUp"					"BtnPlayRealismWithFriends"
		"navDown"				"BtnQuickMatch"
		"labelText"				"#L4D360UI_MainMenu_PlayOnGroupServer"
		"tooltiptext"			"#L4D360UI_MainMenu_PlayOnGroupServer_Tip"
		"disabled_tooltiptext"	"#L4D360UI_MainMenu_PlayOnGroupServer_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"GroupServer_realism"
	}
}