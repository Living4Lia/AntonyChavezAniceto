//-----------------------------------------------------
Msg("Activating Death Clock: Smokers\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("deathclock_base");

DeathClockOptions <-
{
	SmokerLimit = 14
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
}

AddDefaultsToTable( "DeathClockOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "unlock" );
	EntFire( "tank_sound_timer", "kill" );
	
	EntFire( "spawn_church_zombie", "addoutput", "population smoker" );
	
	EntFire( "info_director", "FireConceptToAny", "PlayerHurryUp" );
	
	if ( Entities.FindByName( null, "l4d1_teleport_relay" ) )
	{
		SessionOptions.cm_MaxSpecials <- 10;
		SessionOptions.cm_DominatorLimit <- 10;
		SessionOptions.SmokerLimit <- 10;
	}
}
