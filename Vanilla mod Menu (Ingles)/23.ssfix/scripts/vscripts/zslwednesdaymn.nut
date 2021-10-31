//-----------------------------------------------------
Msg("Activating Wednesday Morning Riot!!\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 30
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	cm_ProhibitBosses = 1
	cm_AllowSurvivorRescue = 0
	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
	SurvivorMaxIncapacitatedCount = 0

	RandomPrimary =
	[
		"autoshotgun",
		"shotgun_spas",
	]
	RandomSecondary =
	[
		"baseball_bat"
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		return 0;
	}
}

ZSLState <-
{
	IsRaceEvent = false
	RiotKillTimer = {}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnSurvivorsLeftStartArea::ForcePanic()
{
	Utils.ForcePanicEvent();
}

::KillRiot <- function ( infected )
{
	if ( infected.IsEntityValid() )
		infected.Kill();
}

function Notifications::OnDeath::RiotDeath( victim, attacker, params )
{
	if ( victim.GetUncommonInfected() == Z_RIOT )
	{
		local index = victim.GetIndex();
		if ( index in SessionState.RiotKillTimer )
		{
			SessionState.RiotKillTimer.rawdelete(index);
			Timers.RemoveTimerByName("KillRiot" + index);
		}
	}
}

function EasyLogic::Update::Think()
{
	foreach ( infected in Zombies.CommonInfected() )
	{
		local index = infected.GetIndex();
		if ( !(index in SessionState.RiotKillTimer) && (infected.IsAlive()) )
		{
			SessionState.RiotKillTimer[index] <- true;
			Timers.AddTimerByName("KillRiot" + index, 60.0, false, KillRiot, infected);
		}
	}
}
