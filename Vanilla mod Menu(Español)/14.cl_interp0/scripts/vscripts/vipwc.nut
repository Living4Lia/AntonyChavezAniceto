//-----------------------------------------------------
Msg("Activating VIP Escort: Wrecking Crew\n");
Msg("Made by Rayman1103\n");

IncludeScript("wreckingcrew");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
		survivor.GiveRandomMelee();
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS && !SessionState.VIPDefibStart )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}
