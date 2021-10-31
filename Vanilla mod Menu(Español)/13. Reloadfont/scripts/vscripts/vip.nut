//-----------------------------------------------------
Msg("Activating VIP Escort\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "The Survivors heartbeat is linked to yours, if he dies everyone dies. There is no incaps, if you go down you're dead."
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnHealSuccess::VIPHealed( player, healer, health, params )
{
	if ( player.GetSurvivorCharacter() == 9 )
	{
		player.SetReviveCount(2);
		player.SetNetProp("m_bIsOnThirdStrike", 0);
		player.SetNetProp("m_isGoingToDie", 0);
	}
}

/*::AttackVIP <- function ( args )
{
	foreach( infected in Zombies.All() )
	{
		infected.BotAttack(SessionState.VIP);
	}
}

function Notifications::OnSurvivorsLeftStartArea::CreateAttackVIPTimer()
{
	AttackVIP(null);
	Timers.AddTimer( 30.0, true, AttackVIP );
}*/
