//-----------------------------------------------------
Msg("Activating Swarm\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_ShouldHurry = 1
	ProhibitBosses = 1
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0

	cm_BaseCommonAttackDamage = 6

	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS

	weaponsToRemove =
	{
		weapon_first_aid_kit = 0
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		ammo = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}
	
	DefaultItems =
	[
		"weapon_pistol_magnum",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}
}

MutationState <-
{
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

::SurvivorStats <-
{
	score = {}
}

::SurvivorStatsBackup <-
{
	score = {}
}

function GetTotalScore()
{
	local total = 0;
	
	for ( local i = 0; i < 4; i++ )
	{
		if ( SessionState.DisplayScore(i).tostring() != "" )
			total += SessionState.DisplayScore(i);
	}
	
	return total;
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		if ( Utils.IsFinale() )
		{
			SaveTable( "Stats", SurvivorStats );
			SaveTable( "StatsBackup", SurvivorStats );
		}
		else
		{
			RestoreTable( "StatsBackup", SurvivorStatsBackup );
			SaveTable( "StatsBackup", SurvivorStatsBackup );
			SaveTable( "Stats", SurvivorStatsBackup );
		}
	}
	else if ( reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION )
	{
		if ( nextmap != Utils.GetNextMap() )
			return;
		
		SaveTable( "Stats", SurvivorStats );
		SaveTable( "StatsBackup", SurvivorStats );
	}
}

function Notifications::OnRoundStart::LoadData()
{
	RestoreTable( "Stats", SurvivorStats );
	RestoreTable( "StatsBackup", SurvivorStatsBackup );
}

::ForcePanic <- function ( args )
{
	Utils.ForcePanicEvent();
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( victim.GetTeam() == SURVIVORS )
		{
			if ( attacker.GetClassname() == "infected" )
			{
				if ( victim.IsIncapacitated() )
				{
					damageTable.DamageDone = 2;
					return true;
				}
				else
				{
					damageTable.DamageDone = 45;
					return true;
				}
			}
			else if ( attacker.IsSurvivor() )
			{
				return false;
			}
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnEnterSaferoom::KillInfected( player, params )
{
	if ( player.GetTeam() == INFECTED )
		player.Kill();
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker != null )
	{
		if ( attacker.IsSurvivor() && victim.GetType() == Z_COMMON )
		{
			g_ModeScript.SurvivorStats.score[attacker.GetCharacterName()]++;
		}
	}
}

/*function Notifications::OnIncapacitated::ReviveSurvivor( victim, attacker, params )
{
	victim.Revive();
}*/

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(50);
	player.SetHealthBuffer(0);
}

function Notifications::OnSurvivorsLeftStartArea::ForcePanicEvent()
{
	if ( !Entities.FindByClassname( null, "trigger_finale" ) )
	{
		Utils.ForcePanicEvent();
		Timers.AddTimer( 15.0, true, ForcePanic );
	}
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
		if ( !(survivor.GetCharacterName() in SurvivorStats.score) )
			SurvivorStats.score[survivor.GetCharacterName()] <- 0;
	}
	Timers.AddTimerByName("HealthRegenTimer", 1.0, true, HealthRegen);
}

function SetupModeHUD()
{
	StatHUD <-
	{
		Fields =
		{
			info = 
			{
				slot = HUD_SCORE_TITLE ,
				datafunc = @() SessionState.KillsInfo,
				name = "info",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			total = 
			{
				slot = HUD_MID_BOX ,
				datafunc = @() g_ModeScript.GetTotalScore(),
				name = "total",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			name0 = 
			{
				slot = HUD_FAR_LEFT ,
				datafunc = @() SessionState.DisplayName(0) + SessionState.SpacerString + "(" + SessionState.DisplayScore(0) + ")",
				name = "name0",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name1 = 
			{
				slot = HUD_MID_TOP ,
				datafunc = @() SessionState.DisplayName(1) + SessionState.SpacerString + "(" + SessionState.DisplayScore(1) + ")",
				name = "name1",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name2 = 
			{
				slot = HUD_FAR_RIGHT ,
				datafunc = @() "(" + SessionState.DisplayScore(2) + ")" + SessionState.SpacerString + SessionState.DisplayName(2),
				name = "name2",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
			name3 = 
			{
				slot = HUD_MID_BOT ,
				datafunc = @() "(" + SessionState.DisplayScore(3) + ")" + SessionState.SpacerString + SessionState.DisplayName(3),
				name = "name3",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
		}
	}
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOX, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	HUDSetLayout( StatHUD );
}
