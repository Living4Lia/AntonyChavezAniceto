//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Hunter Barrage\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_AggressiveSpecials = 1
	cm_AllowSurvivorRescue = false
	cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_SpecialRespawnInterval = 5
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 14
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
