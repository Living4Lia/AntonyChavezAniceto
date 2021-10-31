Msg("Activating Mutation One Man Army \n");

MutationOptions <-
{
	ActiveChallenge = 1
	cm_NoSurvivorBots = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 6
	cm_MaxSpecials = 6
	cm_SpecialRespawnInterval = 25
	cm_AutoReviveFromSpecialIncap = 1
	cm_AllowPillConversion = 0
	MobMaxPending = 0
	SurvivorMaxIncapacitatedCount = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 3
	//TankHitDamageModifierCoop = 0.5
	JockeyLimit = 1
	ChargerLimit = 1
	BoomerLimit = 1
	SmokerLimit = 0
	HunterLimit = 1
	SpitterLimit = 1
	ProhibitBosses = 1

	weaponsToConvert =
	{
		weapon_pistol = "weapon_hunting_rifle_spawn"
		weapon_smg = "weapon_rifle_spawn"
		weapon_smg_silenced = "weapon_rifle_ak47_spawn"
		weapon_pumpshotgun = "weapon_autoshotgun_spawn"
		weapon_shotgun_chrome = "weapon_shotgun_spas_spawn"

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
		"weapon_smg",
		"weapon_smg_silenced",
		"weapon_pumpshotgun",
		"weapon_shotgun_chrome",
		"weapon_pistol_magnum",
		"weapon_rifle_desert",
		"weapon_rifle_ak47",
		"weapon_autoshotgun",
		"weapon_shotgun_spas",
		"weapon_hunting_rifle",
		"weapon_sniper_military",
		"weapon_rifle",
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

removed_common_spawns <- false;
function Update()
{
	if(!removed_common_spawns)
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
	if(Director.GetCommonInfectedCount() >= 1)
	{
		z <- null;
		while((z = Entities.FindByClassname(z,"infected")) != null)
		{
			DoEntFire("!self", "kill", "", 0, null, z);
		}
	}
}
