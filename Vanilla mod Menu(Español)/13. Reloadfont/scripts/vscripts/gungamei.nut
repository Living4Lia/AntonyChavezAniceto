//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Infestation\n");
Msg("Made by Rayman1103\n");

IncludeScript("infestation");
IncludeScript("gungame_base");

GunGameOptions <-
{
	RelaxMinInterval = 0
	RelaxMaxInterval = 0
	SpecialRespawnInterval = 7
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	CommonLimit = 0
	cm_CommomLimit = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 14
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ProhibitBosses = 1
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SurvivorMaxIncapacitatedCount = 1
}

GunGameState <-
{
	HPRegenTime = 3.0
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}
