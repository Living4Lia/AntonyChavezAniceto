//-----------------------------------------------------
Msg("Activating Sunday Night Suicide Sprint\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 0
	cm_AllowSurvivorRescue = 0
	cm_DominatorLimit = 12
	cm_MaxSpecials = 12
	cm_AggressiveSpecials = 1
	SpecialRespawnInterval = 5
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	ShouldAllowSpecialsWithTank = true
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	BoomerLimit = 12
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	SurvivorMaxIncapacitatedCount = 0

	DefaultItems =
	[
		"baseball_bat",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}
	
	TempHealthDecayRate = 0.001
}

ZSLState <-
{
	IsRaceEvent = false
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::InfernoRemove <- function ( args )
{
	foreach( inferno in Objects.OfClassname("inferno") )
	{
		if ( inferno.GetOwnerEntity() != null )
			inferno.Input("Kill");
	}
}

function Notifications::OnDeath::BoomerDeath( victim, attacker, params )
{
	if ( victim.GetType() == Z_BOOMER )
	{
		Timers.AddTimer(0.1, false, InfernoRemove);
	}
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "barricade_gas_can", "Ignite" );
	if ( !SessionState.HasSurvivalFinale )
		Timers.AddTimerByName("HealthRegenTimer", 1.0, true, HealthRegen);
}
