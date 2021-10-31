//-----------------------------------------------------
Msg("Activating ZSL Jockey Trouble\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_survival_base");

ZSLOptions <-
{
	JockeyLimit = 12
	TankLimit = 4
	cm_TankLimit = 4
	cm_BaseCommonAttackDamage = 0
	TankHitDamageModifierCoop = 0.5

	RandomPrimary =
	[
		"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	RandomSecondary =
	[
		"weapon_pistol_magnum",
	]
	
	RandomTertiary =
	[
		"weapon_molotov",
	]
	
	Random4th =
	[
		"weapon_adrenaline",
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		local TRand = RandomInt(0,RandomTertiary.len()-1);
		local FourRand = RandomInt(0,Random4th.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		else if(id == 2) return RandomTertiary[TRand];
		else if(id == 3) return Random4th[FourRand];
		return 0;
	}
}

ZSLState <-
{
	JockeyRideDamage = {}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( !(survivor.GetCharacterName() in SessionState.JockeyRideDamage) )
			SessionState.JockeyRideDamage[survivor.GetCharacterName()] <- {};
	}
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
		
		if ( SessionState.JockeyRideDamage[name][index] >= 40 )
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
