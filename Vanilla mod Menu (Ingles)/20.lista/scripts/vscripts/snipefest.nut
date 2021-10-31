//-----------------------------------------------------
Msg("Activating Snipe Fest)\n");
Msg("Made by Karma Jockey\n");

MutationOptions <-
{
	ActiveChallenge = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 12
	cm_MaxSpecials = 12
	cm_SpecialRespawnInterval = 15
	cm_AutoReviveFromSpecialIncap = 1
	cm_AllowPillConversion = 1
	MobMaxPending = 0
	SurvivorMaxIncapacitatedCount = 2
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 3
	ProhibitBosses = 1

	BoomerLimit = 0
	SmokerLimit = 6
	HunterLimit = 6
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	
	weaponsToConvert =
	{
		weapon_pistol = "weapon_hunting_rifle_spawn"
		weapon_smg = "weapon_sniper_military_spawn"
		weapon_smg_silenced = "weapon_hunting_rifle_spawn"
		weapon_pumpshotgun = "weapon_hunting_rifle_spawn"
		weapon_shotgun_chrome = "weapon_sniper_military_spawn" 
		weapon_pistol_magnum = "weapon_hunting_rifle_spawn"
		weapon_autoshotgun = "weapon_sniper_military_spawn"
		weapon_rifle = "weapon_sniper_military_spawn"
		weapon_rifle_desert = "weapon_sniper_military_spawn"
		weapon_shotgun_spas = "weapon_hunting_rifle_spawn"
		weapon_grenade_launcher = "weapon_hunting_rifle_spawn"
		weapon_rifle_ak47 = "weapon_hunting_rifle_spawn"
		weapon_smg_mp5 = "weapon_sniper_military_spawn"
		weapon_rifle_sg552 = "weapon_sniper_military_spawn"
		weapon_sniper_awp = "weapon_hunting_rifle_spawn"
		weapon_sniper_scout = "weapon_hunting_rifle_spawn"
		weapon_rifle_m60 = "weapon_sniper_military_spawn"
		weapon_pipe_bomb = 	"weapon_molotov_spawn"

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
		weapon_pistol_magnum = 0
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
		weapon_melee = 0
		weapon_chainsaw = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
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
		"weapon_hunting_rifle",
		"weapon_first_aid_kit",
		"weapon_pipe_bomb",
		"machete"
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
