
"Resource/UI/DropDownNetGraph.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"190"
		"tall"					"190"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}
	"Background1"
	{
		"ControlName"		"EditablePanel"
		"fieldName"			"Background1"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"0"
		"wide"					"190"
		"tall"					"190"
		"visible"				"1"
		"enabled"				"1"
		"bgcolor_override"	"0 0 0 255"
		"PaintBackgroundType"	"1"
	}
	"LblMode"
	{
		"ControlName"		"Label"
		"fieldName"		"LblMode"
		"xpos"			"10"
		"ypos"			"2"//themlabelsypos
		"wide"			"55"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"mode"
		"fgcolor_override"		"139 139 139 255"//desc_color
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}			
	"Mode_slider_guide0"
	{
		"ControlName"		"Label"
		"fieldName"		"Mode_slider_guide0"
		"xpos"			"92"
		"ypos"			"13"//tguidesypos
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"0"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}				
	"Mode_slider_guide1"
	{
		"ControlName"		"Label"
		"fieldName"		"Mode_slider_guide1"
		"xpos"			"105"
		"ypos"			"13"//tguidesypos
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"1"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}			
	"Mode_slider_guide2"
	{
		"ControlName"		"Label"
		"fieldName"		"Mode_slider_guide2"
		"xpos"			"119"
		"ypos"			"13"//tguidesypos
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"2"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}			
	"Mode_slider_guide3"
	{
		"ControlName"		"Label"
		"fieldName"		"Mode_slider_guide3"
		"xpos"			"132"
		"ypos"			"13"//tguidesypos
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"3"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}				
	"Mode_slider_guide4"
	{
		"ControlName"		"Label"
		"fieldName"		"Mode_slider_guide4"
		"xpos"			"146"
		"ypos"			"13"//tguidesypos
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"4"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}				
	"SldMode"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldMode"
		"xpos"					"60"//sliderxpos
		"ypos"					"2"
		"zpos"					"5"
		"wide"					"90"//sliderwidth
		"tall"					"6"
		"visible"				"1"
		"enabled"				"1"
		"tabRate"			"0"
		"minValue"				"0"
		"maxValue"				"4"
		"stepSize"				"1"
		"conCommand"			"net_graph"
		"inverseFill"			"0"
		"navUp"				"SldShowInterp"
		"navDown"			"SldHeight"
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"visible"				"1"
			"enabled"				"1"
			"labeltext"				" "
			"style"					"smallbutton"
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	"LblHeight"
	{
		"ControlName"		"Label"
		"fieldName"		"LblHeight"
		"xpos"			"10"
		"ypos"			"22"//themlabelsypos
		"wide"			"55"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"height"
		"fgcolor_override"		"139 139 139 255"//desc_color
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}	
	"Height_slider_guide1"
	{
		"ControlName"		"Label"
		"fieldName"		"Height_slider_guide1"
		"xpos"			"92"
		"ypos"			"33"
		"wide"			"22"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabHeight"	"0"
		"labelText"				"Lo"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}		
	"Height_slider_Guide2"
	{
		"ControlName"		"Label"
		"fieldName"		"Height_slider_Guide2"
		"xpos"			"130"
		"ypos"			"33"
		"wide"			"22"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabHeight"	"0"
		"labelText"				"Hi"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}		
	"SldHeight"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldHeight"
		"xpos"					"60"//sliderxpos
		"ypos"					"22"
		"zpos"					"5"
		"wide"					"90"//sliderwidth
		"tall"					"6"
		"visible"				"1"
		"enabled"				"1"
		"tabRate"			"0"
		"minValue"				"0"
		"maxValue"				"2160"
		"stepSize"				"1"
		"conCommand"			"net_graphheight"
		"inverseFill"			"0"
		"navUp"				"SldMode"
		"navDown"			"SldPosition"
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"visible"				"1"
			"enabled"				"1"
			"labeltext"				" "
			"style"					"smallbutton"
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	"LblPosition"
	{
		"ControlName"		"Label"
		"fieldName"		"LblPosition"
		"xpos"			"10"
		"ypos"			"42"//themlabelsypos
		"wide"			"55"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"position"
		"fgcolor_override"		"139 139 139 255"//desc_color
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}	
	"Position_slider_guide1"
	{
		"ControlName"		"Label"
		"fieldName"		"Position_slider_guide1"
		"xpos"			"92"
		"ypos"			"53"
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"west"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"L"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}		
	"Position_slider_Guide2"
	{
		"ControlName"		"Label"
		"fieldName"		"Position_slider_Guide2"
		"xpos"			"144"
		"ypos"			"53"
		"wide"			"8"
		"tall"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabPosition"	"0"
		"labelText"				"R"
		"fgcolor_override"		"64 64 64 255"
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}	
	"SldPosition"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldPosition"
		"xpos"					"60"//sliderxpos
		"ypos"					"42"
		"zpos"					"5"
		"wide"					"90"//sliderwidth
		"tall"					"6"
		"visible"				"1"
		"enabled"				"1"
		"tabRate"			"0"
		"minValue"				"0"
		"maxValue"				"500"
		"stepSize"				"1"
		"conCommand"			"net_graphpos"
		"inverseFill"			"0"
		"navUp"				"SldHeight"
		"navDown"			"SldProportionalFont"
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"visible"				"1"
			"enabled"				"1"
			"labeltext"				" "
			"style"					"smallbutton"
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}	
	// "LblRate"
	// {
		// "ControlName"		"Label"
		// "fieldName"		"LblRate"
		// "xpos"			"10"
		// "ypos"			"62"//themlabelsypos
		// "wide"			"55"
		// "tall"			"12"
		// "autoResize"	"0"
		// "pinCorner"		"0"
		// "visible"		"1"
		// "enabled"		"1"
		// "textAlignment"			"east"
		// "Font"					"defaultverysmall"
		// "tabRate"	"0"
		// "labelText"				"rate"
		// "fgcolor_override"		"139 139 139 255"//desc_color
		// //"bgcolor_override"		"0 0 255 200"
		// "zpos"					"1"
	// }	
	// "SldRate"
	// {
		// "ControlName"			"SliderControl"
		// "fieldName"				"SldRate"
		// "xpos"					"60"//sliderxpos
		// "ypos"					"62"
		// "zpos"					"5"
		// "wide"					"90"//sliderwidth
		// "tall"					"6"
		// "visible"				"1"
		// "enabled"				"1"
		// "tabRate"			"0"
		// "minValue"				"50"
		// "maxValue"				"1000"
		// "stepSize"				"50"
		// "conCommand"			"net_graphmsecs"
		// "inverseFill"			"0"
		// "navUp"				"SldPosition"
		// "navDown"			"SldProportionalFont"
		// //button and label
		// "BtnDropButton"
		// {
			// "ControlName"			"L4D360HybridButton"
			// "fieldName"				"BtnDropButton"
			// "visible"				"1"
			// "enabled"				"1"
			// "labeltext"				" "
			// "style"					"smallbutton"
			// "ActivationType"		"1"
			// "OnlyActiveUser"		"1"
			// "usablePlayerIndex"		"nobody"
		// }
	// }	
	"LblProportionalFont"
	{
		"ControlName"		"Label"
		"fieldName"		"LblProportionalFont"
		"xpos"			"10"
		"ypos"			"82"//themlabelsypos
		"wide"			"55"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabRate"	"0"
		"labelText"				"prop. font"
		"fgcolor_override"		"139 139 139 255"//desc_color
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}	
	"ImgGuide_on-off1"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgGuide_on-off1"
		"xpos"					"94"
		"ypos"					"94"
		"wide"					"56"
		"tall"					"7"
		"visible"				"1"
		"enabled"				"1"
		"image"					"ingamemenu/slider_guide_on-off"
		"scaleimage"				"1"
		"zpos"					"2"
	}			
	"SldProportionalFont"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldProportionalFont"
		"xpos"					"60"//sliderxpos
		"ypos"					"82"
		"zpos"					"5"
		"wide"					"90"//sliderwidth
		"tall"					"6"
		"visible"				"1"
		"enabled"				"1"
		"tabRate"			"0"
		"minValue"				"0"
		"maxValue"				"2"
		"stepSize"				"2"
		"conCommand"			"net_graphproportionalfont"
		"inverseFill"			"0"
		"navUp"				"SldPosition"
		"navDown"			"SldShowInterp"
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"visible"				"1"
			"enabled"				"1"
			"labeltext"				" "
			"style"					"smallbutton"
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}	
	"LblShowInterp"
	{
		"ControlName"		"Label"
		"fieldName"		"LblShowInterp"
		"xpos"			"10"
		"ypos"			"102"//themlabelsypos
		"wide"			"55"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"			"east"
		"Font"					"defaultverysmall"
		"tabRate"	"0"
		"labelText"				"show interp."
		"fgcolor_override"		"139 139 139 255"//desc_color
		//"bgcolor_override"		"0 0 255 200"
		"zpos"					"1"
	}	
	"ImgGuide_on-off2"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgGuide_on-off2"
		"xpos"					"94"
		"ypos"					"114"
		"wide"					"56"
		"tall"					"7"
		"visible"				"1"
		"enabled"				"1"
		"image"					"ingamemenu/slider_guide_on-off"
		"scaleimage"				"1"
		"zpos"					"2"
	}		
	"SldShowInterp"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldShowInterp"
		"xpos"					"60"//sliderxpos
		"ypos"					"102"
		"zpos"					"5"
		"wide"					"90"//sliderwidth
		"tall"					"6"
		"visible"				"1"
		"enabled"				"1"
		"tabRate"			"0"
		"minValue"				"0"
		"maxValue"				"2"
		"stepSize"				"2"
		"conCommand"			"net_graphshowinterp"
		"inverseFill"			"0"
		"navUp"				"SldProportionalFont"
		"navDown"			"SldMode"
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"visible"				"1"
			"enabled"				"1"
			"labeltext"				" "
			"style"					"smallbutton"
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
}