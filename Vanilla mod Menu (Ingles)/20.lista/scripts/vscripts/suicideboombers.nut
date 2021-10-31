//-----------------------------------------------------
Msg("Activating Suicide Boombers\n");
Msg("Made by Rayman1103\n");


MutationOptions <-
{
	ActiveChallenge = 1

	cm_CommonLimit = 0
	cm_DominatorLimit = 10
	cm_MaxSpecials = 10
	cm_AggressiveSpecials = 1
	SpecialRespawnInterval = 20
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	ShouldAllowSpecialsWithTank = true
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	BoomerLimit = 10
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_molotov = "weapon_pain_pills_spawn"
		weapon_adrenaline = "weapon_pain_pills_spawn"
		weapon_upgradepack_explosive = "weapon_adrenaline_spawn"
		weapon_upgradepack_incendiary = "weapon_pain_pills_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}

	weaponsToRemove =
	{
		weapon_pistol = 0
		weapon_smg = 0
		weapon_autoshotgun = 0
		weapon_rifle = 0
		weapon_hunting_rifle = 0
		weapon_smg_silenced = 0
		weapon_rifle_desert = 0
		weapon_sniper_military = 0
		weapon_shotgun_spas = 0
		weapon_rifle_ak47 = 0
		weapon_smg_mp5 = 0		
		weapon_rifle_sg552 = 0		
		weapon_sniper_awp = 0	
		weapon_sniper_scout = 0
		weapon_chainsaw = 0
		weapon_rifle_m60 = 0
		weapon_pistol_magnum = 0
		weapon_vomitjar = 0
		weapon_pipe_bomb = 0
		weapon_molotov = 0
		weapon_pumpshotgun = 0
		weapon_shotgun_chrome = 0
		weapon_grenade_launcher = 0
		weapon_propanetank = 0
		weapon_oxygentank = 0
		upgrade_item = 0
		ammo = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}

	function ShouldAvoidItem( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return true;
		}
		return false;
	}

	DefaultItems =
	[
		"baseball_bat",
		"weapon_pain_pills",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.27 // pain_pills_decay_rate default
		}
	}
}

ignited_barricade <- false;
removed_common_spawns <- false;
function Update()
{
	DirectorOptions.RecalculateHealthDecay();
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
	if( !ignited_barricade && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "barricade_gas_can", "ignite" );
		ignited_barricade = true;
	}
}
