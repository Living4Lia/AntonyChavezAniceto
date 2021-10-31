//-----------------------------------------------------
Msg("Activating Thursday Night Jockey Trouble!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 0
	cm_MaxSpecials = 12
	cm_DominatorLimit = 12
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 12
	WitchLimit = 0
	cm_WitchLimit = 0
	cm_SpecialRespawnInterval = 0
	cm_AggressiveSpecials = 1
	cm_AutoReviveFromSpecialIncap = 1
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	cm_BaseCommonAttackDamage = 0
	cm_AllowSurvivorRescue = 0
	ProhibitBosses = false
	TankHitDamageModifierCoop = 0.1

	RandomPrimary =
	[
		"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		return 0;
	}

	TempHealthDecayRate = 0.001
}

ZSLState <-
{
	IsRaceEvent = false
	JockeyRideDamage = {}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( (victim) && (victim.IsSurvivor()) )
	{
		if ( attacker.GetType() == Z_JOCKEY )
		{
			local jockey = victim.GetNetPropEntity( "m_jockeyAttacker" );
			if ( (jockey) && (jockey.GetEntityHandle() == attacker.GetEntityHandle()) )
			{
				ScriptedDamageInfo.DamageDone = 12;
				return true;
			}
		}
	}
	return true;
}

function Notifications::OnSurvivorsSpawned::GiveRandomWeapons( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( !(survivor.GetCharacterName() in SessionState.JockeyRideDamage) )
			SessionState.JockeyRideDamage[survivor.GetCharacterName()] <- {};
		
		survivor.Give("molotov");
	}
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}

::SpawnMoreTanks <- function ( args )
{
	Utils.SpawnZombie( Z_TANK );
}

function Notifications::OnTankSpawned::TankSpawned( tank, params )
{
	if ( Utils.IsFinale() )
		Timers.AddTimer(15.0, true, SpawnMoreTanks);
}

function Notifications::OnHurt::JockeyHurtSurvivor( entity, attacker, params )
{
	if ( !(entity) || !(entity.IsSurvivor()) )
		return;
	
	if ( !(attacker) || (attacker.GetType() != Z_JOCKEY) )
		return;
	
	if ( entity.GetNetPropEntity("m_jockeyAttacker") != null )
	{
		local name = entity.GetCharacterName();
		local index = attacker.GetIndex();
		local dmg_health = EasyLogic.GetEventInt(params, "dmg_health");
		
		if ( !(index in SessionState.JockeyRideDamage[name]) )
			SessionState.JockeyRideDamage[name][index] <- 0;
		
		SessionState.JockeyRideDamage[name][index] += dmg_health;
		
		if ( SessionState.JockeyRideDamage[name][index] >= 60 )
		{
			attacker.Kill();
			SessionState.JockeyRideDamage[name].rawdelete(index);
		}
	}
}

function Notifications::OnJockeyRideEnd::JockeyRideEnd( jockey, victim, params )
{
	if ( !(victim) || !(victim.IsSurvivor()) )
		return;
	
	local name = victim.GetCharacterName();
	local index = jockey.GetIndex();
	
	if ( index in SessionState.JockeyRideDamage[name] )
		SessionState.JockeyRideDamage[name].rawdelete(index);
}
