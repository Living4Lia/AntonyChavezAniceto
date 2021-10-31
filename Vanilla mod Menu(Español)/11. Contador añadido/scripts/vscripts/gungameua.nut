//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Uncommon Ambush\n");
Msg("Made by Rayman1103\n");

IncludeScript("uncommonambush");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 5
	cm_MaxSpecials = 5
	cm_SpecialRespawnInterval = 0
	cm_SpecialSlotCountdownTime = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	//cm_ProhibitBosses = true
	SpecialInfectedAssault = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	//ShouldAllowSpecialsWithTank = true
	//ZombieTankHealth = 5000
	FarAcquireRange = 999999
	NearAcquireRange = 999999
	FarAcquireTime = 0.0
	NearAcquireTime = 0.0
	
	BoomerLimit = 2
	SmokerLimit = 2
	HunterLimit = 2
	ChargerLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
}

GunGameState <-
{
	HPRegenTime = 3.0
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(50);
	player.SetHealthBuffer(0);
}
