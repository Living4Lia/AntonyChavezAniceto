//-----------------------------------------------------
Msg("Activating Monday Morning Target Acquired!!\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_AggressiveSpecials = 1
	cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 12
	cm_MaxSpecials = 12
	cm_ProhibitBosses = false
	cm_SpecialRespawnInterval = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SpecialInfectedAssault = true
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	SurvivorMaxIncapacitatedCount = 2
	ShouldAllowSpecialsWithTank = true
	ShouldIgnoreClearStateForSpawn = true
	LockTempo = true

	SmokerLimit = 2
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	ChargerLimit = 2
	WitchLimit = 0
	cm_WitchLimit = 0
	
	DefaultItems =
	[
		//"weapon_rifle_m60",
		"weapon_smg_silenced",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
			return DefaultItems[idx];

		return 0;
	}
}

ZSLState <-
{
	BonusTankDamage = {}
	EventRules = ""
	HasSurvivalFinale = false
	AutoStartFinale = false
	AutoTriggerEvents = false
	VehicleAward = 2
	SaferoomAward = 0
	SaferoomAwardsScore = false
	KillTimerDecreasesScore = true
	TieBreaker = "kills"
	SpittersSpawned = false
	RescueReady = false
	TargetInfo = "Current Target: "
	TargetActive = true
	TargetName = ""
	TargetGlowColor = 0
	CurrentTarget = null
	SetKillTimer = false
	TimerString = "Reach Safety or DIE (-2 points) in: "
	SurvivorWarpLocations = {}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( (attacker) && (victim) )
	{
		if ( victim.IsSurvivor() )
		{
			if ( SessionState.AllowRevive )
			{
				if ( attacker.GetClassname() != "worldspawn" )
				{
					if ( damageTable.DamageType == (damageTable.DamageType | DMG_DROWN) || damageTable.DamageType == (damageTable.DamageType | DMG_FALL) )
					{
						if ( victim.GetCharacterName() in SessionState.SurvivorWarpLocations )
							victim.SetLocation( SessionState.SurvivorWarpLocations[victim.GetCharacterName()] );
						
						return false;
					}
				}
				if ( attacker.IsSurvivor() )
					return false;
			}
		}
	}
	return true;
}

function EasyLogic::OnBash::DisableDamage( attacker, victim )
{
	if ( attacker.GetTeam() == SURVIVORS && victim.GetTeam() == INFECTED )
	{
		return ALLOW_BASH_PUSHONLY;
	}
}

::SpawnSpitters <- function ( args )
{
	foreach(si in Players.Infected())
	{
		si.Input( "Kill" );
	}

	if ( SessionState.RescueReady == true )
		Say( null, "RESCUE HAS ARRIVED! You are no longer invincible. Get to the rescue vehicle or face your extermination.", false );
	else
		Say( null, "TIME IS UP! You are no longer invincible. Get to the rescue vehicle or face your extermination.", false );

	if ( Utils.IsScavengeFinale )
		EntFire( "relay_car_ready", "trigger" )

	SessionState.SpittersSpawned = true;
	SessionState.TargetActive = false;
	SessionState.AllowRevive = false;
	SessionState.TargetName = "N/A";
	SessionOptions.SurvivorMaxIncapacitatedCount = 0;
	SessionOptions.SmokerLimit = 0;
	SessionOptions.BoomerLimit = 0;
	SessionOptions.HunterLimit = 0;
	SessionOptions.SpitterLimit = 5;
	SessionOptions.JockeyLimit = 0;
	SessionOptions.ChargerLimit = 0;

	foreach (survivor in Players.AliveSurvivors())
	{
		survivor.SetHealthBuffer(100);
		survivor.SetHealth(0);
	}
}

::RandomTarget <- function ()
{
	local function GetTargetName( target )
	{
		local InfectedNames =
		{
			Smoker = Z_SMOKER,
			Boomer = Z_BOOMER,
			Hunter = Z_HUNTER,
			Spitter = Z_SPITTER,
			Jockey = Z_JOCKEY,
			Charger = Z_CHARGER,
		}
		
		foreach( name, infectedtype in InfectedNames )
		{
			if ( target == infectedtype )
				return name;
		}
	}
	
	local InfectedTargets =
	[
		Z_SMOKER
		Z_BOOMER
		Z_HUNTER
		Z_SPITTER
		Z_JOCKEY
		Z_CHARGER
	]
	
	if ( SessionState.CurrentTarget != null )
	{
		Utils.RemoveValueFromArray( InfectedTargets, SessionState.CurrentTarget );
		Utils.PlaySoundToAll("Gallery.GnomeFTW"); //Christmas.GiftPickup
	}
	
	local random_target = Utils.GetRandValueFromArray(InfectedTargets);
	SessionState.CurrentTarget = random_target;
	SessionState.TargetName = GetTargetName(random_target);
	SessionState.TargetGlowColor = Utils.SetColor32( RandomInt( 0, 255 ), RandomInt( 0, 255 ), RandomInt( 0, 255 ), 255 );
	
	foreach( infected in Players.Infected() )
	{
		if ( infected.GetType() != Z_TANK && infected.GetNetPropInt( "m_Glow.m_iGlowType" ) > 0 )
			infected.SetNetProp( "m_Glow.m_iGlowType", 0 );
		
		if ( infected.IsAlive() && infected.GetType() == SessionState.CurrentTarget )
		{
			//infected.SetGlowColor( RandomInt( 0, 255 ), RandomInt( 0, 255 ), RandomInt( 0, 255 ) );
			infected.SetNetProp( "m_Glow.m_glowColorOverride", SessionState.TargetGlowColor );
			infected.SetNetProp( "m_Glow.m_iGlowType", 2 );
		}
	}
}

::ReviveFromLedge <- function ( player )
{
	if ( player.IsHangingFromLedge() )
		player.Revive();
}

function Notifications::OnGrabbedLedge::ReviveSurvivor( causer, victim, params )
{
	if ( victim.GetType() == Z_SURVIVOR )
		Timers.AddTimer(0.1, false, ReviveFromLedge, victim);
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

function Notifications::OnSpawn::TargetSpawn( player, params )
{
	if ( ( !player.IsSurvivor() ) && ( player.GetType() == SessionState.CurrentTarget ) )
	{
		player.SetNetProp( "m_Glow.m_glowColorOverride", SessionState.TargetGlowColor );
		player.SetNetProp( "m_Glow.m_iGlowType", 2 );
	}
	
	if ( SessionState.SpittersSpawned && player.GetType() == Z_SPITTER )
		player.SetNetProp( "m_takedamage", 0 );
}

::TankGlow1 <- function ( tank )
{
	tank.SetNetProp( "m_Glow.m_glowColorOverride", 33023 );
}

::TankGlow2 <- function ( tank )
{
	tank.SetNetProp( "m_Glow.m_glowColorOverride", 255 );
	Timers.AddTimer(1.0, false, TankGlow1, tank);
}

function Notifications::OnTankSpawned::TankSpawned( tank, params )
{
	tank.SetNetProp( "m_Glow.m_glowColorOverride", 255 );
	tank.SetNetProp( "m_Glow.m_iGlowType", 3 );
	Timers.AddTimerByName("TankColor1", 1.0, false, TankGlow1, tank);
	Timers.AddTimerByName("TankColor2", 2.0, true, TankGlow2, tank);
	Say( null, "BONUS ROUND!!!! Inflict the most damage to the TANK for 2 bonus points!", false );
	//Say( null, "BONUS ROUND!!!! Kill the TANK for 2 bonus points!", false );
}

function Notifications::OnHurt::TankHurt( entity, attacker, params )
{
	if ( !(entity) || (entity.GetType() != Z_TANK) )
		return;
	
	if ( !(attacker) || (attacker.GetType() != Z_SURVIVOR) )
		return;
	
	local name = attacker.GetCharacterName();
	local index = entity.GetIndex();
	local dmg_health = EasyLogic.GetEventInt(params, "dmg_health");
	
	if ( !(index in SessionState.BonusTankDamage) )
		SessionState.BonusTankDamage[index] <- {};
	if ( !(name in SessionState.BonusTankDamage[index]) )
		SessionState.BonusTankDamage[index][name] <- 0;
	
	SessionState.BonusTankDamage[index][name] += dmg_health;
}

function Notifications::OnDeath::ScorePoints( victim, attacker, params )
{
	if ( !victim.IsSurvivor() && victim.GetNetPropInt( "m_Glow.m_iGlowType" ) > 0 )
		victim.SetNetProp( "m_Glow.m_iGlowType", 0 );
	
	if ( (attacker) && (attacker.IsSurvivor()) )
	{
		if ( victim.GetType() == Z_TANK )
		{
			Timers.RemoveTimerByName("TankColor1");
			Timers.RemoveTimerByName("TankColor2");
			//SurvivorStats.score[attacker.GetCharacterName()] += 2;
			Utils.PlaySoundToAll("WAM.HighScore");
			local index = victim.GetIndex();
			
			if ( index in SessionState.BonusTankDamage )
			{
				local Damage = {};
				foreach ( survivor in Players.Survivors() )
				{
					local name = survivor.GetCharacterName();
					if ( name in SessionState.BonusTankDamage[index] )
						Damage.rawset( survivor, SessionState.BonusTankDamage[index][survivor.GetCharacterName()] );
				}
				
				local MostDamage = [];
				local slot = 0;
				
				while ( Damage.len() > 0 )
				{
					local highestDamage = 0;
					local player = null;
					
					foreach( survivor, score in Damage )
					{
						if ( score >= highestDamage )
						{
							highestDamage = score;
							player = survivor;
						}
					}
					
					MostDamage.insert(slot, player);
					Damage.rawdelete(player);
					slot++;
				}
				
				if ( (MostDamage.len() > 1) && (SessionState.BonusTankDamage[index][MostDamage[0].GetCharacterName()] == SessionState.BonusTankDamage[index][MostDamage[1].GetCharacterName()]) )
				{
					SurvivorStats.score[MostDamage[0].GetCharacterName()] += 5;
					SurvivorStats.score[MostDamage[1].GetCharacterName()] += 5;
				}
				else
					SurvivorStats.score[MostDamage[0].GetCharacterName()] += 10;
				
				SessionState.BonusTankDamage.rawdelete(index);
			}
		}
		if ( SessionState.TargetActive )
		{
			if ( victim.GetType() == SessionState.CurrentTarget )
			{
				SurvivorStats.score[attacker.GetCharacterName()] += 5;
				RandomTarget();
			}
			else
			{
				SurvivorStats.score[attacker.GetCharacterName()]++;
			}
		}
	}
}

function Notifications::OnRescueVehicleReady::RescueReady( campaign, params )
{
	if ( SessionState.SpittersSpawned == false )
	{
		//SpawnSpitters();
		Timers.AddTimer(0.1, false, SpawnSpitters);
		Timers.RemoveTimerByName ( "SpawnSpittersTimer" );
		HUDManageTimers( 0, TIMER_SET, 0 );
		SessionState.RescueReady = true;
	}
}

function Notifications::OnEnterRescueVehicle::SurvivorEscaped( player )
{
	//Intentionally left blank to override function in zsl_base.nut
}

function Notifications::OnRescueVehicleLeaving::RemoveTargetHUD( survivorCount, params )
{
	g_ModeScript.StatHUD.Fields.target.flags = g_ModeScript.StatHUD.Fields.target.flags | HUD_FLAG_NOTVISIBLE
	HUDPlace( HUD_LEFT_BOT, 0.30, 0.32, 0.44, 0.06 );
}

function Notifications::OnRoundStart::DoStuff()
{
	RandomTarget();
	EntFire( "weapon_spawn", "Kill" );
	local time = 360;
	
	if ( Utils.IsScavengeFinale() )
		time = 420;
	
	HUDManageTimers( 0, TIMER_COUNTDOWN, time );
	HUDManageTimers( 0, TIMER_STOP, time );
	
	if ( Utils.GetSurvivorSet() == 2 )
	{
		EntFire( "!bill", "Kill" );
		EntFire( "!francis", "Kill" );
		EntFire( "!louis", "Kill" );
		EntFire( "!zoey", "Kill" );
		EntFire( "info_l4d1_survivor_spawn", "Kill" );
	}
}

::StoreSurvivorLocations <- function ( args )
{
	foreach( survivor in Players.Survivors() )
	{
		if ( survivor.IsOnGround() )
			SessionState.SurvivorWarpLocations[survivor.GetCharacterName()] <- survivor.GetLocation();
	}
}

::ResetSpecialTimers <- function ( args )
{
	Director.ResetSpecialTimers();
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	if ( Utils.IsFinale() )
	{
		local time = 360;
		
		if ( Utils.IsScavengeFinale() )
			time = 420;
		
		HUDManageTimers( 0, TIMER_COUNTDOWN, time );
		Timers.AddTimerByName("SpawnSpittersTimer", time, false, SpawnSpitters);
	}
	else
	{
		HUDManageTimers( 0, TIMER_COUNTDOWN, 360 );
		Timers.AddTimerByName("KillSurvivorTimer", 360.0, false, KillSurvivors);
	}
	
	if ( Utils.IsScavengeFinale() )
	{
		foreach ( gascan in Objects.OfModel("models/props_junk/gascan001a.mdl") )
			gascan.Input( "Kill" );
		
		EntFire( "weapon_scavenge_item_spawn", "Kill" );
		EntFire( "gas_nozzle", "Kill" );
		EntFire( "game_scavenge_progress_display", "Kill" );
	}
	Timers.AddTimer(5.0, true, StoreSurvivorLocations);
	Timers.AddTimer(1.0, true, ResetSpecialTimers);
}

function Notifications::OnSurvivorsSpawned::GiveLasers( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
	}
}

::SetKillTimer <- function ( player )
{
	if ( !player.IsInCheckpoint() )
		return;
	
	if ( !SessionState.SetKillTimer && HUDReadTimer(0) > 60 )
	{
		Timers.RemoveTimerByName("KillSurvivorTimer");
		HUDManageTimers( 0, TIMER_COUNTDOWN, 60 );
		Timers.AddTimer(60.0, false, KillSurvivors);
		SessionState.SetKillTimer = true;
	}
}

function Notifications::OnEnterSaferoom::EnterSaferoom( player, params )
{
	if ( player.IsSurvivor() )
	{
		Timers.AddTimer(0.2, false, SetKillTimer, player);
	}
}

function SetupModeHUD()
{
	StatHUD <-
	{
		Fields =
		{
			scores = 
			{
				slot = HUD_LEFT_BOT ,
				datafunc = @() SessionState.FinalScores,
				name = "scores",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			target = 
			{
				slot = HUD_MID_BOX ,
				datafunc = @() SessionState.TargetInfo + SessionState.TargetName,
				name = "target",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			timer = 
			{
				slot = HUD_SCORE_TITLE ,
				staticstring = SessionState.TimerString,
				name = "timer",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
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
			scorebackground = 
			{
				slot = HUD_RIGHT_BOT ,
				datafunc = @() SessionState.EmptyString,
				name = "scorebackground",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER,
			}
			score0 = 
			{
				slot = HUD_SCORE_1 ,
				datafunc = @() SessionState.FirstPlace + SessionState.FirstName + SessionState.SpacerString + "(" + SessionState.FirstScore + ")",
				name = "score0",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			score1 = 
			{
				slot = HUD_SCORE_2 ,
				datafunc = @() SessionState.SecondPlace + SessionState.SecondName + SessionState.SpacerString + "(" + SessionState.SecondScore + ")",
				name = "score1",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			score2 = 
			{
				slot = HUD_SCORE_3 ,
				datafunc = @() SessionState.ThirdPlace + SessionState.ThirdName + SessionState.SpacerString + "(" + SessionState.ThirdScore + ")",
				name = "score2",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			score3 = 
			{
				slot = HUD_SCORE_4 ,
				datafunc = @() SessionState.FourthPlace + SessionState.FourthName + SessionState.SpacerString + "(" + SessionState.FourthScore + ")",
				name = "score3",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
		}
	}
	
	if ( Utils.IsFinale() )
	{
		if ( Utils.IsScavengeFinale() )
			StatHUD.Fields.timer.staticstring = "Reach Escape Vehicle or ELSE in: ";
		else
			StatHUD.Fields.timer.staticstring = "Rescue Arrives in: ";
	}
	
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOX, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_LEFT_BOT, 0.0, 0.04, 1.0, 0.045 );
}
