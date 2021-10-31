"Resource/UI/ExtrasFlyout.res"
{
	"PnlBackground"
	{
		"ControlName"		"Panel"
		"fieldName"			"PnlBackground"
		"xpos"				"0"
		"ypos"				"0"
		"zpos"				"-1"
		"wide"				"230"
		"tall"				"177"
		"visible"			"1"
		"enabled"			"1"
		"paintbackground"	"1"
		"paintborder"		"1"
	}
	
	"BtnStatsAndAchievements"	[$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnStatsAndAchievements"
		"xpos"					"10"
		"ypos"					"0"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"proportionalToParent"	"1"
		"navUp"					"Reloadscheme"
		"navDown"				"BtnBlogPost"
		"tooltiptext"			"#L4D360UI_MainMenu_StatsAndAchievements_Tip"
		"labelText"				"#L4D360UI_MainMenu_StatsAndAchievements"
		"style"					"FlyoutMenuButton"
		"command"				"StatsAndAchievements"
	}
	
	"IconBlogPost"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconBlogPost"
		"xpos"					"2"
		"ypos"					"14"
		"wide"					"15"
		"tall"					"15"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"rssfeed"
		"frame"					"0"
		"scaleImage"			"1"
	}	
	
	"BtnBlogPost"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBlogPost"
		"xpos"					"10"
		"ypos"					"20"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnStatsAndAchievements"
		"navDown"				"BtnCommentary" 
		"labelText"				"#L4D360UI_MainMenu_BlogPost"
		"tooltiptext"			"Opens the Mutation list"
		"style"					"FlyoutMenuButton"
		"command"				"ShowBlogPost"
		"ActivationType"		"1"
		"EnableCondition"					"Never" [$DEMO]
	}

	"BtnCommentary"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCommentary"
		"xpos"					"10"
		"ypos"					"40"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnBlogPost"  [$WIN32]
		"navUp"					"BtnBlogPost" [$X360]
		"navDown"				"BtnCredits"
		"tooltiptext"			"#L4D360UI_Extras_Commentary_Tip"
		"labelText"				"#L4D360UI_Extras_Commentary"
		"style"					"FlyoutMenuButton"
		"command"				"DeveloperCommentary"
	}

	"BtnCredits"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCredits"
		"xpos"					"10"
		"ypos"					"60"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnCommentary"
		"navDown"				"RebuildAudioCache" [$X360]
		"navDown"				"RebuildAudioCache" [$WIN32]
		"tooltiptext"			"#L4D360UI_Extras_Credits_Tip"
		"labelText"				"#L4D360UI_Extras_Credits"
		"style"					"FlyoutMenuButton"
		"command"				"Credits"
	}
	
	"RebuildAudioCache"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"RebuildAudioCache"
		"xpos"					"10"
		"ypos"					"90"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnCredits"
		"navDown"				"UpdateAudioCache" [$X360]
		"navDown"				"UpdateAudioCache" [$WIN32]
		"tooltiptext"			""
		"labelText"				"Rebuild Audio Cache"
		"style"					"FlyoutMenuButton"
		"command"				"#snd_rebuildaudiocache"
	}
	
	"UpdateAudioCache"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"UpdateAudioCache"
		"xpos"					"10"
		"ypos"					"110"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"RebuildAudioCache"
		"navDown"				"Reloadscheme" [$X360]
		"navDown"				"Reloadscheme" [$WIN32]
		"tooltiptext"			""
		"labelText"				"Update Audio Cache"
		"style"					"FlyoutMenuButton"
		"command"				"#snd_updateaudiocache"
	}
	
	"Reloadscheme"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"Reloadscheme"
		"xpos"					"10"
		"ypos"					"130"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"UpdateAudioCache"
		"navDown"				"BtnStatsAndAchievements" [$X360]
		"navDown"				"BtnStatsAndAchievements" [$WIN32]
		"tooltiptext"			""
		"labelText"				"ReloadFont.cfg"
		"style"					"FlyoutMenuButton"
		"command"				"#exec reloadfont.cfg"
	}
	
	"interp"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"interp"
		"xpos"					"10"
		"ypos"					"150"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"UpdateAudioCache"
		"navDown"				"BtnStatsAndAchievements" [$X360]
		"navDown"				"BtnStatsAndAchievements" [$WIN32]
		"tooltiptext"			""
		"labelText"				"set LERPS to 0"
		"style"					"FlyoutMenuButton"
		"command"				"#cl_cmdrate 100;cl_updaterate 101;cl_interp 0;cl_interp_ratio 0"
	}

}