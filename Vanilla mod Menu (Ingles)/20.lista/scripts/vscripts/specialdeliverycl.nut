//-----------------------------------------------------
Msg("Activating Classic Special Delivery\n");
Msg("Made by Rayman1103\n");

Skyboxes <- [
   "0"
]

worldspawn <- Entities.FindByClassname ( null, "worldspawn" );
local i = RandomInt( 0, Skyboxes.len()-1 );
printl("Skybox is "+Skyboxes[i]);
printl( worldspawn.__KeyValueFromString( "timeofday", Skyboxes[i] ) );


MutationOptions <-
{
	ActiveChallenge = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 8
	cm_MaxSpecials = 8
	cm_ProhibitBosses = false
	cm_SpecialRespawnInterval = 0
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	ShouldAllowSpecialsWithTank = true
	EscapeSpawnTanks = true
	
	SmokerLimit = 3
	BoomerLimit = 2
	HunterLimit = 3
	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0
	
	/*
	weaponsToRemove =
	{
		weapon_pistol_magnum = 0
		weapon_smg_silenced = 0
		weapon_shotgun_chrome = 0
		weapon_rifle_desert = 0
		weapon_sniper_military = 0
		weapon_shotgun_spas = 0
		weapon_grenade_launcher = 0
		weapon_rifle_ak47 = 0
		weapon_smg_mp5 = 0		
		weapon_rifle_sg552 = 0		
		weapon_sniper_awp = 0	
		weapon_sniper_scout = 0
		weapon_rifle_m60 = 0
		weapon_chainsaw = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		weapon_melee = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}
	*/
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pistol_magnum = "weapon_pistol_spawn"
		weapon_melee = "weapon_pistol_spawn"
		weapon_smg_silenced = "weapon_smg_spawn"
		weapon_shotgun_chrome = "weapon_pumpshotgun_spawn"
		weapon_sniper_military = "weapon_hunting_rifle_spawn"
		weapon_shotgun_spas = "weapon_autoshotgun_spawn"
		weapon_rifle_desert = "weapon_rifle_spawn"
		weapon_rifle_ak47 = "weapon_rifle_spawn"
		weapon_grenade_launcher = "weapon_autoshotgun_spawn"
		weapon_rifle_m60 = "weapon_rifle_spawn"
		weapon_smg_mp5 = "weapon_smg_spawn"
		weapon_rifle_sg552 = "weapon_rifle_spawn"
		weapon_sniper_awp =	"weapon_hunting_rifle_spawn"
		weapon_sniper_scout = "weapon_hunting_rifle_spawn"
		weapon_adrenaline =	"weapon_pain_pills_spawn"
		weapon_vomitjar = "weapon_molotov_spawn"
		weapon_pipe_bomb = "weapon_molotov_spawn"
		weapon_defibrillator = "weapon_first_aid_kit_spawn"
		weapon_upgradepack_incendiary = "weapon_first_aid_kit_spawn"
		weapon_upgradepack_explosive = "weapon_first_aid_kit_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
	DefaultItems =
	[
		"weapon_pistol",
		"weapon_pistol",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}
}

disabled_car_alarms <- false;
disabled_c1m1_tanks <- false;
disabled_c7m1_bosses <- false;
gave_l4d1_survivors_pistols <- false;
released_l4d1_survivors <- false;
removed_common_spawns <- false;
removed_impound_instructor <- false;
function Update()
{
	if( !removed_common_spawns )
    {
		EntFire( "intro_zombie_spawn", "kill" );
		EntFire( "zspawn_lobby_fall_1", "kill" );
		EntFire( "zspawn_lobby_fall_2", "kill" );
		EntFire( "zspawn_lobby_fall_3", "kill" );
		EntFire( "zspawn_lobby_fall_4", "kill" );
		EntFire( "zspawn_lobby_fall_5", "kill" );
		EntFire( "zspawn_fall_1", "kill" );
		EntFire( "zspawn_fall_2", "kill" );
		EntFire( "zombie_outro", "kill" );
		EntFire( "escape_zombie", "kill" );
		EntFire( "zspawn_zombie_safe", "kill" );
		EntFire( "zspawn_zombie_safe2", "kill" );
		EntFire( "spawn_zombie_van", "kill" );
		EntFire( "spawn_zombie_alarm", "kill" );
		EntFire( "spawn_zombie_alarm2", "kill" );
		EntFire( "zombie_spawn1", "kill" );
		EntFire( "spawn_zombie_run", "kill" );
		EntFire( "spawn_zombie_end", "kill" );
		EntFire( "infected_spawner", "kill" );
		EntFire( "infected_spawner2", "kill" );
		EntFire( "spawn_zombie_location1", "kill" );
		EntFire( "spawn_zombie_location2", "kill" );
		EntFire( "spawn_zombie_location3", "kill" );
		EntFire( "spawn_zombie_location4", "kill" );
		EntFire( "spawn_zombie_location5", "kill" );
		EntFire( "spawn_zombie_location6", "kill" );
		removed_common_spawns = true;
    }
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		z <- null;
		while( ( z = Entities.FindByClassname( z, "infected" ) ) != null )
		{
			DoEntFire( "!self", "kill", "", 0, null, z );
		}
	}
	if( !disabled_c1m1_tanks && Entities.FindByName( null, "c1m1_c1m2_changelevel" ) )
    {
		DirectorOptions.TankLimit <- 0;
		disabled_c1m1_tanks = true;
    }
	if( !disabled_c7m1_bosses && Entities.FindByName( null, "spawn_train_tank_coop" ) )
    {
		DirectorOptions.cm_ProhibitBosses <- true;
		disabled_c7m1_bosses = true;
    }
	if( !released_l4d1_survivors && Entities.FindByName( null, "l4d1_survivors_relay" ) && Director.HasAnySurvivorLeftSafeArea() )
    {
		EntFire( "l4d1_spawn_trigger", "kill" );
		EntFire( "l4d1_survivors_relay", "trigger" );
		EntFire( "!francis", "releasefromsurvivorposition", "", 1 );
		EntFire( "!louis", "releasefromsurvivorposition", "", 1 );
		EntFire( "!zoey", "releasefromsurvivorposition", "", 1 );
		released_l4d1_survivors = true;
    }
	if( !gave_l4d1_survivors_pistols && released_l4d1_survivors == true && Entities.FindByName( null, "!francis" ) )
	{
		L4D1Survivors <- 
		[
			"!bill"
			"!francis" 
			"!zoey" 
			"!louis"
		]

		L4D1Survivor <- null;
		Pistol <- null;
		Pistol = Entities.FindByClassname( Pistol, "weapon_pistol_spawn" );

		foreach(s in L4D1Survivors)
		{
			while( L4D1Survivor = Entities.FindByName( L4D1Survivor, s ) )
			{
				DoEntFire( "!self", "use", "", 0,  L4D1Survivor, Pistol );
			}
		}
		gave_l4d1_survivors_pistols = true;
	}
	if( !disabled_car_alarms && Director.HasAnySurvivorLeftSafeArea() )
    {
		ent <- null;
		while( ( ent = Entities.FindByModel( ent, "models/props_vehicles/cara_95sedan_glass_alarm.mdl" ) ) != null )
		{
			DoEntFire( "!self", "kill", "", 0, null, ent );
		}
		ent <- null;
		while( ( ent = Entities.FindByModel( ent, "models/props_vehicles/cara_95sedan_glass.mdl" ) ) != null )
		{
			DoEntFire( "!self", "enable", "", 0, null, ent );
		}
		EntFire( "prop_car_alarm", "disable" );
		EntFire( "instructor_impound", "kill" );
		EntFire( "InstanceAuto5-remark_caralarm", "kill" );
		EntFire( "alarm1-remark_caralarm", "kill" );
		EntFire( "alarm2-remark_caralarm", "kill" );
		EntFire( "alarm3-remark_caralarm", "kill" );
		EntFire( "alarm4-remark_caralarm", "kill" );
		EntFire( "alarm5-remark_caralarm", "kill" );
		EntFire( "alarm6-remark_caralarm", "kill" );
		EntFire( "alarm7-remark_caralarm", "kill" );
		EntFire( "alarm8-remark_caralarm", "kill" );
		EntFire( "remark_caralarm-car1_alarm", "kill" );
		EntFire( "remark_caralarm-car2_alarm", "kill" );
		EntFire( "remark_caralarm-car3_alarm", "kill" );
		EntFire( "car_alarm-remark_caralarm", "kill" );
		EntFire( "remark_caralarm", "kill" );
		EntFire( "InstanceAuto1-remark_caralarm", "kill" );
		EntFire( "InstanceAuto2-remark_caralarm", "kill" );
		EntFire( "car_alarm1-remark_caralarm", "kill" );
		EntFire( "InstanceAuto12-remark_caralarm", "kill" );
		EntFire( "remark_caralarm-car1", "kill" );
		EntFire( "remark_caralarm-car2", "kill" );
		EntFire( "remark_caralarm-car3", "kill" );
		EntFire( "remark_caralarm-car4", "kill" );
		EntFire( "remark_caralarm-car5", "kill" );
		EntFire( "caralarm_1-remark_caralarm", "kill" );
		EntFire( "caralarm_2-remark_caralarm", "kill" );
		EntFire( "caralarm_3-remark_caralarm", "kill" );
		EntFire( "caralarm_4-remark_caralarm", "kill" );
		EntFire( "caralarm_6-remark_caralarm", "kill" );
		EntFire( "caralarm_7-remark_caralarm", "kill" );
		EntFire( "caralarm_8-remark_caralarm", "kill" );
		EntFire( "InstanceAuto24-remark_caralarm", "kill" );
		EntFire( "InstanceAuto44-remark_caralarm", "kill" );
		EntFire( "car1-remark_caralarm", "kill" );
		EntFire( "car2-remark_caralarm", "kill" );
		EntFire( "car3-remark_caralarm", "kill" );
		EntFire( "car4-remark_caralarm", "kill" );
		EntFire( "car5-remark_caralarm", "kill" );
		EntFire( "InstanceAuto128-remark_caralarm", "kill" );
		EntFire( "InstanceAuto4-remark_caralarm", "kill" );
		EntFire( "InstanceAuto5-remark_caralarm", "kill" );
		EntFire( "alarma1-remark_caralarm", "kill" );
		EntFire( "alarma2-remark_caralarm", "kill" );
		EntFire( "alarma3-remark_caralarm", "kill" );
		EntFire( "alarma4-remark_caralarm", "kill" );
		EntFire( "alarma5-remark_caralarm", "kill" );
		EntFire( "alarma6-remark_caralarm", "kill" );
		EntFire( "alarma7-remark_caralarm", "kill" );
		EntFire( "alarma8-remark_caralarm", "kill" );
		EntFire( "alarma9-remark_caralarm", "kill" );
		disabled_car_alarms = true;
    }
	if( !removed_impound_instructor && Entities.FindByName( null, "instructor_impound" ) )
    {
		EntFire( "trigger_multiple", "kill" );
		removed_impound_instructor = true;
    }
}
