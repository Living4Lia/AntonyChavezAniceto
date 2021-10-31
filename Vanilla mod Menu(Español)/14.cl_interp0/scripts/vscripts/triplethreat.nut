//-----------------------------------------------------
Msg("Activating Triple Threat\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("ass_base");

ASSOptions <-
{
	cm_MaxSpecials = 14
	cm_DominatorLimit = 14
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	//SurvivorMaxIncapacitatedCount = 1
	TankHitDamageModifierCoop = 0.3 //0.2
	ShouldAllowSpecialsWithTank = true
	ZombieTankHealth = 1000
	
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
	EnableTanks = false
}

AddDefaultsToTable( "ASSOptions", g_ModeScript, "MutationOptions", g_ModeScript );

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

function Notifications::OnRoundStart::RandomInfected()
{
	g_ModeScript.GetRandomInfected();
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	if ( SessionState.EnableTanks )
	{
		SpawnTank(null);
		Timers.AddTimer( 5.0, true, SpawnTank );
	}
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
}
