//-----------------------------------------------------
Msg("Activating Tank Bake\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_ShouldHurry = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 8
	cm_TankLimit = 8

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb = 	"weapon_molotov_spawn"
		weapon_vomitjar = 	"weapon_molotov_spawn"
		weapon_defibrillator =	"weapon_first_aid_kit_spawn"
		weapon_pistol = "weapon_molotov_spawn"
		weapon_pistol_magnum = "weapon_molotov_spawn"
		weapon_smg = "weapon_molotov_spawn"
		weapon_pumpshotgun = "weapon_molotov_spawn"
		weapon_autoshotgun = "weapon_molotov_spawn"
		weapon_rifle = "weapon_molotov_spawn"
		weapon_hunting_rifle = "weapon_molotov_spawn"
		weapon_smg_silenced = "weapon_molotov_spawn"
		weapon_shotgun_chrome = "weapon_molotov_spawn"
		weapon_rifle_desert = "weapon_molotov_spawn"
		weapon_sniper_military = "weapon_molotov_spawn"
		weapon_shotgun_spas = "weapon_molotov_spawn"
		weapon_grenade_launcher = "weapon_molotov_spawn"
		weapon_rifle_ak47 = "weapon_molotov_spawn"
		weapon_smg_mp5 = "weapon_molotov_spawn"		
		weapon_rifle_sg552 = "weapon_molotov_spawn"	
		weapon_sniper_awp = "weapon_molotov_spawn"	
		weapon_sniper_scout = "weapon_molotov_spawn"
		weapon_rifle_m60 = "weapon_molotov_spawn"
		weapon_chainsaw = "weapon_molotov_spawn"
		weapon_upgradepack_incendiary = "weapon_molotov_spawn"
		weapon_upgradepack_explosive = "weapon_molotov_spawn"
		weapon_melee = "weapon_molotov_spawn"
		ammo = "weapon_molotov_spawn"
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
		weapon_rifle_m60 = 0
		weapon_pistol_magnum = 0
		weapon_pumpshotgun = 0
		weapon_shotgun_chrome = 0
		weapon_grenade_launcher = 0
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

	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.001 // pain_pills_decay_rate default 0.27
		}
	}
}

MutationState <-
{
	SpawnTank = false
	TriggerRescue = false
}

function GetNextStage()
{
	if ( SessionState.SpawnTank )
	{
		Msg("Spawning Tank!\n");
		SessionOptions.ScriptedStageType = STAGE_TANK
		SessionOptions.ScriptedStageValue = 1
		SessionState.SpawnTank = false;
	}
	else if ( !SessionState.SpawnTank )
	{
		SessionOptions.ScriptedStageType = STAGE_DELAY
		SessionOptions.ScriptedStageValue = -1
	}
	if ( SessionState.TriggerRescue )
	{
		Msg("Triggered STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE
		SessionState.TriggerRescue = false;
	}
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
	Timers.AddTimer( 20.0, true, SpawnTank );
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	if ( Entities.FindByClassname( null, "trigger_finale" ) )
	{
		foreach (trigger_finale in Objects.OfClassname("trigger_finale"))
		{
			trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
		}
	}
}

::FinaleStarted <- function ()
{
	Timers.AddTimer( 180.0, false, TriggerRescue );
}

::SpawnTank <- function ( args )
{
	SessionState.SpawnTank = true;
	Director.ForceNextStage();
}

::TriggerRescue <- function ( args )
{
	SessionState.TriggerRescue = true;
	Director.ForceNextStage();
	if ( Entities.FindByName( null, "relay_car_ready" ) )
		EntFire( "relay_car_ready", "Trigger" );
}

::churchguy_tank <- false;
::do_once <- false;
::removed_common_spawns <- false;
function EasyLogic::Update::Think()
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
	if( !do_once && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "finale_cleanse_entrance_door", "lock" );
		EntFire( "finale_cleanse_exit_door", "unlock" );
		EntFire( "ceda_trailer_canopen_frontdoor_listener", "kill" );
		EntFire( "finale_cleanse_backdoors_blocker", "kill" );
		EntFire( "radio_fake_button", "press" );
		EntFire( "drawbridge", "movetofloor", "bottom" );
		EntFire( "drawbridge_start_sound", "playsound" );
		EntFire( "startbldg_door_button", "press" );
		EntFire( "startbldg_door", "open" );
		EntFire( "elevator", "movetofloor", "bottom" );
		EntFire( "elevator_pulley", "start" );
		EntFire( "elevator_pulley2", "start" );
		EntFire( "elevbuttonoutsidefront", "skin", "1" );
		EntFire( "sound_elevator_startup", "playsound" );
		EntFire( "elevator_start_shake", "startshake" );
		EntFire( "elevator_number_relay", "trigger" );
		EntFire( "elevator_breakwalls", "kill" );
		EntFire( "elevator_game_event", "kill" );
		do_once = true;
	}
	if( !churchguy_tank && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "spawn_church_zombie", "addoutput", "population tank" );
		churchguy_tank = true;
	}
}
