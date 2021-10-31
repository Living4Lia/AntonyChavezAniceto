//-----------------------------------------------------
Msg("Activating Mutation 17\n");


MutationOptions <-
{
	ActiveChallenge = 1

	cm_AutoReviveFromSpecialIncap = 1
	cm_NoSurvivorBots = 1
	cm_MaxSpecials = 4
	cm_SpecialRespawnInterval = 30
	cm_AllowPillConversion = 0
	cm_CommonLimit = 0
	cm_WanderingZombieDensityModifier = 0.015

	BoomerLimit = 0
	MobMaxPending = 0
	SurvivorMaxIncapacitatedCount = 1
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 30
	TankHitDamageModifierCoop = 0.5
	
	weaponsToRemove =
	{
		weapon_pistol = 0
		weapon_smg = 0
		weapon_pumpshotgun = 0
		weapon_autoshotgun = 0
		weapon_rifle = 0
		weapon_hunting_rifle = 0
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
		weapon_ammo = 0
		weapon_gascan = 0				
		weapon_chainsaw = 0
		weapon_rifle_ak47 = 0
		weapon_vomit_jar = 0
		weapon_defibrillator = 0
		weapon_pipe_bomb = 0
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
		"weapon_pistol_magnum",
		"weapon_grenade_launcher"
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
