"Resource/UI/Addons.res"
{
	"Addons"
	{
		"ControlName"	"Frame"
		"fieldName"		"Addons"
		"xpos"			"0"		
		"ypos"			"0"		
		"wide"			"f0"	
		"tall"			"f0"	
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
	}
	
	"Divider1"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider1"
		"xpos"					"c-268"
		"ypos"					"80"	
		"zpos"					"2"
		"wide"					"252"
		"tall"					"2"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}

	"GplAddons"
	{
		"ControlName"			"GenericPanelList"
		"fieldName"				"GplAddons"
		"xpos"					"c-315" //-256
		"ypos"					"80"	
		"wide"					"300"	
		"tall"					"290"
		"zpos"					"1"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"1"
	}
	
	"Divider2"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider2"
		"xpos"					"c-268"	
		"ypos"					"370"	
		"zpos"					"2"
		"wide"					"252"
		"tall"					"2"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}	

	"LblNoAddonsFiltered"
	{
		"ControlName"		"Label"
		"fieldName"			"LblNoAddonsFiltered"
		"xpos"				"c-280"
		"ypos"				"195"
		"wide"				"274"
		"tall"				"60" 
		"zpos"				"5"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"font"				"DefaultMedium"
		"textAlignment"		"center"
		"labelText"			"#L4D360UI_No_Addons_Filtered"
	}

	"LblNoAddons"
	{
		"ControlName"		"Label"
		"fieldName"			"LblNoAddons"
		"xpos"				"c-268"
		"ypos"				"75"
		"wide"				"640"
		"tall"				"18" 
		"zpos"				"1"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"font"				"DefaultLarge"
		"textAlignment"		"north-west"
	}
	
	"LblFilters"
	{
		"ControlName"				"Label"
		"fieldName"					"LblFilters"
		"xpos"						"c-255"
		"ypos"						"385"
		"zpos"						"2"
		"wide"						"255"
		"tall"						"15"
		"autoResize"				"1"
		"pinCorner"					"0"
		"visible"					"1"
		"enabled"					"1"
		"tabPosition"				"0"
		"labelText"					"#L4D360UI_Addons_Filter_Label"
		"textAlignment"				"north-west"
		"Font"						"DefaultMedium"
		"fgcolor_override"			"MediumGray"
		"AllCaps"					"1"
	}

	"DrpFilterTags"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpFilterTags"
		"xpos"					"c-240"
		"ypos"					"400"
		"zpos"					"1"
		"wide"					"320"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"navUp"					"DrpFilterTags"
		"navDown"				"DrpFilterTags"
		
		// button and label
		"BtnDropButton"
		{
			"ControlName"		"L4D360HybridButton"
			"fieldName"			"BtnDropButton"
			"xpos"				"0"
			"ypos"				"0"
			"zpos"				"2"
			"wide"				"220"
			"wideatopen"		"200"
			"tall"				"15"
			"autoResize"		"1"
			"pinCorner"			"0"
			"visible"			"1"
			"enabled"			"1"
			"tabPosition"		"0"
			"labelText"			"#L4D360UI_Addons_Filter_Tags"
			"tooltiptext"		""
			"style"				"DropDownButton"
			"command"			"FlmFilterTags"
			"allcaps"			"1"
		}
	}

	"FlmFilterTags"
	{
		"ControlName"		"FlyoutMenu"
		"fieldName"			"FlmFilterTags"
		"visible"			"0"
		"wide"				"0"
		"tall"				"0"
		"zpos"				"4"
		"InitialFocus"		"BtnAny"
		"ResourceFile"		"resource/UI/L4D360UI/DropDownAddonsFilterTags.res"
	}

	"AddonSupportRequiredPanel"
	{
		"ControlName"		"EditablePanel"
		"fieldName"			"AddonSupportRequiredPanel"
		"xpos"				"c-180"
		"ypos"				"140"
		"wide"				"400"
		"tall"				"200" 
		"zpos"				"2"
		"visible"			"0"
		"enabled"			"1"
		
		"Icon"
		{
			"ControlName"			"ImagePanel"
			"fieldName"				"Icon"
			"xpos"					"8"	
			"ypos"					"12"
			"zpos"					"1"
			"wide"					"32"
			"tall"					"32"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"scaleImage"			"1"
			"image"					"icon_download"	
			"drawcolor"				"150 150 150 255"
		}
		
		"LblSupportRequired"
		{
			"ControlName"		"Label"
			"fieldName"			"LblInstalling"
			"xpos"				"50"
			"ypos"				"20"
			"wide"				"300"
			"tall"				"18" 
			"zpos"				"1"
			"autoResize"		"0"
			"pinCorner"			"0"
			"visible"			"1"
			"enabled"			"1"
			"tabPosition"		"0"
			"font"				"DefaultLarge"
			"textAlignment"		"west"
			"labelText"			"#L4D360UI_ADDON_SUPPORT_REQUIRED"	//ADD-ON SUPPORT REQUIRED
		}
		
		"LblSupportRequiredDetails"
		{
			"ControlName"		"Label"
			"fieldName"			"LblSupportRequiredDetails"
			"xpos"				"50"
			"ypos"				"44"
			"wide"				"330"
			"tall"				"100" 
			"zpos"				"1"
			"autoResize"		"0"
			"pinCorner"			"0"
			"visible"			"1"
			"enabled"			"1"
			"tabPosition"		"0"
			"font"				"DefaultMedium"
			"textAlignment"		"west"
			"labelText"			"#L4D360UI_ADDON_SUPPORT_REQUIRED_DETAILS"	//"Left 4 Dead 2 requires an additional support package to run third-party add-ons. You can install it from the Tools tab in Steam or by clicking the link below."
			"fgcolor_override"			"MediumGray"
			"wrap"				"1"
		}			
	}
		
	"InstallingAddonSupportPanel"
	{
		"ControlName"		"EditablePanel"
		"fieldName"			"InstallingAddonSupportPanel"
		"xpos"				"c-180"
		"ypos"				"190"
		"wide"				"300"
		"tall"				"50" 
		"zpos"				"2"
		"visible"			"0"
		"enabled"			"1"
		
		"SearchingIcon"
		{
			"ControlName"			"ImagePanel"
			"fieldName"				"SearchingIcon"
			"xpos"					"0"	
			"ypos"					"0"
			"zpos"					"1"
			"wide"					"32"
			"tall"					"32"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"scaleImage"			"1"
			"image"					"common/l4d_spinner"
		}
			
		"LblInstalling"
		{
			"ControlName"		"Label"
			"fieldName"			"LblInstalling"
			"xpos"				"50"
			"ypos"				"0"
			"wide"				"300"
			"tall"				"18" 
			"zpos"				"1"
			"autoResize"		"0"
			"pinCorner"			"0"
			"visible"			"1"
			"enabled"			"1"
			"tabPosition"		"0"
			"font"				"DefaultLarge"
			"textAlignment"		"west"
			"labelText"			"#L4D360UI_ADDON_SUPPORT_INSTALLING"	//"INSTALLING ADD-ON SUPPORT..."
		}
		
		"LblInstallingDetails"
		{
			"ControlName"		"Label"
			"fieldName"			"LblInstallingDetails"
			"xpos"				"50"
			"ypos"				"0"
			"wide"				"200"
			"tall"				"50" 
			"zpos"				"1"
			"autoResize"		"0"
			"pinCorner"			"0"
			"visible"			"1"
			"enabled"			"1"
			"tabPosition"		"0"
			"font"				"DefaultVerySmall"
			"textAlignment"		"west"
			"labelText"			"#L4D360UI_ADDON_SUPPORT_INSTALLING_DETAILS"	//"Check download progress in the Steam Tools tab."
			"fgcolor_override"			"MediumGray"
		}	
	}

	"CheckButtonAssociation"
	{
		"ControlName"	"CvarToggleCheckButton_GameUI"
		"fieldName"		"CheckButtonAssociation"
		"xpos"			"c-140"
		"ypos"			"300"
		"zpos"			"1"
		"wide"			"14"
		"tall"			"14"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"wrap"			"0"
		"Default"		"0"
	}

	"LblCheckNoAssociation"
	{
		"ControlName"	"Label"
		"fieldName"		"LblCheckNoAssociation"
		"xpos"			"c-120"
		"ypos"			"300"
		"zpos"			"1"
		"wide"			"345"
		"tall"			"14"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#L4D360UI_Addon_DoNotAssociate"
		"textAlignment"	"west"
		"font"			"DefaultVerySmall"
	}
	
	"LblName"
	{
		"ControlName"		"Label"
		"fieldName"			"LblName" //Nombre de la ampliación
		"xpos"				"c+138"
		"ypos"				"110"
		"wide"				"165"
		"tall"				"18" 
		"zpos"				"1"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"font"				"DefaultLarge"
		"textAlignment"		"north-west"
	}

	"LblType"
	{
		"ControlName"		"Label"
		"fieldName"			"LblType"
		"xpos"				"c+138"
		"ypos"				"146"
		"wide"				"165"
		"tall"				"15" 
		"zpos"				"1"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"Font"				"DefaultMedium"
		"textAlignment"		"north-west"
		"wrap"				"0"
		"dulltext"			"1"		
	}

	"LblAuthor"
	{
		"ControlName"		"Label"
		"fieldName"			"LblAuthor"
		"xpos"				"c+138"
		"ypos"				"128"
		"wide"				"165"
		"tall"				"15" 
		"zpos"				"1"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"Font"				"DefaultMedium"
		"textAlignment"		"north-west"
		"wrap"				"0"
		"dulltext"			"1"		
	}
	
	"LblDescription"
	{
		"ControlName"		"Label"
		"fieldName"			"LblDescription"
		"xpos"				"c10"
		"ypos"				"183"
		"zpos"				"1"
		"wide"				"300"
		"tall"				"250" 
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"Font"				"Default"
		"textAlignment"		"north-west"
		"wrap"				"1"
		"brighttext"		"1"
		"dulltext"			"0"
	}
	
	"ImgAddonIconSpinner"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"ImgAddonIconSpinner"
		"xpos"				"c+29"	
		"ypos"				"118"
		"zpos"				"10"
		"wide"				"64"
		"tall"				"64"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleImage"		"1"
		"image"					"common/l4d_spinner"
	}	

	"ImgAddonIcon"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"ImgAddonIcon"
		"xpos"				"c"	
		"ypos"				"115"
		"zpos"				"1"
		"wide"				"122"
		"tall"				"69"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleImage"		"1"
	}	
	
	"ImgAddonIconOverlay"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"ImgAddonIconOverlay"
		"image"				"workshop_overlay"
		"xpos"				"c"	
		"ypos"				"115"
		"zpos"				"2"
		"wide"				"122"
		"tall"				"69"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleImage"		"1"
	}	

	"IconInstallSupport"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconInstallSupport"
		"xpos"					"c-226"
		"ypos"					"415"
		"wide"					"15"
		"tall"					"15"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"icon_download"
		"drawcolor"				"150 150 150 255"
		"scaleImage"			"1"
	}

	"BtnInstallSupport"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnInstallSupport"
		"xpos"					"c-211"
		"ypos"					"415"
		"zpos"					"2"
		"wide"					"250"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_ADDON_SUPPORT_INSTALL"	//"INSTALL ADD-ON SUPPORT"
		"style"					"RedButton"		// actually teal!
		"command"				"InstallSupport"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"0"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"allcaps"				"1"
	}
	
	"IconBackArrow"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconBackArrow"
		"xpos"					"c-226"
		"ypos"					"440"
		"wide"					"15"
		"tall"					"15"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"icon_button_arrow_left"
		"scaleImage"			"1"
	}
	
	"BtnCancel"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCancel" //BOTON HECHO
		"xpos"					"c-211"
		"ypos"					"440"
		"zpos"					"1"
		"wide"					"250"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_Done"
		"tooltiptext"			"#L4D360UI_Tooltip_Back"
		"style"					"MainMenuSmallButton"
		"command"				"Back"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"0"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"allcaps"				"1"
	}

	"IconVisitWorkshop"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconVisitWorkshop"
		"xpos"					"c+135"
		"ypos"					"164"
		"wide"					"15"
		"tall"					"15"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"icon_modwrench"
		"drawcolor"				"150 150 150 255"
		"scaleImage"			"1"
	}

	"BtnVisitWorkshop"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnVisitWorkshop"
		"xpos"					"c+150"
		"ypos"					"164"
		"zpos"					"2"
		"wide"					"250"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_ADDON_VISIT_WORKSHOP"	//"VIEW ON WORKSHOP"
		"style"					"RedButton"		// actually teal!
		"command"				"VisitWorkshop"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"0"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"allcaps"				"1"
	}

	"IconBrowseWorkshop"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"IconBrowseWorkshop"
		"xpos"					"c-226"
		"ypos"					"420"
		"wide"					"15"
		"tall"					"15"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"icon_modwrench"
		"drawcolor"				"150 150 150 255"
		"scaleImage"			"1"
	}

	"BtnBrowseWorkshop"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBrowseWorkshop"
		"xpos"					"c-211"
		"ypos"					"420"
		"zpos"					"2"
		"wide"					"250"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_ADDON_BROWSE_WORKSHOP"
		"style"					"MainMenuSmallButton"		// actually teal!
		"command"				"BrowseWorkshop"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"0"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"allcaps"				"1"
	}
	
	"ImgGlobalAddonIconSpinner"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"ImgGlobalAddonIconSpinner"
		"xpos"				"24" [$WIN32 && !$WIN32WIDE]
		"xpos"				"48" [$WIN32 && $WIN32WIDE]
		"ypos"				"26"
		"zpos"				"10"
		"wide"				"32"
		"tall"				"32"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleImage"		"1"
		"image"					"common/l4d_spinner"
	}	
}
