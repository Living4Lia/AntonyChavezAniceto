//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Death's Door\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("gungame_base");

GunGameOptions <-
{
	cm_ShouldHurry = 1
	cm_AllowPillConversion = 0
	cm_AllowSurvivorRescue = 0
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	SurvivorMaxIncapacitatedCount = 0
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

function Notifications::OnPlayerReplacedBot::StopHeartbeat( player, bot, params )
{
	player.StopSound( "Player.HeartbeatLoop" );
	player.StopSound( "Player.Heartbeat" );
}
