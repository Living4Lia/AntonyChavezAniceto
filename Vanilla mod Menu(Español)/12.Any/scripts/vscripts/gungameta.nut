//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Tank Attack\n");
Msg("Made by Rayman1103\n");

IncludeScript("tankattack");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_ShouldHurry = 1
	cm_AllowSurvivorRescue = 0
	cm_InfiniteFuel = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 8
	cm_TankLimit = 8
	
	EscapeSpawnTanks = true
	//ZombieTankHealth = 3500
}

GunGameState <-
{
	SpawnTank = false
	TriggerRescue = false
	HPRegenTime = 2.0
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

// Remove the vomitjar from the Gun Game weapon list
Utils.RemoveValueFromArray(ListOfRandomWeps, "vomitjar");

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(50);
	player.SetHealthBuffer(0);
}
