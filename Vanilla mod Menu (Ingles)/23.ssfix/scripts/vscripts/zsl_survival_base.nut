//-----------------------------------------------------

Utils.PrecacheModel("models/infected/hulk.mdl");
Utils.PrecacheModel("models/infected/hulk_dlc3.mdl");

IncludeScript("zsl_responserules");

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_AutoReviveFromSpecialIncap = 1
	CommonLimit = 0
	cm_CommonLimit = 0
	cm_MaxSpecials = 12
	cm_DominatorLimit = 12
	cm_SpecialRespawnInterval = 5
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 0
	ShouldAllowSpecialsWithTank = true
	SurvivorMaxIncapacitatedCount = 2
	SurvivalSetupTime = 60

	weaponsToRemove =
	{
		weapon_defibrillator = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_first_aid_kit = 0
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
    }
	
	function ShouldAvoidItem( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return true;
		}
		return false;
	}
}

MutationState <-
{
	ZSLTanksSpawned = 0
	AutoStarted = false
	SurvivorsDied = 0
	FirstSurvivor = null
	SecondSurvivor = null
	ThirdSurvivor = null
	FourthSurvivor = null
	SpacerString = "  "
	EmptyString = ""
	FinalScores = "FINAL SCORES"
	FirstPlace = "1st Place: "
	SecondPlace = "2nd Place: "
	ThirdPlace = "3rd Place: "
	FourthPlace = "4th Place: "
	FirstName = ""
	SecondName = ""
	ThirdName = ""
	FourthName = ""
	FirstScore = 0
	SecondScore = 0
	ThirdScore = 0
	FourthScore = 0
	
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
		if(p)
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
	currentround = 0
	tiedscore = false
	tiedsurvivors = {}
	gameover = false
	score1 = ""
	score2 = ""
	score3 = ""
	score4 = ""
}

function EasyLogic::OnTakeDamage::ZSLDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( (victim.IsSurvivor()) && (attacker.IsSurvivor()) )
	{
		return false;
	}
	return true;
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		SaveTable( "Stats", SurvivorStats );
	}
}

::HealthDecay <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() > 1 )
		{
			survivor.SetRawHealth( survivor.GetRawHealth() - 1 );
			
			if ( Utils.GetMaxIncapCount() == 0 )
			{
				if ( survivor.GetHealth() > 25 && survivor.GetHealth() <= 50 )
					survivor.SetNetProp("m_Glow.m_glowColorOverride", 33023);
				else if ( survivor.GetHealth() <= 25 )
					survivor.SetNetProp("m_Glow.m_glowColorOverride", 255);
			}
		}
	}
}

function Notifications::OnRoundStart::LoadData()
{
	RestoreTable( "Stats", SurvivorStats );
	g_ModeScript.SurvivorStats.currentround++;
	
	if ( g_ModeScript.SurvivorStats.currentround == 4 )
		g_ModeScript.StatHUD.Fields.round.datafunc = @() "Final Round";
	else if ( g_ModeScript.SurvivorStats.currentround >= 5 )
		g_ModeScript.StatHUD.Fields.round.datafunc = @() "Overtime";
	
	if ( SurvivorStats.gameover )
	{
		Utils.RollStatsCrawl();
		Say( null, SurvivorStats.score1, false );
		Say( null, SurvivorStats.score2, false );
		Say( null, SurvivorStats.score3, false );
		Say( null, SurvivorStats.score4, false );
	}
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionOptions.cm_CommonLimit == 0 )
	{
		Utils.RemoveZombieSpawns();
	}
}

::ZSLSpawnTank <- function ( args )
{
	switch ( SessionState.ZSLTanksSpawned )
	{
		case 0:
		{
			Timers.AddTimer(20.0, false, ZSLSpawnTank);
			break;
		}
		case 1:
		{
			Timers.AddTimer(30.0, false, ZSLSpawnTank);
			break;
		}
		case 2:
		{
			Timers.AddTimer(15.0, false, ZSLSpawnTank);
			break;
		}
		case 3:
		{
			Timers.AddTimer(10.0, false, ZSLSpawnTank);
			break;
		}
		case 4:
		{
			Timers.AddTimer(5.0, true, ZSLSpawnTank);
			break;
		}
		default:
			break;
	}
	
	Utils.SpawnZombie( Z_TANK );
	SessionState.ZSLTanksSpawned++;
}

::ZSLAutoStart <- function ( args )
{
	Timers.AddTimer(40.0, false, ZSLSpawnTank);
	Timers.AddTimerByName("HealthDecayTimer", 2.0, true, HealthDecay);
	SessionState.AutoStarted = true;
}

function Notifications::OnRoundStart::ZSLRoundStarted()
{
	Timers.AddTimerByName("SurvivalAutoStartTimer", 60.0, false, ZSLAutoStart);
}

function Notifications::OnSurvivalStart::SurvivalStarted()
{
	Timers.RemoveTimerByName("SurvivalAutoStartTimer");
	if ( !SessionState.AutoStarted )
		ZSLAutoStart( null );
}

function Notifications::OnSurvivorsSpawned::GameStarted( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( !(survivor.GetCharacterName() in SurvivorStats.score) )
			SurvivorStats.score[survivor.GetCharacterName()] <- 0;
		
		if ( SurvivorStats.tiedscore && !SurvivorStats.gameover )
		{
			if ( !(survivor.GetCharacterName() in SurvivorStats.tiedsurvivors) )
			{
				survivor.Kill();
				continue;
			}
		}
		survivor.SetGlowColor(255, 61, 122);
		survivor.SetNetProp("m_Glow.m_iGlowType", 3);
		survivor.Input("DisableLedgeHang");
	}
	HUDSetLayout( g_ModeScript.StatHUD );
	if ( !SurvivorStats.gameover )
		ClientPrint( null, 5, "ZSL: [RULES] Survive longer than the others. *1st to die: 0 pts. *2nd to die: 1 pt. *3rd to die: 2 pts. *Last man standing: 3 pts. Survivor with most points after 4 rounds wins!!", false );
}

function Notifications::OnSpawn::ZSLRandomSIColor( player, params )
{
	if ( player.GetTeam() == INFECTED )
	{
		player.InputColor(RandomInt( 0, 255 ), RandomInt( 0, 255 ), RandomInt( 0, 255 ));
	}
}

function Notifications::OnTankSpawned::ZSLSetTankModel( tank, params )
{
	if ( RandomInt( 0, 1 ) == 1 )
	{
		local TankModels =
		[
			"models/infected/hulk.mdl"
			"models/infected/hulk_dlc3.mdl"
		]
		
		if ( tank.GetModel() == "models/infected/hulk.mdl" || tank.GetModel() == "models/infected/hulk_dlc3.mdl" )
			Utils.RemoveValueFromArray(TankModels, tank.GetModel());
		
		tank.SetModel(Utils.GetRandValueFromArray(TankModels));
	}
}

function Notifications::OnAdrenalineUsed::AdrenalineUsed( player, params )
{
	player.SetRawHealth(100);
	player.SetHealthBuffer(0);
	
	if ( player.GetReviveCount() == 0 )
		player.SetGlowColor(255, 61, 122);
	else if ( player.GetReviveCount() == 1 )
		player.SetNetProp("m_Glow.m_glowColorOverride", 33023);
	else if ( player.GetReviveCount() == 2 )
		player.SetNetProp("m_Glow.m_glowColorOverride", 255);
}

function Notifications::OnHurt::ZSLSurvivorHurt( entity, attacker, params )
{
	if ( !(entity) || !(entity.IsSurvivor()) )
		return;
	
	if ( Utils.GetMaxIncapCount() == 0 )
	{
		if ( entity.GetHealth() > 25 && entity.GetHealth() <= 50 )
		{
			entity.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		}
		else if ( entity.GetHealth() <= 25 )
		{
			entity.SetNetProp("m_Glow.m_glowColorOverride", 255);
		}
	}
}

function Notifications::OnIncapacitated::ReviveSurvivor( victim, attacker, params )
{
	if ( victim.GetType() == Z_SURVIVOR )
		victim.Revive();
}

function Notifications::OnReviveSuccess::RevivedSurvivor( player, reviver, params )
{
	if ( player.IsSurvivor() )
	{
		player.SetRawHealth(100);
		player.SetHealthBuffer(0);
		
		if ( player.GetReviveCount() == 0 )
			player.SetGlowColor(255, 61, 122);
		else if ( player.GetReviveCount() == 1 )
			player.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		else if ( player.GetReviveCount() == 2 )
			player.SetNetProp("m_Glow.m_glowColorOverride", 255);
	}
}

::EndRound <- function ( player )
{
	Utils.ResumeTime();
	player.Kill();
}

::CheckScores <- function ()
{
	if ( g_ModeScript.SurvivorStats.currentround >= 4 )
	{
		local Scores = {};
		foreach ( survivor in Players.Survivors() )
			Scores.rawset( survivor, SurvivorStats.score[survivor.GetCharacterName()] );
		
		local HiScores = [];
		local slot = 0;
		
		while ( Scores.len() > 0 )
		{
			local highestScore = 0;
			local player = null;
			
			foreach( survivor, score in Scores )
			{
				if ( score >= highestScore )
				{
					highestScore = score;
					player = survivor;
				}
			}
			
			HiScores.insert(slot, player);
			Scores.rawdelete(player);
			slot++;
		}
		
		SessionState.FirstScore = SurvivorStats.score[HiScores[0].GetCharacterName()];
		SessionState.FirstName = HiScores[0].GetName();
		SessionState.FirstSurvivor = HiScores[0];
		SessionState.SecondScore = SurvivorStats.score[HiScores[1].GetCharacterName()];
		SessionState.SecondName = HiScores[1].GetName();
		SessionState.SecondSurvivor = HiScores[1];
		SessionState.ThirdScore = SurvivorStats.score[HiScores[2].GetCharacterName()];
		SessionState.ThirdName = HiScores[2].GetName();
		SessionState.ThirdSurvivor = HiScores[2];
		SessionState.FourthScore = SurvivorStats.score[HiScores[3].GetCharacterName()];
		SessionState.FourthName = HiScores[3].GetName();
		SessionState.FourthSurvivor = HiScores[3];
		
		if ( SessionState.FirstScore == SessionState.SecondScore )
		{
			SurvivorStats.tiedsurvivors.rawset( SessionState.FirstSurvivor.GetCharacterName(), true );
			SurvivorStats.tiedsurvivors.rawset( SessionState.SecondSurvivor.GetCharacterName(), true );
			
			if ( SessionState.SecondScore == SessionState.ThirdScore )
				SurvivorStats.tiedsurvivors.rawset( SessionState.ThirdSurvivor.GetCharacterName(), true );
			if ( SessionState.SecondScore == SessionState.FourthScore )
				SurvivorStats.tiedsurvivors.rawset( SessionState.FourthSurvivor.GetCharacterName(), true );
			
			SurvivorStats.tiedscore = true;
		}
		else
		{
			SurvivorStats.gameover = true;
			SurvivorStats.score1 = SessionState.FirstPlace + SessionState.FirstName + " (" + SessionState.FirstScore + ")";
			SurvivorStats.score2 = SessionState.SecondPlace + SessionState.SecondName + " (" + SessionState.SecondScore + ")";
			SurvivorStats.score3 = SessionState.ThirdPlace + SessionState.ThirdName + " (" + SessionState.ThirdScore + ")";
			SurvivorStats.score4 = SessionState.FourthPlace + SessionState.FourthName + " (" + SessionState.FourthScore + ")";
			HUDPlace( HUD_MID_BOX, 0.30, 0.32, 0.44, 0.06 );
			HUDPlace( HUD_RIGHT_BOT, 0.30, 0.32, 0.44, 0.40 );
			HUDPlace( HUD_SCORE_1, 0.38, 0.40, 0.44, 0.06 );
			HUDPlace( HUD_SCORE_2, 0.38, 0.48, 0.44, 0.06 );
			HUDPlace( HUD_SCORE_3, 0.38, 0.56, 0.44, 0.06 );
			HUDPlace( HUD_SCORE_4, 0.38, 0.64, 0.44, 0.06 );
			g_ModeScript.StatHUD.Fields.scores.flags = g_ModeScript.StatHUD.Fields.scores.flags & ~HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.scorebackground.flags = g_ModeScript.StatHUD.Fields.scorebackground.flags & ~HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.score0.flags = g_ModeScript.StatHUD.Fields.score0.flags & ~HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.score1.flags = g_ModeScript.StatHUD.Fields.score1.flags & ~HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.score2.flags = g_ModeScript.StatHUD.Fields.score2.flags & ~HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.score3.flags = g_ModeScript.StatHUD.Fields.score3.flags & ~HUD_FLAG_NOTVISIBLE
		}
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.IsSurvivor() )
	{
		SessionState.SurvivorsDied++;
		victim.SetNetProp("m_Glow.m_glowColorOverride", 0);
		victim.SetNetProp("m_Glow.m_iGlowType", 0);
		EntFire( "survivor_death_model", "BecomeRagdoll" );
		
		foreach( adrenaline in Objects.OfClassname("weapon_adrenaline") )
		{
			if ( adrenaline.GetNetPropEntity( "m_hOwner" ) == null )
				adrenaline.Kill();
		}
		
		if ( SurvivorStats.tiedscore )
		{
			if ( !(victim.GetCharacterName() in SurvivorStats.tiedsurvivors) )
				return;
		}
		
		if ( g_ModeScript.SurvivorStats.currentround == 5 && SessionState.SurvivorsDied < 3 )
			return;
		
		if ( SessionState.SurvivorsDied == 2 )
			SurvivorStats.score[victim.GetCharacterName()] += 1;
		else if ( SessionState.SurvivorsDied == 3 )
		{
			if ( g_ModeScript.SurvivorStats.currentround < 5 )
				SurvivorStats.score[victim.GetCharacterName()] += 2;
			Utils.SlowTime(0.5, 2.0, 1.0, 2.0, false);
			local winMessage = "You've won this round!";
			if ( g_ModeScript.SurvivorStats.currentround >= 4 )
				winMessage = "You've won the match!";
			local winner = Players.AnyAliveSurvivor();
			if ( winner )
			{
				if ( g_ModeScript.SurvivorStats.currentround < 5 )
					SurvivorStats.score[winner.GetCharacterName()] += 3;
				else
					SurvivorStats.score[winner.GetCharacterName()]++;
				winner.ShowHint(winMessage, 5, "icon_alert", "", "255 61 122");
				Timers.AddTimerByName("EndRoundTimer", 5.0, false, EndRound, winner);
			}
		}
		else if ( SessionState.SurvivorsDied == 4 )
		{
			Timers.RemoveTimerByName("EndRoundTimer");
			Utils.ResumeTime();
			CheckScores();
		}
	}
}

function Notifications::OnBotReplacedPlayer::IdleStart( player, bot, params )
{
	player.SetNetProp( "m_Glow.m_iGlowType", 0 );
	
	if ( Utils.GetMaxIncapCount() == 0 )
	{
		if ( bot.GetHealth() > 50 )
			bot.SetGlowColor( 255, 61, 122 );
		else if ( bot.GetHealth() > 25 && bot.GetHealth() <= 50 )
			bot.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		else if ( bot.GetHealth() <= 25 )
			bot.SetNetProp("m_Glow.m_glowColorOverride", 255);
	}
	else
	{
		if ( bot.GetReviveCount() == 0 )
			bot.SetGlowColor( 255, 61, 122 );
		else if ( bot.GetReviveCount() == 1 )
			bot.SetNetProp( "m_Glow.m_glowColorOverride", 33023 );
		else if ( bot.GetReviveCount() == 2 )
			bot.SetNetProp( "m_Glow.m_glowColorOverride", 255 );
	}
	
	if ( bot.IsAlive() )
		bot.SetNetProp( "m_Glow.m_iGlowType", 3 );
}

function Notifications::OnPlayerReplacedBot::IdleEnd( player, bot, params )
{
	bot.SetNetProp( "m_Glow.m_iGlowType", 0 );
	if ( player.IsAlive() )
		player.SetNetProp( "m_Glow.m_iGlowType", 3 );
	if ( player.GetReviveCount() < 2 )
	{
		player.StopSound( "Player.HeartbeatLoop" );
		player.StopSound( "Player.Heartbeat" );
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
				slot = HUD_MID_BOX ,
				datafunc = @() SessionState.FinalScores,
				name = "scores",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			round = 
			{
				slot = HUD_SCORE_TITLE ,
				datafunc = @() "Round " + g_ModeScript.SurvivorStats.currentround,
				name = "round",
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
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOX, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	//HUDSetLayout( StatHUD );
}

function EasyLogic::Update::ZSLThink()
{
	if ( SessionOptions.cm_CommonLimit == 0 && Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
