//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Special Surprise\n");
Msg("Made by Rayman1103\n");

IncludeScript("specialsurprise");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_ProhibitBosses = true
	SpecialInitialSpawnDelayMin = 999999
	SpecialInitialSpawnDelayMax = 999999
	//ZombieTankHealth = 5000
	
	BoomerLimit = 14
	SmokerLimit = 14
	HunterLimit = 14
	ChargerLimit = 14
	SpitterLimit = 14
	JockeyLimit = 14
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 4 )
		return;
	
	//Intentionally left blank to override function in specialsurprise.nut
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}
