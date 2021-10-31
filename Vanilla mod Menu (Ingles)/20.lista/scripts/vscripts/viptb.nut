//-----------------------------------------------------
Msg("Activating VIP Escort: Tank Brawl\n");
Msg("Made by Rayman1103\n");

IncludeScript("tankbrawl");
IncludeScript("vip_base");

VIPOptions <-
{
	//SurvivorMaxIncapacitatedCount = 1
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
		survivor.GiveRandomMelee();
	}
	Timers.AddTimerByName("HealthRegenTimer", 2.0, true, HealthRegen);
}
