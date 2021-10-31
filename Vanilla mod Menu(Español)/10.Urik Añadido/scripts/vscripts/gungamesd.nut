//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Special Delivery\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 8
	cm_MaxSpecials = 8
	cm_ProhibitBosses = false
	cm_SpecialRespawnInterval = 5

	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 10
	ShouldAllowSpecialsWithTank = true
	EscapeSpawnTanks = true

	SmokerLimit = 1
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 1
	JockeyLimit = 1
	ChargerLimit = 1
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function Notifications::OnRoundStart::SetupTheRound()
{
	// Disable car alarms
	Utils.DisableCarAlarms();
	
	// Remove zombie spawn points
	Utils.RemoveZombieSpawns();
	
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	
	if( Entity("c1m1_c1m2_changelevel").IsEntityValid() )
		DirectorOptions.TankLimit <- 0;
	
	if( Entity("spawn_train_tank_coop").IsEntityValid() )
		DirectorOptions.cm_ProhibitBosses <- true;
	
	
	local PistolSpawn = Objects.AnyOfClassname("weapon_pistol_spawn");
	
	if (PistolSpawn)
	{
		foreach (L4D1Survivor in Players.L4D1Survivors())
			L4D1Survivor.Use(PistolSpawn);
	}
	
	if( Entity("instructor_impound").IsEntityValid() )
		EntFire( "trigger_multiple", "kill" );
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}

function EasyLogic::Update::Think()
{
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
