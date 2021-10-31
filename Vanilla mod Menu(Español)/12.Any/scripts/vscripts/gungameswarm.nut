//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Swarm\n");
Msg("Made by Rayman1103\n");

IncludeScript("swarm");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_ShouldHurry = 1
	SurvivorMaxIncapacitatedCount = 1
	ProhibitBosses = 1
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0

	//cm_BaseCommonAttackDamage = 6

	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
}

GunGameState <-
{
	HPRegenTime = 1.0
	SpacerString = "  "
	KillsInfo = "Zombies Destroyed"
	
	function DisplayName(ind)
	{
		local p = Utils.GetPlayerFromCharacter(ind)
		if(p)
		{
			return (p.GetName())
		}
		else
		{
			return ""
		}
	}
	
	function DisplayScore(ind)
	{
		local p = Utils.GetPlayerFromCharacter(ind)
		if( (p) && (p.GetCharacterName() in g_ModeScript.SurvivorStats.score) )
		{
			return (g_ModeScript.SurvivorStats.score[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	foreach ( survivor in Players.AliveSurvivors() )
	{
		if ( !(survivor.GetCharacterName() in SurvivorStats.score) )
			SurvivorStats.score[survivor.GetCharacterName()] <- 0;
	}
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(50);
	player.SetHealthBuffer(0);
}
