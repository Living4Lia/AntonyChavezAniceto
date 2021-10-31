//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Witching Hour\n");
Msg("Made by Rayman1103\n");

IncludeScript("witchinghour");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_AllowSurvivorRescue = 0
	CommonLimit = 0
	MaxSpecials = 0
	SmokerLimit = 0
	BoomerLimit = 0
	HunterLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0
	TankLimit = 0
	WitchLimit = 10
}

GunGameState <-
{
	CurrentStage = -1
	TriggerRescue = false
	HPRegenTime = 0
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

// Remove the vomitjar from the Gun Game weapon list
Utils.RemoveValueFromArray(ListOfRandomWeps, "vomitjar");

::RespawnWitches <- function ( args )
{
	Timers.RemoveTimerByName( "HealthRegenTimer" );
	if ( !Utils.IsScavengeFinale() )
		HUDManageTimers( 0, TIMER_COUNTDOWN, 120 );
	Utils.SayToAll( "The Witching Hour Has Begun..." );
	SessionOptions.WitchLimit = 10;
	
	// This will kill the witches in 120 seconds
	if ( !Utils.IsScavengeFinale() )
		Timers.AddTimer(120.0, false, KillWitches);
	
	// By adding a timer by name, any timer that previously existed with the specified name will be overwritten.
	// The benefit is that you won't need to mess with timer indexes.
	Timers.AddTimerByName("SpawnWitchTimer", 1.0, true, SpawnWitch, Players.AnyAliveSurvivor() );
}

::KillWitches <- function ( args )
{
	EntFire( "witch", "kill" );
	SessionOptions.WitchLimit = 0;
	//foreach ( witch in Objects.OfClassname("witch") )
	//	witch.Hurt(65535);
	Timers.AddTimer( 30.0, false, RespawnWitches );
	Timers.RemoveTimerByName ( "SpawnWitchTimer" );
	HealthRegen(null);
	Timers.AddTimerByName("HealthRegenTimer", 1.0, true, HealthRegen);
}

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 4 )
		return;
	
	//Intentionally left blank to override function in witchinghour.nut
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}
