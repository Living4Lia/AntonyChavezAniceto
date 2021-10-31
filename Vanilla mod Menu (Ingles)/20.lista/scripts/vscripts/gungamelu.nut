//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: The Last of Us\n");

IncludeScript("lastofus");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_AllowSurvivorRescue = false
	cm_BaseCommonAttackDamage = 100
	cm_CommonLimit = 45 //25
	cm_HeadshotOnly = 1
	cm_ShouldHurry = 1
	cm_MaxSpecials = 0
	cm_DominatorLimit = 0
	AlwaysAllowWanderers = true
	NumReservedWanderers = 40 //30
	PreferredMobDirection = SPAWN_ANYWHERE
	//SurvivorMaxIncapacitatedCount = 4 //99
	//MegaMobSize = 15 //testing 15
	//MegaMobMinSize = 15 //testing 15
	//MegaMobMaxSize = 15 //testing 20
	//MobMinSize = 10 //15
	//MobMaxSize = 10 //15
	//MobSpawnMinTime = 999999
	//MobSpawnMaxTime = 999999
	//MobSpawnSize = 5 //15
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
}

GunGameState <-
{
	AdjustGasCansPoured = 0
	AdjustNumCansNeeded = -1
	CurrentStage = -1
	FinaleStarted = false
	TriggerRescue = false
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

::PreventDamage <- function ( args )
{
	SessionState.AllowDamage = false;
}

function Notifications::OnSurvivorsSpawned::ModeStartedExt( amount )
{
	if ( amount != 4 )
		return;
	
	SessionState.AllowDamage = true;
	Timers.AddTimer(1.0, false, PreventDamage);
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}
