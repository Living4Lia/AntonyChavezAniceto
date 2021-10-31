//-----------------------------------------------------
Msg("Activating Monday Night Survivor Race!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_AllowSurvivorRescue = 0
	cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	//cm_FirstManOut = 1
	cm_MaxSpecials = 12
	cm_DominatorLimit = 12
	cm_ProhibitBosses = false
	BoomerLimit = 2
	SmokerLimit = 2
	HunterLimit = 2
	ChargerLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	cm_SpecialRespawnInterval = 5
	cm_AggressiveSpecials = 1
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	TankHitDamageModifierCoop = 0.01

	DefaultItems =
	[
		"weapon_pistol",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}

	TempHealthDecayRate = 0.001
}

ZSLState <-
{
	HasSurvivalFinale = false
	EventRules = "[RULES] Reach saferoom ahead of teammates! 1st: 3 points! 2nd: 2 points! 3rd: 1 point! 4th = Dead! Finale = RESCUE RACE! Reach rescue before the others: 2 points! Most points wins! [TIE BREAKER = Player with least damage taken wins!"
	IsRaceEvent = true
	VehicleAward = 2
	TieBreaker = "kills"
	KillSIQueue = {}
	SurvivorWarpLocations = {}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

::HasSurvivorPinned <- function ( infected )
{
	local isPinning = false;
	switch( infected.GetType() )
	{
		case 1:
		{
			isPinning = infected.GetNetPropInt( "m_tongueVictim" ) > 0;
			break;
		}
		case 3:
		{
			isPinning = infected.GetNetPropInt( "m_pounceVictim" ) > 0;
			break;
		}
		case 5:
		{
			isPinning = infected.GetNetPropInt( "m_jockeyVictim" ) > 0;
			break;
		}
		case 6:
		{
			isPinning = (infected.GetNetPropInt( "m_pummelVictim" ) > 0 || infected.GetNetPropInt( "m_carryAttacker" ) > 0);
			break;
		}
	}
	return isPinning;
}

::KillPinningSI <- function ( infected )
{
	if ( (infected) && (infected.IsAlive()) )
	{
		SessionState.KillSIQueue.rawdelete(infected.GetIndex());
		if ( HasSurvivorPinned( infected ) )
			infected.Kill();
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( (attacker) && (victim) )
	{
		if ( victim.IsSurvivor() )
		{
			if ( !attacker.IsSurvivor() )
			{
				if ( HasSurvivorPinned( attacker ) )
				{
					local attackerIndex = attacker.GetIndex();
					if ( !(attackerIndex in SessionState.KillSIQueue) )
					{
						SessionState.KillSIQueue[attackerIndex] <- true;
						Timers.AddTimer( 3.0, false, KillPinningSI, attacker );
					}
				}
				else
				{
					if ( attacker.GetType() == Z_SPITTER && (damageTable.DamageType == 263168 || damageTable.DamageType == 265216) )
						victim.OverrideFriction( 0.5, 2.8 );
				}
			}
			if ( SessionState.AllowRevive )
			{
				if ( attacker.GetClassname() != "worldspawn" )
				{
					if ( damageTable.DamageType == (damageTable.DamageType | DMG_DROWN) || damageTable.DamageType == (damageTable.DamageType | DMG_FALL) )
					{
						if ( victim.GetCharacterName() in SessionState.SurvivorWarpLocations )
							victim.SetLocation( SessionState.SurvivorWarpLocations[victim.GetCharacterName()] );
					}
				}
				return false;
			}
		}
	}
	return true;
}

::StoreSurvivorLocations <- function ( args )
{
	foreach( survivor in Players.Survivors() )
	{
		if ( survivor.IsOnGround() )
			SessionState.SurvivorWarpLocations[survivor.GetCharacterName()] <- survivor.GetLocation();
	}
}

function Notifications::OnSurvivorsLeftStartArea::SurvivorsLeft()
{
	Timers.AddTimer(5.0, true, StoreSurvivorLocations);
}

function Notifications::OnPlayerVomited::ClearVomit( player, attacker, params )
{
	player.SetNetPropFloat( "m_itTimer.m_timestamp", Time() + 0.1 );
	player.OverrideFriction( 10.0, 2.0 );
}

function Notifications::OnReviveSuccess::RevivedSurvivor( player, reviver, params )
{
	if ( player.IsSurvivor() )
	{
		player.SetRawHealth(100);
		player.SetHealthBuffer(0);
		player.SetReviveCount(0);
		player.SetNetProp("m_isGoingToDie", 0);
		player.SetNetProp("m_bIsOnThirdStrike", 0);
		player.StopSound( "Player.HeartbeatLoop" );
		player.StopSound( "Player.Heartbeat" );
		Timers.AddTimer(0.3, false, StopSurvivorScene, player);
	}
}

function Notifications::OnSpawn::SpecialSpawned( player, params )
{
	if ( player.GetTeam() == INFECTED )
	{
		local health = player.GetHealth() / 2;
		player.SetMaxHealth( health );
		player.SetRawHealth( health );
	}
}

function Notifications::OnDeath::SpecialDeath( player, attacker, params )
{
	if ( !player.IsSurvivor() )
	{
		SessionState.KillSIQueue.rawdelete(player.GetIndex());
	}
}
