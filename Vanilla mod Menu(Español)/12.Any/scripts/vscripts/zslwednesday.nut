//-----------------------------------------------------
Msg("Activating Wednesday Night Witching Hour!!\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

IncludeScript("witchinghour");
IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_AllowSurvivorRescue = 0
	CommonLimit = 0
	MaxSpecials = 0
	SmokerLimit = 0
	BoomerLimit = 0
	HunterLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0
	TankLimit = 0
	WitchLimit = 10
	cm_WitchLimit = 10
	SurvivorMaxIncapacitatedCount = 0
	
	DefaultItems =
	[
		"weapon_pistol_magnum"
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
	IsRaceEvent = false
	SaferoomAwardsScore = true
	CurrentStage = -1
	TriggerRescue = false
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

::GiveWeapons <- function( args )
{
	Utils.SanitizeHeldWeapons();
	
	local function GiveRandomWeapon( args )
	{
		local ListOfRandomSMGs = [ "smg", "smg_silenced", "smg_mp5" ];
		local ListOfRandomShotguns = [ "pumpshotgun", "shotgun_chrome" ];
		local ListOfRandomAutoShotguns = [ "autoshotgun", "shotgun_spas" ];
		local ListOfRandomAssaultRifles = [ "rifle", "rifle_ak47", "rifle_desert", "rifle_sg552" ];
		local ListOfRandomSnipers = [ "hunting_rifle", "sniper_military" ];
		
		local randWepSet = RandomInt(0, 4);
		local randWepList = null;
		
		switch( randWepSet )
		{
			case 0:
				randWepList = ListOfRandomSMGs;
				break;
			case 1:
				randWepList = ListOfRandomShotguns;
				break;
			case 2:
				randWepList = ListOfRandomAutoShotguns;
				break;
			case 3:
				randWepList = ListOfRandomAssaultRifles;
				break;
			case 4:
				randWepList = ListOfRandomSnipers;
				break;
			default:
				break;
		}
		
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(randWepList);
			survivor.Give(randWep);
			survivor.Give("pistol_magnum");
		}
	}
	
	local function GiveLaserSight( args )
	{
		foreach (survivor in Players.AliveSurvivors())
		{
			survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
		}
	}
	
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(0.2, false, GiveLaserSight);
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "weapon_molotov", "Kill" );
}

function Notifications::OnSurvivorsSpawned::GiveMolotov( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
		survivor.Give("molotov");
	
	if ( Utils.IsFinale() )
	{
		g_ModeScript.StatHUD.Fields.timer0.flags = g_ModeScript.StatHUD.Fields.timer0.flags | HUD_FLAG_NOTVISIBLE
		HUDPlace( HUD_RIGHT_TOP, 0.0, 0.00, 1.0, 0.045 );
	}
}

::RespawnWitches <- function ( args )
{
	if ( !Utils.IsFinale() )
		HUDManageTimers( 0, TIMER_COUNTDOWN, 120 );
	Utils.SayToAll( "The Witching Hour Has Begun..." );
	SessionOptions.WitchLimit = 10;
	
	if ( !Utils.IsFinale() )
		Timers.AddTimer(120.0, false, KillWitches);
	
	Timers.AddTimerByName("SpawnWitchTimer", 1.0, true, SpawnWitch, Players.RandomAliveSurvivor() );
}

::SpawnWitchesDelay <- function ( args )
{
	RespawnWitches(null);
	SpawnWitch( Players.RandomAliveSurvivor() );
}

function Notifications::OnSurvivorsLeftStartArea::StartTheTimer()
{
	if ( Utils.IsFinale() && SessionState.HasSurvivalFinale )
	{
		Timers.AddTimer(20.0, false, SpawnWitchesDelay);
	}
	else
	{
		RespawnWitches(null);
		SpawnWitch( Players.RandomAliveSurvivor() );
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
			timer0 = 
			{
				slot = HUD_SCORE_TITLE ,
				staticstring = "Witches recalled to the Netherworld in: ",
				name = "timer0",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
			timer = 
			{
				slot = HUD_RIGHT_TOP ,
				staticstring = SessionState.TimerString,
				name = "timer",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
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
			attempts = 
			{
				slot = HUD_LEFT_BOT ,
				datafunc = @() SessionState.Attempts,
				name = "attempts",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
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
	HUDPlace( HUD_RIGHT_TOP, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_LEFT_BOT, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
}
