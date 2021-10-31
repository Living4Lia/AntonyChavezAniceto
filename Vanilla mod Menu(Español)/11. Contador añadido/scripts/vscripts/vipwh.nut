//-----------------------------------------------------
Msg("Activating VIP Escort: Witching Hour\n");
Msg("Made by Rayman1103\n");

IncludeScript("witchinghour");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = false
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

function GetNextStage()
{
	if ( SessionState.TriggerRescue )
	{
		Msg("Activated STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE
		SessionOptions.ScriptedStageValue = 0
		SessionState.TriggerRescue = false;
	}
}

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 5 )
		return;
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		//survivor.SetReviveCount( 0 );
	}
}
