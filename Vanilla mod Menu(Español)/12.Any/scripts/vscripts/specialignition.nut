//-----------------------------------------------------
Msg("Activating Special Ignition\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	ActiveChallenge = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_SpecialRespawnInterval = 3
	BoomerLimit = 1
	SmokerLimit = 2
	HunterLimit = 3
	ChargerLimit = 3
	SpitterLimit = 2
	JockeyLimit = 3
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	ShouldAllowSpecialsWithTank = true
	cm_AggressiveSpecials = 1
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	cm_AutoReviveFromSpecialIncap = 1

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
		weapon_defibrillator = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_molotov = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
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
		"weapon_molotov",
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

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::removed_common_spawns <- false;
::removed_weapon_spawns <- false;
::set_health <- false;
::started_health_regen <- false;
function EasyLogic::Update::Think()
{
	Survivors <- 
	[
		"!nick"
		"!ellis" 
		"!rochelle" 
		"!coach"
	]

	Survivor <- null;
	if( !set_health && Entities.FindByName( null, "!nick" ) )
	{
		foreach(s in Survivors)
		{
			while( Survivor = Entities.FindByName( Survivor, s ) )
			{
				Survivor.SetHealthBuffer( 0 );
			}
		}
		EntFire( "!nick", "sethealth", 100 );
		EntFire( "!rochelle", "sethealth", 100 );
		EntFire( "!coach", "sethealth", 100 );
		EntFire( "!ellis", "sethealth", 100 );
		set_health = true;
	}
	if( !removed_weapon_spawns )
    {
		EntFire( "weapon_spawn", "kill" );
		removed_weapon_spawns = true;
    }
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
	if ( !started_health_regen )
	{
		Timers.AddTimerByName("HealthRegenTimer", 2.0, true, HealthRegen);
		started_health_regen = true;
	}
}
