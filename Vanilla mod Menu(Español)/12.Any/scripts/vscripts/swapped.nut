//-----------------------------------------------------
Msg("Activating Survivor Swap\n");
Msg("Made by Rayman1103\n");


if( Entities.FindByName( null, "c1m1_c1m2_changelevel" ) )
{
	local sceneTable =
	{
		busyactor = 1,
		onplayerdeath = "0",
		SceneFile = "scenes/c1m1_intro_survivors_01.vcd",
		targetname = "update_lcs_intro",
		connections =
		{
			OnTrigger1 =
			{
				cmd1 = "directorFireConceptToAnyIntroC1M10-1"
			}
		}
		origin = Vector(669.351, 5729.67, 2933.31),
		angles = Vector(0, 0, 0) 
	}
	local relayTable =
	{
		spawnflags = 0,
		StartDisabled = "0",
		targetname = "relay_intro_start",
		connections =
		{
			OnTrigger =
			{
				cmd1 = "update_lcs_introStart2-1"
			}
		}
		origin = Vector(669.28, 5729.87, 2903.31),
		angles = Vector(0, 0, 0) 
	}

	SpawnEntityFromTable("logic_choreographed_scene", sceneTable);
	SpawnEntityFromTable("logic_relay", relayTable);
}

if( Entities.FindByName( null, "l4d1_survivors_relay" ) )
{
	local relayTable =
	{
		spawnflags = 0,
		StartDisabled = "0",
		targetname = "relay_swappedcoop_setup",
		connections =
		{
			OnTrigger =
			{
				cmd1 = "elevator_nav_blockerBlockNav0-1"
				cmd2 = "l4d1_script_relayEnable0-1"
				cmd3 = "relay_quiet_scriptEnable0-1"
				cmd4 = "l4d1_survivors_relayEnable0-1"
				cmd5 = "gas_nozzleStopGlowing0-1"
				cmd6 = "gascansTurnGlowsOff0-1"
			}
		}
		origin = Vector(-368, -288, 296),
		angles = Vector(0, 0, 0) 
	}

	SpawnEntityFromTable("logic_relay", relayTable);
}

if( Entities.FindByName( null, "branch_zoey" ) )
{
	EntFire( "info_l4d1_survivor_spawn", "Kill", "", 0 );
	EntFire( "trigger_multiple", "Kill", "", 0 );
	EntFire( "francis_start", "Kill", "", 0 );
	EntFire( "zoey_start", "Kill", "", 0 );
	EntFire( "branch_zoey", "Kill", "", 0 );
	EntFire( "scavenge_shortcut", "Kill", "", 0 );
}

function SpawnBillCrates()
{
	local cratetbl1 =
	{
		classname = "prop_dynamic",
		fademindist = "-1",
		fadescale = "1",
		glowbackfacemult = "1.0",
		glowcolor = "0 0 0",
		MaxAnimTime = "10",
		MinAnimTime = "5",
		model = "models/props_crates/static_crate_40.mdl",
		renderamt = "255",
		rendercolor = "255 255 255",
		skin = "0",
		solid = "6",
		origin = Vector(-369, -991, 0),
		angles = Vector(0, 90, 0)
	}
	local cratetbl2 =
	{
		classname = "prop_dynamic_override",
		fademindist = "-1",
		fadescale = "1",
		glowbackfacemult = "1.0",
		glowcolor = "0 0 0",
		MaxAnimTime = "10",
		MinAnimTime = "5",
		model = "models/props_crates/supply_crate01.mdl",
		renderamt = "255",
		rendercolor = "255 255 255",
		skin = "0",
		solid = "6",
		origin = Vector(-364, -1016, 15),
		angles = Vector(0, 180, 90)
	}
	local cratetbl3 =
	{
		classname = "prop_dynamic_override",
		fademindist = "-1",
		fadescale = "1",
		glowbackfacemult = "1.0",
		glowcolor = "0 0 0",
		MaxAnimTime = "10",
		MinAnimTime = "5",
		model = "models/props_crates/supply_crate01.mdl",
		renderamt = "255",
		rendercolor = "255 255 255",
		skin = "0",
		solid = "6",
		origin = Vector(-385, -1016, 15),
		angles = Vector(0, 180, 90)
	}
	local cratetbl4 =
	{
		classname = "prop_dynamic_override",
		fademindist = "-1",
		fadescale = "1",
		glowbackfacemult = "1.0",
		glowcolor = "0 0 0",
		MaxAnimTime = "10",
		MinAnimTime = "5",
		model = "models/props_crates/supply_crate01.mdl",
		renderamt = "255",
		rendercolor = "255 255 255",
		skin = "0",
		solid = "6",
		origin = Vector(-369, -1033, 17),
		angles = Vector(0, 270, 0)
	}

	CreateSingleSimpleEntityFromTable(cratetbl1);
	CreateSingleSimpleEntityFromTable(cratetbl2);
	CreateSingleSimpleEntityFromTable(cratetbl3);
	CreateSingleSimpleEntityFromTable(cratetbl4);
}

set_survivor_name <- false;
triggered_outputs <- false;
function Update()
{
	if( !set_survivor_name && SessionState.MapName == "c1m1_hotel" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "zoey" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "bill" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c2m1_highway" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "zoey" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "bill" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c3m1_plankcountry" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "zoey" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "bill" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c4m1_milltown_a" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "bill" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "zoey" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c5m1_waterfront" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "zoey" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "bill" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c6m1_riverbank" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "zoey" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "bill" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c7m1_docks" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "Nick" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "Rochelle" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "Coach" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "Ellis" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c8m1_apartment" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "Ellis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "Nick" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "Rochelle" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "Coach" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c8m5_rooftop" && Entities.FindByName( null, "helicopter_survivor_pos1" ) )
	{
		SurvivorHelicopter1 <- null;
		SurvivorHelicopter1 = Entities.FindByName( SurvivorHelicopter1, "helicopter_survivor_pos1" );
		SurvivorHelicopter2 <- null;
		SurvivorHelicopter2 = Entities.FindByName( SurvivorHelicopter2, "helicopter_survivor_pos2" );
		SurvivorHelicopter3 <- null;
		SurvivorHelicopter3 = Entities.FindByName( SurvivorHelicopter3, "helicopter_survivor_pos3" );
		SurvivorHelicopter4 <- null;
		SurvivorHelicopter4 = Entities.FindByName( SurvivorHelicopter4, "helicopter_survivor_pos4" );
		SurvivorHelicopter1.__KeyValueFromString( "SurvivorName", "Nick" );
		SurvivorHelicopter2.__KeyValueFromString( "SurvivorName", "Rochelle" );
		SurvivorHelicopter3.__KeyValueFromString( "SurvivorName", "Ellis" );
		SurvivorHelicopter4.__KeyValueFromString( "SurvivorName", "Coach" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c10m1_caves" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		//SurvivorIntro1.__KeyValueFromString( "SurvivorName", "Ellis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "Coach" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "Rochelle" );
		//SurvivorIntro4.__KeyValueFromString( "SurvivorName", "Nick" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c11m1_greenhouse" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "Ellis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "Rochelle" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "Nick" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "Coach" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "C12m1_hilltop" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "Ellis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "Rochelle" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "Nick" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "Coach" );
		set_survivor_name = true;
	}
	else if( !set_survivor_name && SessionState.MapName == "c13m1_alpinecreek" && Entities.FindByName( null, "survivorPos_intro_01" ) )
	{
		SurvivorIntro1 <- null;
		SurvivorIntro1 = Entities.FindByName( SurvivorIntro1, "survivorPos_intro_01" );
		SurvivorIntro2 <- null;
		SurvivorIntro2 = Entities.FindByName( SurvivorIntro2, "survivorPos_intro_02" );
		SurvivorIntro3 <- null;
		SurvivorIntro3 = Entities.FindByName( SurvivorIntro3, "survivorPos_intro_03" );
		SurvivorIntro4 <- null;
		SurvivorIntro4 = Entities.FindByName( SurvivorIntro4, "survivorPos_intro_04" );
		SurvivorIntro1.__KeyValueFromString( "SurvivorName", "francis" );
		SurvivorIntro2.__KeyValueFromString( "SurvivorName", "zoey" );
		SurvivorIntro3.__KeyValueFromString( "SurvivorName", "louis" );
		SurvivorIntro4.__KeyValueFromString( "SurvivorName", "bill" );
		set_survivor_name = true;
	}
	if( !triggered_outputs && SessionState.MapName == "c1m1_hotel" )
	{
		EntFire( "lcs_intro", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c1m4_atrium" )
	{
		EntFire( "relay_spawncans", "Trigger", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "navblock_coop", "BlockNav", "", 1 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c2m1_highway" )
	{
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c2m2_fairgrounds" )
	{
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "coop_nav_blocker", "BlockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c2m3_coaster" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c2m4_barns" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c2m5_concert" )
	{
		EntFire( "item_spawn_sets_case", "PickRandom", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "stadium_exit_left_physicsblocker", "Disable", "", 1 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c3m1_plankcountry" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c3m3_shantytown" )
	{
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c3m4_plantation" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "mansion_resources_case", "PickRandom", "", 1 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c4m1_milltown_a" )
	{
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c4m2_sugarmill_a" )
	{
		EntFire( "survival_block_nav", "UnblockNav", "", 0 );
		EntFire( "nav_blocker_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c4m3_sugarmill_b" )
	{
		EntFire( "survival_block_nav", "UnblockNav", "", 0 );
		EntFire( "nav_blocker_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c4m4_milltown_b" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c4m5_milltown_escape" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c5m1_waterfront" )
	{
		EntFire( "director_panic_relay", "Enable", "", 0 );
		EntFire( "survival_navblocker", "UnblockNav", "", 0 );
		EntFire( "coop_navblocker", "BlockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c5m2_park" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "navblock_coop", "BlockNav", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c5m3_cemetery" )
	{
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c5m4_quarter" )
	{
		EntFire( "survivor_nav_blocker1", "UnblockNav", "", 0 );
		EntFire( "coop_navblocker", "BlockNav", "", 0 );
		EntFire( "landing_blocker", "Enable" );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c5m5_bridge" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c6m1_riverbank" )
	{
		EntFire( "ldq_caralarm", "HowAngry", "", 1 );
		EntFire( "bridewitch", "SpawnZombie", "", 0.1 );
		EntFire( "navblock_coop", "BlockNav", "", 0 );
		EntFire( "ldq_tier1_weapons", "HowAngry", "", 0 );
		EntFire( "case_spawn_chests", "PickRandomShuffle", "", 0 );
		EntFire( "case_spawn_chests", "PickRandomShuffle", "", 0.1 );
		EntFire( "ldq_tier2_weapons", "HowAngry", "", 0 );
		EntFire( "ldq_any_a_weapons", "HowAngry", "", 0 );
		EntFire( "door_bar", "Lock", "", 0 );
		EntFire( "scavenge_shortcut_block", "BlockNav", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "navblock_coop", "BlockNav", "", 0 );
		EntFire( "prop_coop", "Enable", "", 0 );
		EntFire( "door_bar", "Lock", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c6m2_bedlam" )
	{
		EntFire( "trigger_bus", "Enable", "", 0 );
		EntFire( "case_chest", "PickRandomShuffle", "", 0 );
		EntFire( "case_chest", "PickRandomShuffle", "", 0.5 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c6m3_port" )
	{
		EntFire( "info_l4d1_survivor_spawn", "Kill", "", 0 );
		EntFire( "l4d1_survivors_relay", "Kill", "", 0 );
		EntFire( "l4d1_teleport_relay", "Kill", "", 0 );
		EntFire( "l4d1_script_relay", "Kill", "", 0 );
		EntFire( "francis_outro", "Kill", "", 0 );
		EntFire( "louis_outro", "Kill", "", 0 );
		EntFire( "zoey_outro", "Kill", "", 0 );
		EntFire( "relay_swappedcoop_setup", "Trigger", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
		local BillRifle = null;
		while( ( BillRifle = Entities.FindByClassnameWithin( BillRifle, "weapon_rifle_spawn", Vector(-364, -1007, 11.3106), 10 ) ) != null )
		{
			DoEntFire( "!self", "Kill", "", 0, null, BillRifle );
		}
		SpawnBillCrates();
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c7m1_docks" )
	{
		EntFire( "items_coop_delete", "Kill", "", 0 );
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "traincar_navblocker", "Kill", "", 0 );
		EntFire( "boat03_sbcollision", "Kill", "", 0 );
		EntFire( "boat01_sbcollision", "Kill", "", 0 );
		EntFire( "versus_tank", "Disable", "", 0 );
		EntFire( "barrel_picker1", "PickRandom", "", 0 );
		EntFire( "boat01_sbblocker", "UnblockNav", "", 0 );
		EntFire( "boat03_sbblocker", "UnblockNav", "", 0 );
		EntFire( "boat01_sbblocker_top", "BlockNav", "", 0 );
		EntFire( "boat03_sbblocker_top", "BlockNav", "", 0 );
		EntFire( "tankdooroutnavblocker", "BlockNav", "", 0 );
		EntFire( "tankdoorinnavblocker", "BlockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c7m2_barge" )
	{
		EntFire( "car_alarm_spawner", "PickRandom", "", 0 );
		EntFire( "barrel_picker1", "PickRandom", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "scavenge_ladder_nav", "BlockNav", "", 0 );
		EntFire( "boat_blocker", "Enable", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c7m3_port" )
	{
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "survival_button_model", "Kill", "", 0 );
		EntFire( "survival_button", "Kill", "", 0 );
		EntFire( "survival_message", "Kill", "", 0 );
		EntFire( "tank_spawner_versus_relay", "Kill", "", 0 );
		EntFire( "door_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
		EntFire( "InstanceAuto1-director_panic_relay", "Enable", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c8m1_apartment" )
	{
		EntFire( "scavenge_blocker", "UnblockNav", "", 0 );
		EntFire( "template_clock1", "ForceSpawn" );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c8m2_subway" )
	{
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "door_blocker", "Enable" );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c8m3_sewers" )
	{
		EntFire( "warehouse_door", "SetDamageFilter", "warehouse_door_filter" );
		EntFire( "office_basement_gate", "Open" );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c8m4_interior" )
	{
		EntFire( "fx_rain_trickle_01", "Stop", "", 0 );
		EntFire( "fx_rain_trickle_02", "Stop", "", 0 );
		EntFire( "fx_rain_trickle_03", "Stop", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c8m5_rooftop" )
	{
		EntFire( "survival_kill", "Trigger", "", 0 );
		EntFire( "pilot_radio_getin_case", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c9m1_alleys" )
	{
		EntFire( "holdout_items", "Kill", "", 0 );
		EntFire( "coop_nav", "UnblockNav", "", 0 );
		EntFire( "holdout_nav", "BlockNav", "", 0 );
		EntFire( "versus_doorblockers", "Kill", "", 0 );
		EntFire( "survivorPos_survival_01", "Kill", "", 0 );
		EntFire( "survivorPos_survival_02", "Kill", "", 0 );
		EntFire( "survivorPos_survival_03", "Kill", "", 0 );
		EntFire( "survivorPos_survival_04", "Kill", "", 0 );
		EntFire( "scavenge_wall", "Kill", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		EntFire( "props_scavenge", "Kill", "", 1 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c9m2_lots" )
	{
		EntFire( "versus_doorblockers", "Kill", "", 0 );
		EntFire( "survival_start", "Kill", "", 0 );
		EntFire( "survival_start_relay", "Kill", "", 0 );
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "door_breakable01", "Break", "", 0 );
		EntFire( "door_breakable03", "Break", "", 0 );
		EntFire( "door_breakable05", "Break", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c10m1_caves" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		EntFire( "coop_trigger", "Trigger", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c10m2_drainage" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c10m3_ranchhouse" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c11m1_greenhouse" )
	{
		EntFire( "coop_trigger", "Enable", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c11m3_garage" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c11m4_terminal" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		EntFire( "breakwall04_illusionary", "Kill", "", 0 );
		EntFire( "breakwall04_inside", "Kill", "", 0 );
		EntFire( "breakwall04_outside", "Kill", "", 0 );
		EntFire( "breakwall04_filler", "Kill", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c11m5_runway" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "C12m1_hilltop" )
	{
		EntFire( "coop_trigger", "Enable", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c12m5_cornfield" )
	{
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c13m1_alpinecreek" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "scene_relay", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c13m2_southpinestream" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "tank_versus", "Kill", "", 0 );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c13m3_memorialbridge" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "point_hurt", "TurnOn" );
		triggered_outputs = true;
	}
	else if( !triggered_outputs && SessionState.MapName == "c13m4_cutthroatcreek" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "tank_versus", "Kill", "", 0 );
		triggered_outputs = true;
	}
}
