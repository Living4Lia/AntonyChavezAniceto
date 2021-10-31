//-----------------------------------------------------
Msg("Activating Tank Frenzy\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("ass_base");

ASSOptions <-
{
	cm_MaxSpecials = 14
	cm_DominatorLimit = 14
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SurvivorMaxIncapacitatedCount = 0
	TankHitDamageModifierCoop = 2.5 //100
	ZombieTankHealth = 100

	TankLimit = 14
	cm_TankLimit = 14
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.334 // pain_pills_decay_rate default 0.27
		}
	}
}

MutationState <-
{
	SpawnTank = false
	TriggerRescue = false
}

AddDefaultsToTable( "ASSOptions", g_ModeScript, "MutationOptions", g_ModeScript );

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

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
	
	EntFire( "finale_cleanse_exit_door", "unlock" );
	EntFire( "finale_cleanse_exit_door", "open" );
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
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
	Timers.AddTimer( 3.0, true, SpawnTank );
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

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
}
