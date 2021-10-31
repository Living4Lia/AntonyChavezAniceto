"Resource/UI/ExtrasFlyout.res"
{
	"PnlBackground"
	{
		"ControlName"		"Panel"
		"fieldName"			"PnlBackground"
		"xpos"				"0"
		"ypos"				"0"
		"zpos"				"-1"
		"wide"				"230" [$ENGLISH]
		"wide"				"230" [!$ENGLISH]
		"tall"				"45" [$X360]
		"tall"				"85" [$WIN32]
		"visible"			"1"
		"enabled"			"1"
		"paintbackground"	"1"
		"paintborder"		"1"
	}
	
		"BtnAddons"	[$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAddons"
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
		"navUp"					"BtnCredits"
		"navDown"				"BtnBlogPost"
		"tooltiptext"			"#L4D360UI_Extras_Addons_Tip"
		"labelText"				"#L4D360UI_Extras_Addons"
		"style"					"FlyoutMenuButton"
		"command"				"Addons"
	}
	
	"IconBlogPost"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconBlogPost"
		"xpos"					"0"
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
		"navUp"					"BtnAddons"
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
		"navDown"				"BtnCommentary" [$X360]
		"navDown"				"BtnAddons" [$WIN32]
		"tooltiptext"			"#L4D360UI_Extras_Credits_Tip"
		"labelText"				"#L4D360UI_Extras_Credits"
		"style"					"FlyoutMenuButton"
		"command"				"Credits"
	}


}