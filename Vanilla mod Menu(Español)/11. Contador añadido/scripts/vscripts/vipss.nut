//-----------------------------------------------------
Msg("Activating VIP Escort: Special Slayer\n");
Msg("Made by Rayman1103\n");

IncludeScript("specialslayer");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = false
	VIPRules = "The Survivor's heartbeat is linked to yours, if he dies, everyone dies. There are no incaps, if you go down, you're dead."
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowTakeDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( victim.IsSurvivor() && damageTable.DamageType == DMG_BURN )
	{
		if ( victim.GetSurvivorCharacter() == 9 )
		{
			return false;
		}
	}
	if ( attacker.GetType() == Z_BOOMER && victim.GetTeam() == SURVIVORS )
	{
		ScriptedDamageInfo.DamageDone = 15;
	}
	if ( attacker.GetType() == Z_TANK && victim.GetTeam() == SURVIVORS )
	{
		ScriptedDamageInfo.DamageDone = 10;
	}
	return true;
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		//survivor.SetReviveCount( 0 );
	}
}
