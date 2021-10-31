//-----------------------------------------------------
Msg("Activating Death Clock: Random\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("deathclock_base");

DeathClockOptions <-
{
	TankHitDamageModifierCoop = 0.2
	ZombieTankHealth = 1000
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
}

DeathClockState <-
{
	EnableTanks = false
}

AddDefaultsToTable( "DeathClockOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "DeathClockState", g_ModeScript, "MutationState", g_ModeScript );

function GetRandomInfected()
{
	local InfectedChoices =
	[
		Z_SMOKER
		Z_BOOMER
		Z_HUNTER
		Z_SPITTER
		Z_JOCKEY
		Z_CHARGER
		Z_TANK
	]
	
	if ( Utils.IsFinale() )
		Utils.RemoveValueFromArray( InfectedChoices, Z_TANK );
	
	for ( local i = 0; i < 3; i++ )
	{
		local random_choice = Utils.GetRandValueFromArray( InfectedChoices );
		
		switch ( random_choice )
		{
			case Z_SMOKER:
			{
				SessionOptions.SmokerLimit += 4;
				break;
			}
			case Z_BOOMER:
			{
				SessionOptions.BoomerLimit += 4;
				break;
			}
			case Z_HUNTER:
			{
				SessionOptions.HunterLimit += 4;
				break;
			}
			case Z_SPITTER:
			{
				SessionOptions.SpitterLimit += 4;
				break;
			}
			case Z_JOCKEY:
			{
				SessionOptions.JockeyLimit += 4;
				break;
			}
			case Z_CHARGER:
			{
				SessionOptions.ChargerLimit += 4;
				break;
			}
			case Z_TANK:
			{
				SessionOptions.TankLimit += 4;
				SessionOptions.cm_TankLimit += 4;
				SessionState.EnableTanks = true;
				break;
			}
			default:
				break;
		}
	}
}

::SpawnTank <- function ( args )
{
	Msg("Spawning Tank!\n");
	Utils.SpawnZombie( Z_TANK );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	if ( SessionState.EnableTanks )
	{
		SpawnTank(null);
		Timers.AddTimer( 10.0, true, SpawnTank );
	}
}

function Notifications::OnRoundStart::RandomInfected()
{
	g_ModeScript.GetRandomInfected();
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "unlock" );
	EntFire( "tank_sound_timer", "kill" );
	
	//EntFire( "spawn_church_zombie", "addoutput", "population hunter" );
	
	EntFire( "info_director", "FireConceptToAny", "PlayerHurryUp" );
	
	/*if ( Entities.FindByName( null, "l4d1_teleport_relay" ) )
	{
		SessionOptions.cm_MaxSpecials <- 10;
		SessionOptions.cm_DominatorLimit <- 10;
		SessionOptions.HunterLimit <- 10;
	}*/
}
