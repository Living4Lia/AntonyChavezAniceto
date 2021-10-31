//-----------------------------------------------------
Msg("Activating Tankball Versus\n");
Msg("Made by Rayman1103, and ANG3Lskye\n");


MutationOptions <-
{
	ActiveChallenge = 1

	cm_CommonLimit = 0
	cm_MaxSpecials = 4
	cm_DominatorLimit = 4
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 8
	cm_TankLimit = 8
	cm_AggressiveSpecials = 1
	cm_AllowSurvivorRescue = 0
	cm_TankRun = 1
	cm_ShouldHurry = 1
	ProhibitBosses = false
	TankRunSpawnDelay = 10

	// Always convert to the TANK!!!
	function ConvertZombieClass( iClass )
	{
		return 8;
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
		weapon_chainsaw = 0
		weapon_defibrillator = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_first_aid_kit = 0
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		weapon_melee = 0
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

	DefaultItems =
	[
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

function AllowTakeDamage( damageTable )
{
	try
	{
		if( damageTable.Attacker.IsSurvivor() && damageTable.Victim.GetZombieType() == 8 )
		{
			return false;
		}
	}
	catch( error )
	{
		
	}
	return true
}

removed_common_spawns <- false;
set_health <- false;
timer_running <- false;
timer_starttime <- 0;
function Update()
{
	if( !set_health && Entities.FindByName( null, "!nick" ) )
	{
		EntFire( "!nick", "sethealth", "100" );
		EntFire( "!rochelle", "sethealth", "100" );
		EntFire( "!coach", "sethealth", "100" );
		EntFire( "!ellis", "sethealth", "100" );
		set_health = true;
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
	if( timer_starttime == 0 && Director.HasAnySurvivorLeftSafeArea() )
	{
		timer_starttime = Time();
		timer_running = true;
	}
	if( Time() >= timer_starttime + 240 && timer_running )
	{
		EntFire( "relay_car_ready", "trigger" );
		EntFire( "escape_right_relay", "enable" );
		EntFire( "stadium_exit_right_relay", "enable" );
		EntFire( "stadium_exit_right_relay", "trigger" );
		EntFire( "relay_start_boat", "enable" );
		EntFire( "relay_start_boat", "trigger" );
		EntFire( "escape_begin_relay", "enable" );
		EntFire( "escape_begin_relay", "trigger" );
		EntFire( "relay_escape", "enable" );
		EntFire( "relay_escape", "trigger" );
		EntFire( "helicopter_land_relay", "enable" );
		EntFire( "helicopter_land_relay", "trigger" );
		NavMesh.UnblockRescueVehicleNav()
		timer_running = false;
	}
}
