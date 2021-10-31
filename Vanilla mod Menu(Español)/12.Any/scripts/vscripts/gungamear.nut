//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Air Raid\n");
Msg("Made by Rayman1103\n");

IncludeScript("airraid");
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
	SurvivorMaxIncapacitatedCount = 1
	
	BoomerLimit = 3
	SmokerLimit = 3
	HunterLimit = 3
	ChargerLimit = 2
	SpitterLimit = 1
	JockeyLimit = 2
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( attacker.GetType() == Z_HUNTER && victim.GetTeam() == SURVIVORS )
		{
			ScriptedDamageInfo.DamageDone = 10;
			return true;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	//Intentionally left blank to override function in airraid.nut
}
