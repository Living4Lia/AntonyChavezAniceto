//-----------------------------------------------------
Msg("Activating Death Clock: Specials\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("deathclock_base");

DeathClockOptions <-
{
	ShouldAllowSpecialsWithTank = true
	ZombieTankHealth = 2000
	
	BoomerLimit = 3
	SmokerLimit = 3
	HunterLimit = 2
	ChargerLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	//TankLimit = 0
	//cm_TankLimit = 0
	//WitchLimit = 0
	//cm_WitchLimit = 0
}

AddDefaultsToTable( "DeathClockOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "unlock" );
	EntFire( "tank_sound_timer", "kill" );
	
	EntFire( "info_director", "FireConceptToAny", "PlayerHurryUp" );
	
	if ( Entities.FindByName( null, "l4d1_teleport_relay" ) )
	{
		SessionOptions.cm_MaxSpecials <- 10;
		SessionOptions.cm_DominatorLimit <- 10;
		SessionOptions.BoomerLimit <- 2;
		SessionOptions.SmokerLimit <- 2;
		SessionOptions.HunterLimit <- 1;
		SessionOptions.ChargerLimit <- 2;
		SessionOptions.SpitterLimit <- 2;
		SessionOptions.JockeyLimit <- 1;
	}
}
