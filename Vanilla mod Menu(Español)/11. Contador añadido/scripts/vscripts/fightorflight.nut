//-----------------------------------------------------
Msg("Activating Fight Or Flight\n");


MutationOptions <-
{
	ActiveChallenge = 1
	cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 13
	cm_MaxSpecials = 13
	cm_SpecialRespawnInterval = 0
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	ShouldAllowSpecialsWithTank = true
	ProhibitBosses = false

	SmokerLimit = 2
	BoomerLimit = 2
	HunterLimit = 4
	SpitterLimit = 1
	JockeyLimit = 2
	ChargerLimit = 2

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb = 	"weapon_molotov_spawn"
		weapon_grenade_launcher = 	"weapon_upgradepack_incendiary_spawn"
		ammo = 	"weapon_upgradepack_incendiary_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
	RandomPrimary =
	[
		"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	RandomSecondary =
	[
		"weapon_pistol_magnum",
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		return 0;
	}
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.001 // pain_pills_decay_rate default 0.27
		}
	}
}

gave_laser_sight <- false;
removed_common_spawns <- false;
function Update()
{
	DirectorOptions.RecalculateHealthDecay();
	
	Survivors <- 
	[
		"!nick"
		"!ellis" 
		"!rochelle" 
		"!coach"
	]
	
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
	if( !gave_laser_sight )
	{
		foreach(s in Survivors)
		{
			while( Survivor = Entities.FindByName( Survivor, s ) )
			{
				Survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
			}
		}
		gave_laser_sight = true;
	}
}
