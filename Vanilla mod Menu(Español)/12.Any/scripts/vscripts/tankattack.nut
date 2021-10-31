//-----------------------------------------------------
Msg("Activating Tank Attack\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheModel("models/infected/hulk.mdl");
Utils.PrecacheModel("models/infected/hulk_dlc3.mdl");

MutationOptions <-
{
	cm_ShouldHurry = 1
	cm_AllowSurvivorRescue = 0
	cm_InfiniteFuel = 1
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
	
	EscapeSpawnTanks = true
	//ZombieTankHealth = 3500

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb = 	"weapon_molotov_spawn"
		weapon_vomitjar = 	"weapon_molotov_spawn"
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

	DefaultItems =
	[
		"weapon_pistol_magnum",
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

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	if ( SessionState.MapName == "c8m4_interior" )
	{
		EntFire( "elevator", "movetofloor", "bottom" );
		EntFire( "elevator_pulley", "start" );
		EntFire( "elevator_pulley2", "start" );
		EntFire( "elevbuttonoutsidefront", "skin", "1" );
		EntFire( "sound_elevator_startup", "playsound" );
		EntFire( "elevator_start_shake", "startshake" );
		EntFire( "elevator_number_relay", "trigger" );
		EntFire( "elevator_breakwalls", "kill" );
		EntFire( "elevator_game_event", "kill" );
	}
	EntFire( "finale_cleanse_entrance_door", "lock" );
	EntFire( "finale_cleanse_exit_door", "unlock" );
	EntFire( "ceda_trailer_canopen_frontdoor_listener", "kill" );
	EntFire( "finale_cleanse_backdoors_blocker", "kill" );
	EntFire( "radio_fake_button", "press" );
	EntFire( "drawbridge", "movetofloor", "bottom" );
	EntFire( "drawbridge_start_sound", "playsound" );
	EntFire( "startbldg_door_button", "press" );
	EntFire( "startbldg_door", "open" );
	
	EntFire( "spawn_church_zombie", "addoutput", "population tank" );
	
	Utils.DisableCarAlarms();
	
	if ( Entities.FindByName( null, "instructor_impound" ) )
		EntFire( "trigger_multiple", "kill" );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
	Timers.AddTimer( 15.0, true, SpawnTank );
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	if ( !Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
	{
		foreach (trigger_finale in Objects.OfClassname("trigger_finale"))
		{
			trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
		}
	}
}

function Notifications::OnTankSpawned::TankSpawn( tank, params )
{
	if ( RandomInt( 0, 1 ) == 1 )
	{
		local TankModels =
		[
			"models/infected/hulk.mdl"
			"models/infected/hulk_dlc3.mdl"
		]
		
		if ( tank.GetModel() == "models/infected/hulk.mdl" || tank.GetModel() == "models/infected/hulk_dlc3.mdl" )
			Utils.RemoveValueFromArray(TankModels, tank.GetModel());
		
		tank.SetModel(Utils.GetRandValueFromArray(TankModels));
	}
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
}

::FinaleStarted <- function ()
{
	Timers.AddTimer( 240.0, false, TriggerRescue );
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
