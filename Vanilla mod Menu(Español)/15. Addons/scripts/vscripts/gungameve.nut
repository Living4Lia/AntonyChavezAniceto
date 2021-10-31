//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: The Very End of You\n");

IncludeScript("veryend");
IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_AggressiveSpecials = 0
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 10
	cm_MaxSpecials = 10
	cm_SpecialRespawnInterval = 20
	
	MobMaxPending = 0
	ShouldAllowSpecialsWithTank = true
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	
	SmokerLimit = 2
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 2
	JockeyLimit = 1
	ChargerLimit = 1
	//WitchLimit = 0
	//cm_WitchLimit = 0
}

GunGameState <-
{
	AdjustGasCansPoured = 0
	AdjustNumCansNeeded = -1
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

// Remove the vomitjar from the Gun Game weapon list
Utils.RemoveValueFromArray(ListOfRandomWeps, "vomitjar");

::PreventDamage <- function ( args )
{
	SessionState.AllowDamage = false;
}

function EasyLogic::OnTakeDamage::AllowDamageExt( damageTable )
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

function Notifications::OnSurvivorsSpawned::ModeStartedExt( amount )
{
	if ( amount != 4 )
		return;
	
	SessionState.AllowDamage = true;
	Timers.AddTimer(1.0, false, PreventDamage);
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}
