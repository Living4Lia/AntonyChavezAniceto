//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Brute Force\n");
Msg("Made by Rayman1103\n");

IncludeScript("bruteforce");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_AggressiveSpecials = 1
	cm_AllowSurvivorRescue = false
	cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 10 //12
	cm_MaxSpecials = 10 //12
	cm_SpecialRespawnInterval = 5
	SpecialInitialSpawnDelayMin = 2
	SpecialInitialSpawnDelayMax = 3
	ShouldAllowSpecialsWithTank = true
	
	SmokerLimit = 0
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	ChargerLimit = 2
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );

// Remove the vomitjar from the Gun Game weapon list
Utils.RemoveValueFromArray(ListOfRandomWeps, "vomitjar");

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( attacker.GetType() == Z_BOOMER && victim.GetTeam() == SURVIVORS )
		{
			ScriptedDamageInfo.DamageDone = 5;
			return true;
		}
		if ( attacker.GetType() == Z_HUNTER && victim.GetTeam() == SURVIVORS )
		{
			ScriptedDamageInfo.DamageDone = 10;
			return true;
		}
		if ( attacker.GetType() == Z_SPITTER && damageTable.DamageType == DMG_CLUB && victim.GetTeam() == SURVIVORS )
		{
			ScriptedDamageInfo.DamageDone = 5;
			return true;
		}
		if ( attacker.GetType() == Z_JOCKEY && victim.GetTeam() == SURVIVORS )
		{
			ScriptedDamageInfo.DamageDone = 5;
			return true;
		}
		if ( attacker.GetType() == Z_CHARGER && victim.GetTeam() == SURVIVORS )
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

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 4 )
		return;
	
	//Intentionally left blank to override function in bruteforce.nut
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}

function Notifications::OnSmokerChokeBegin::BreakTongue( smoker, victim, params )
{
	Convars.SetValue( "tongue_force_break", "1" );
}
