//-----------------------------------------------------
Msg("Activating VIP Escort: Tank Splitters\n");
Msg("Made by Rayman1103\n");

IncludeScript("tanksplitters");
IncludeScript("vip_base");

VIPOptions <-
{
	SurvivorMaxIncapacitatedCount = 1
	TempHealthDecayRate = 0.001
}

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = false
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

::VIPData.givemedkits <- false;

function GetNextStage()
{
	if ( SessionState.SpawnTank )
	{
		Msg("Spawning Tank!\n");
		SessionOptions.ScriptedStageType = STAGE_TANK;
		SessionOptions.ScriptedStageValue = 1;
		SessionState.SpawnTank = false;
	}
	else if ( !SessionState.SpawnTank )
	{
		SessionOptions.ScriptedStageType = STAGE_DELAY;
		SessionOptions.ScriptedStageValue = -1;
	}
	if ( SessionState.TriggerRescue )
	{
		Msg("Triggered STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE;
		SessionState.TriggerRescue = false;
	}
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetReviveCount() == 0 )
		{
			if ( survivor.GetRawHealth() < 100 )
				survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
		}
		else if ( survivor.GetReviveCount() == 1 )
		{
			if ( survivor.GetHealthBuffer() < 100 )
				survivor.SetHealthBuffer( survivor.GetHealthBuffer() + 1 );
		}
	}
}

::TankDeathCheck <- function ( args )
{
	if ( Utils.GetInfectedStats().Tanks == 0 )
	{
		SessionState.AllowTankSplit = false;
		SessionState.TanksSplit = 0;
		SessionState.TankSplitLevel = 0;
		Timers.AddTimer( 30.0, false, SpawnTank );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS && !SessionState.VIPDefibStart )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(1);
	player.SetHealthBuffer(50);
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
	Timers.AddTimerByName("HealthRegenTimer", 3.0, true, HealthRegen);
	Timers.AddTimer(0.1, false, GiveWeapons);
}
