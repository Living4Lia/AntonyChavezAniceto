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
		"tall"					"125"  [$WIN32]
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
		"navUp"					"BtnPlayCoopWithFriends"	[$X360]
		"navUp"					"BtnChangeMutation"		[$WIN32]
		"navDown"				"BtnSinglePlayer"
		"labelText"				"#L4D360UI_QuickMatch"
		"tooltiptext"			"#L4D360UI_QuickMatch_Tip"
		"disabled_tooltiptext"	"#L4D360UI_QuickMatch_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"QuickMatch_challenge"
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
		"navDown"				"BtnPlayCoopWithAnyone"
		"labelText"				"#L4D360UI_Mode_offline_SP"
		"tooltiptext"			"#L4D360UI_MainMenu_PlaySolo_Tip"
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"SoloPlay_Challenge"
	}

	"BtnPlayCoopWithAnyone"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayCoopWithAnyone"
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
		"navDown"				"BtnPlayCoopWithFriends"
		"labelText"				"#L4D360UI_CustomMatch"	[$X360]
		"labelText"				"#L4D360UI_MainMenu_PlayOnline" [$WIN32]
		"tooltiptext"			"#L4D360UI_MainMenu_PlayCoopWithAnyone_Tip"
		"disabled_tooltiptext"	"#L4D360UI_MainMenu_PlayCoopWithAnyone_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"CustomMatch_challenge"
	}	
	
	"BtnPlayCoopWithFriends"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayCoopWithFriends"
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
		"navUp"					"BtnPlayCoopWithAnyone"
		"navDown"				"BtnQuickMatch"			[$X360]
		"navDown"				"BtnPlayOnGroupServer"	[$WIN32]
		"labelText"				"#L4D360UI_MainMenu_PlayCoopWithFriends"
		"tooltiptext"			"#L4D360UI_MainMenu_PlayCoopWithFriends_Tip"
		"disabled_tooltiptext"	"#L4D360UI_MainMenu_PlayCoopWithFriends_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"FriendsMatch_challenge"
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
		"navUp"					"BtnPlayCoopWithFriends"
		"navDown"				"BtnChangeMutation"
		"labelText"				"#L4D360UI_MainMenu_PlayOnGroupServer"
		"tooltiptext"			"#L4D360UI_MainMenu_PlayOnGroupServer_Tip"
		"disabled_tooltiptext"	"#L4D360UI_MainMenu_PlayOnGroupServer_Tip_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"GroupServer_challenge"
	}

	"BtnChangeMutation"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnChangeMutation"
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
		"navUp"					"BtnPlayOnGroupServer"
		"navDown"				"BtnQuickMatch"
		"labelText"				"#L4D360UI_MainMenu_ChangeMutation"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"ChooseChallengeMode"
	}
}