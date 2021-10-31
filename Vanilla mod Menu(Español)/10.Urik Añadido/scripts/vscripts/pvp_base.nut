//-----------------------------------------------------

MutationOptions <-
{
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	cm_NoSurvivorBots = 1
	PreferredSpecialDirection = SPAWN_BEHIND_SURVIVORS
	SurvivorMaxIncapacitatedCount = 0
	
	SmokerLimit = 0
	BoomerLimit = 0
	HunterLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	
	weaponsToRemove =
	{
		weapon_pistol = 0
		weapon_pistol_magnum = 0
		weapon_smg = 0
		weapon_pumpshotgun = 0
		weapon_autoshotgun = 0
		weapon_rifle = 0
		weapon_hunting_rifle = 0
		weapon_smg_silenced = 0
		weapon_shotgun_chrome = 0
		weapon_rifle_desert = 0
		weapon_sniper_military = 0
		weapon_shotgun_spas = 0
		weapon_grenade_launcher = 0
		weapon_rifle_ak47 = 0
		weapon_smg_mp5 = 0
		weapon_rifle_sg552 = 0
		weapon_sniper_awp = 0   
		weapon_sniper_scout = 0
		weapon_rifle_m60 = 0
		weapon_melee = 0
		weapon_chainsaw = 0
		weapon_pipe_bomb = 0
		weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		upgrade_item = 0
		ammo = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
			return false;
		
		return true;
	}
}

MutationState <-
{
	StartedMatch = false
	PlayerInit = {}
	SpawnProtection = {}
	SurvivorIsSafe = {}
	AllowDeath = true
	SaveTables = false
	FinalRound = "FINAL ROUND"
	RoundInfo = "Round: "
	RoundActive = true
	AliveSurvivors = 4
	SurvivorDied = false
	FirstSurvivor = null
	SecondSurvivor = null
	ThirdSurvivor = null
	FourthSurvivor = null
	SpacerString = "  "
	FinalScores = "FINAL SCORES"
	FirstPlace = "1st Place: "
	SecondPlace = "2nd Place: "
	ThirdPlace = "3rd Place: "
	FourthPlace = "4th Place: "
	FirstName = null
	SecondName = null
	ThirdName = null
	FourthName = null
	FirstScore = 0
	SecondScore = 0
	ThirdScore = 0
	FourthScore = 0
	CoachPosition = ""
	EllisPosition = ""
	NickPosition = ""
	RochellePosition = ""
	EmptyString = ""
	
	function DisplayName(ind)
	{
		local p = GetPlayerFromCharacter(ind)
		if(p)
		{
			return (p.GetPlayerName())
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
			return (SurvivorStats.kills[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

::SurvivorStats <-
{
	kills = {}
	deaths = {}
}

::RoundState <-
{
	currentround = 0
	currentplayers = {}
}

::StatHUD <-
{
	Fields =
	{
		round = 
		{
			slot = HUD_SCORE_TITLE ,
			datafunc = @() SessionState.FinalScores,
			name = "round",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
		}
		timer = 
		{
			slot = HUD_MID_BOX ,
			staticstring = "Round Will End In: ",
			name = "timer",
			flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			special = HUD_SPECIAL_TIMER0
		}
		name0 = 
		{
			slot = HUD_FAR_LEFT ,
			datafunc = @() SessionState.DisplayName(0) + SessionState.SpacerString + "(" + SessionState.DisplayScore(0) + ")",
			name = "name0",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		name1 = 
		{
			slot = HUD_MID_TOP ,
			datafunc = @() SessionState.DisplayName(1) + SessionState.SpacerString + "(" + SessionState.DisplayScore(1) + ")",
			name = "name1",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		name2 = 
		{
			slot = HUD_FAR_RIGHT ,
			datafunc = @() "(" + SessionState.DisplayScore(2) + ")" + SessionState.SpacerString + SessionState.DisplayName(2),
			name = "name2",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
		}
		name3 = 
		{
			slot = HUD_MID_BOT ,
			datafunc = @() "(" + SessionState.DisplayScore(3) + ")" + SessionState.SpacerString + SessionState.DisplayName(3),
			name = "name3",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
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

Utils.PrecacheSurvivors();

function EasyLogic::OnScriptStart::PVPScriptStart()
{
	RestoreTable( "Stats", SurvivorStats );
	RestoreTable( "RoundData", RoundState );
}

function EasyLogic::OnGameplayStart::SetupData( modename, mapname )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( !(survivor.GetCharacterName() in SurvivorStats.kills) )
			SurvivorStats.kills[survivor.GetCharacterName()] <- 0;
		if ( !(survivor.GetCharacterName() in SurvivorStats.deaths) )
			SurvivorStats.deaths[survivor.GetCharacterName()] <- 0;
		SessionState.SpawnProtection[survivor.GetCharacterName()] <- false;
	}
}

function EasyLogic::OnTakeDamage::PVPDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if (!attacker)
		return;
	
	if ( SessionState.RoundActive && SessionState.ModeName != "sole" )
	{
		if ( attacker.IsSurvivor() && victim.IsSurvivor() )
		{
			if ( attacker.GetSurvivorCharacter() == victim.GetSurvivorCharacter() )
				return false;
			if ( SessionState.SpawnProtection[victim.GetCharacterName()] == true )
				return false;
			else
				ScriptedDamageInfo.DamageDone = 100;
		}
	}
	
	return true;
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		if ( SessionState.SaveTables )
		{
			SaveTable( "Stats", SurvivorStats );
			SaveTable( "RoundData", RoundState );
		}
	}
	else if ( reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION )
	{
		if ( nextmap != Utils.GetNextMap() )
			return;
		
		SaveTable( "Stats", SurvivorStats );
		SaveTable( "RoundData", RoundState );
	}
}

// List of weapons that can be given when survs leave safe area
::ListOfRandomWeps <-
[
	"smg"
	"smg_silenced"
	"pumpshotgun"
	"shotgun_chrome"
	"autoshotgun"
	"shotgun_spas"
	"rifle"
	"rifle_ak47"
	"rifle_desert"
	"hunting_rifle"
	"sniper_military"
]

::GiveWeapons <- function( args )
{
	printf("Changing Weapons") // printf will automatically add \n to the end
	
	// Sanitizing weapons usually takes 1 game frame (because EntFire
	// sends inputs which are processed the next game frame).
	Utils.SanitizeHeldPrimary();
	
	// Thus, we can't sanitize weapons AND give the players weapons on the same game frame.
	// So what we need to do is add a small delay before giving them new weapons.
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
			survivor.Give(randWep);
		}
	}
	
	local function GiveLaserSight( args )
	{
		// Give each survivor a laser sight
		foreach (survivor in Players.AliveSurvivors())
		{
			survivor.GiveUpgrade( g_MapScript.UPGRADE_LASER_SIGHT );
		}
	}
	
	// A 0.1 second delay is wayyy more than enough time after sanitizing weapons
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(0.3, false, GiveLaserSight); //0.2
}

::GiveItems <- function( args )
{
	Utils.SanitizeHeldSecondary();
	
	local function GiveItem( args )
	{
		// Give each survivor a magnum
		foreach (survivor in Players.AliveSurvivors())
		{
			survivor.Give("pistol_magnum");
		}
	}
	
	// A 0.1 second delay is wayyy more than enough time after sanitizing weapons
	Timers.AddTimer(0.1, false, GiveItem);
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::LockDoor <- function ( args )
{
	EntFire( "prop_door_rotating_checkpoint", "SetSpeed", "0" );
}

::EndGame <- function ( args )
{
	Convars.SetValue( "sv_permawipe", "1" );
	foreach( survivor in Players.AliveSurvivors() )
		survivor.Kill();
}

::EndRound <- function ( args )
{
	SessionState.RoundActive = false;
	Convars.SetValue( "director_no_death_check", "0" );
	g_ModeScript.RemoveHUD();
	g_ModeScript.DisplayScores();
	Timers.AddTimer(15.0, false, EndGame);
}

::EnableGlows <- function ( args )
{
	EntFire( "player", "SetGlowEnabled", "1" );
	Timers.RemoveTimerByName( "HealthRegenTimer" );
	g_ModeScript.StatHUD.Fields.timer.flags = g_ModeScript.StatHUD.Fields.timer.flags | g_ModeScript.HUD_FLAG_NOTVISIBLE

	foreach (survivor in Players.AliveSurvivors())
	{
		survivor.SetHealthBuffer(100);
		survivor.SetHealth(0);
	}
}

::TeleportToStart <- function ( args )
{
	local random_spawn = null;
	random_spawn = RandomInt( 0, 11 );
	if ( random_spawn == 0 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
	}
	else if ( random_spawn == 1 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
	}
	else if ( random_spawn == 2 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
	}
	else if ( random_spawn == 3 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
	}
	else if ( random_spawn == 4 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
	}
	else if ( random_spawn == 5 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
	}
	else if ( random_spawn == 6 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
	}
	else if ( random_spawn == 7 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
	}
	else if ( random_spawn == 8 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
	}
	else if ( random_spawn == 9 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
	}
	else if ( random_spawn == 10 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
	}
	else if ( random_spawn == 11 )
	{
		EntFire( "!coach", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_1" );
		EntFire( "!ellis", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_4" );
		EntFire( "!nick", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_3" );
		EntFire( "!rochelle", "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_2" );
	}
	EntFire( "!coach", "ReleaseFromSurvivorPosition" );
	EntFire( "!ellis", "ReleaseFromSurvivorPosition" );
	EntFire( "!nick", "ReleaseFromSurvivorPosition" );
	EntFire( "!rochelle", "ReleaseFromSurvivorPosition" );
}

::DisableGlow <- function ( player )
{
	player.Input( "SetGlowEnabled", "0" );
}

::DisableSpawnProtection <- function ( player )
{
	SessionState.SpawnProtection[player.GetCharacterName()] = false;
	player.Input( "Alpha", "255" );
}

::StopSurvivorScene <- function ( args )
{
	EntFire( "player", "CancelCurrentScene" );
}

::RevivePlayer <- function ( player )
{
	player.Defib();
	local random_spawn = RandomInt( 1, 4 );
	player.Input( "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_" + random_spawn.tostring() );
	player.Input( "ReleaseFromSurvivorPosition" );
	player.Input( "DisableLedgeHang" );
	player.Input( "SetGlowEnabled", "0" );
	SessionState.SpawnProtection[player.GetCharacterName()] = true;
	player.Input( "Alpha", "155" );
	Timers.AddTimer(5.0, false, DisableSpawnProtection, player);
}

::GetCurrentPlayers <- function ()
{
	return RoundState.currentplayers.len();
}

function Notifications::OnPlayerLeft::DetectPlayers( player, name, SteamID, params )
{
	if ( (player.IsHuman()) && (SteamID in RoundState.currentplayers) )
		RoundState.currentplayers.rawdelete(SteamID);
}

function Notifications::OnPlayerJoined::DetectPlayers( player, name, IPAddress, SteamID, params )
{
	if ( (player.IsHuman()) && !(SteamID in RoundState.currentplayers) )
		RoundState.currentplayers.rawset( SteamID, true );
}

function Notifications::OnEnterSaferoom::SurvivorIsSafe( player, params )
{
	if ( player.IsSurvivor() )
		SessionState.SurvivorIsSafe[player.GetCharacterName()] <- true;
}

function Notifications::OnLeaveSaferoom::SurvivorIsNotSafe( player, params )
{
	if ( player.IsSurvivor() )
		SessionState.SurvivorIsSafe[player.GetCharacterName()] <- false;
}

function Notifications::OnItemPickup::PickedUpItem( player, classname, params )
{
	player.Input( "CancelCurrentScene" );
}

function Notifications::OnWeaponFire::FiredWeapon( player, classname, params )
{
	if ( player.IsSurvivor() )
	{
		SessionState.SpawnProtection[player.GetCharacterName()] = false;
		player.Input( "Alpha", "255" );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( SessionState.RoundActive == true )
	{
		Timers.AddTimer(0.1, false, StopSurvivorScene);
		if ( victim.IsSurvivor() )
		{
			Timers.AddTimer(5.0, false, RevivePlayer, victim);
			if ( SessionState.AllowDeath )
				SurvivorStats.deaths[victim.GetCharacterName()]++;
			
			if ( attacker.GetSurvivorCharacter() == victim.GetSurvivorCharacter() )
				SurvivorStats.kills[attacker.GetCharacterName()]--;
			else
				SurvivorStats.kills[attacker.GetCharacterName()]++;
		}
	}
}

::BeginMatch <- function ()
{
	SessionState.RoundActive = true;
	SessionState.StartedMatch = true;
	HUDManageTimers( 0, TIMER_COUNTDOWN, 600 );
	Timers.AddTimer(600.0, false, EndRound);
	Timers.AddTimerByName("StopSurvivorSceneTimer", 0.1, true, StopSurvivorScene);
	Say( null, "(Rules) Point gun, pull trigger, hit target, kill target, get point!", false );
}

::PlayerInit <- function ( player )
{
	SessionState.PlayerInit[player.GetCharacterName()] <- true;
	
	if ( !(player.GetCharacterName() in SurvivorStats.kills) )
		SurvivorStats.kills[player.GetCharacterName()] <- 0;
	if ( !(player.GetCharacterName() in SurvivorStats.deaths) )
		SurvivorStats.deaths[player.GetCharacterName()] <- 0;
	SessionState.SpawnProtection[player.GetCharacterName()] <- false;
	
	Timers.AddTimer(0.5, false, TeleportToStart);
	EntFire( "player", "DisableLedgeHang" );
	EntFire( "player", "SetGlowEnabled", "0" );
	player.SetHealthBuffer( 0 );
	player.SetHealth( 100 );
	
	if ( !SessionState.StartedMatch && GetCurrentPlayers() == Utils.GetNumberOfSurvivorsAlive() )
		BeginMatch();
	
	if ( player.GetSurvivorCharacter() == NICK )
		StatHUD.Fields.name0.flags = StatHUD.Fields.name0.flags & ~HUD_FLAG_NOTVISIBLE
	else if ( player.GetSurvivorCharacter() == ROCHELLE )
		StatHUD.Fields.name1.flags = StatHUD.Fields.name1.flags & ~HUD_FLAG_NOTVISIBLE
	else if ( player.GetSurvivorCharacter() == COACH )
		StatHUD.Fields.name2.flags = StatHUD.Fields.name2.flags & ~HUD_FLAG_NOTVISIBLE
	else if ( player.GetSurvivorCharacter() == ELLIS )
		StatHUD.Fields.name3.flags = StatHUD.Fields.name3.flags & ~HUD_FLAG_NOTVISIBLE
}

function Notifications::OnSpawn::TeleportToSpawn( player, params )
{
	if ( player.IsSurvivor() && !(player.GetCharacterName() in SessionState.PlayerInit) )
		PlayerInit( player );
}

function Notifications::OnPlayerConnected::TeleportToSpawn( player, params )
{
	if ( player.IsSurvivor() && !(player.GetCharacterName() in SessionState.PlayerInit) )
		PlayerInit( player );
}

function Notifications::OnPlayerVomited::EnableTemporaryGlow( victim, boomer, params )
{
	if ( victim.IsSurvivor() )
	{
		victim.Input( "SetGlowEnabled", "1" );
		Timers.AddTimer(20.0, false, DisableGlow, victim);
	}
}

function Notifications::OnRoundStart::GetCurrentRound()
{
	RoundState.currentround++;
}

function Notifications::OnRoundStart::DoStuff()
{
	Utils.RemoveZombieSpawns();
	foreach(gascan in Objects.OfModel("models/props_junk/gascan001a.mdl"))
		gascan.Kill();
	foreach(propanetank in Objects.OfModel("models/props_junk/propanecanister001a.mdl"))
		propanetank.Kill();
	foreach(oxygentank in Objects.OfModel("models/props_equipment/oxygentank01.mdl"))
		oxygentank.Kill();
	foreach(fireworkcrate in Objects.OfModel("models/props_junk/explosive_box001.mdl"))
		fireworkcrate.Kill();
	
	EntFire( "prop_door_rotating_checkpoint", "Close" );
	Timers.AddTimer(1.0, false, LockDoor);
	
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "prop_minigun", "Kill" );
	EntFire( "prop_minigun_l4d1", "Kill" );
	EntFire( "prop_mounted_machine_gun", "Kill" );
	EntFire( "relay_intro_start", "Kill" );
	EntFire( "relay_intro_finished", "Trigger" );
	EntFire( "func_orator", "Kill" );
	EntFire( "logic_choreographed_scene", "Kill" );
	EntFire( "info_remarkable", "Kill" );
	
	local Ladder = null;
	
	if ( SessionState.MapName == "c1m4_atrium" )
	{
		EntFire( "relay_spawncans", "Trigger", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "navblock_coop", "BlockNav", "", 1 );
	}
	else if ( SessionState.MapName == "c2m1_highway" )
	{
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c2m2_fairgrounds" )
	{
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "coop_nav_blocker", "BlockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c2m3_coaster" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c2m4_barns" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c2m5_concert" )
	{
		EntFire( "item_spawn_sets_case", "PickRandom", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "stadium_exit_left_physicsblocker", "Disable", "", 1 );
	}
	else if ( SessionState.MapName == "c3m1_plankcountry" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
	}
	else if ( SessionState.MapName == "c3m3_shantytown" )
	{
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c3m4_plantation" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "mansion_resources_case", "PickRandom", "", 1 );
	}
	else if ( SessionState.MapName == "c4m1_milltown_a" )
	{
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c4m2_sugarmill_a" )
	{
		EntFire( "survival_block_nav", "UnblockNav", "", 0 );
		EntFire( "nav_blocker_scavenge", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c4m3_sugarmill_b" )
	{
		EntFire( "survival_block_nav", "UnblockNav", "", 0 );
		EntFire( "nav_blocker_scavenge", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c4m4_milltown_b" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c4m5_milltown_escape" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "relay_storm_blendout", "Kill" );
		EntFire( "relay_storm_start", "Trigger" );
	}
	else if ( SessionState.MapName == "c5m1_waterfront" )
	{
		EntFire( "director_panic_relay", "Enable", "", 0 );
		EntFire( "survival_navblocker", "UnblockNav", "", 0 );
		EntFire( "coop_navblocker", "BlockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c5m2_park" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "navblock_coop", "BlockNav", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c5m3_cemetery" )
	{
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(4216, 343, -131), 1 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6173, -4579, 382), 1 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c5m4_quarter" )
	{
		EntFire( "survivor_nav_blocker1", "UnblockNav", "", 0 );
		EntFire( "coop_navblocker", "BlockNav", "", 0 );
		EntFire( "landing_blocker", "Enable" );
	}
	else if ( SessionState.MapName == "c5m5_bridge" )
	{
		EntFire( "relay_coop", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c6m1_riverbank" )
	{
		EntFire( "ldq_caralarm", "HowAngry", "", 1 );
		EntFire( "bridewitch", "SpawnZombie", "", 0.1 );
		EntFire( "navblock_coop", "BlockNav", "", 0 );
		EntFire( "ldq_tier1_weapons", "HowAngry", "", 0 );
		EntFire( "case_spawn_chests", "PickRandomShuffle", "", 0 );
		EntFire( "case_spawn_chests", "PickRandomShuffle", "", 0.1 );
		EntFire( "ldq_tier2_weapons", "HowAngry", "", 0 );
		EntFire( "ldq_any_a_weapons", "HowAngry", "", 0 );
		EntFire( "door_bar", "Lock", "", 0 );
		EntFire( "scavenge_shortcut_block", "BlockNav", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "survival_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "navblock_coop", "BlockNav", "", 0 );
		EntFire( "prop_coop", "Enable", "", 0 );
		EntFire( "door_bar", "Lock", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c6m2_bedlam" )
	{
		EntFire( "trigger_bus", "Enable", "", 0 );
		EntFire( "case_chest", "PickRandomShuffle", "", 0 );
		EntFire( "case_chest", "PickRandomShuffle", "", 0.5 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(808, 5040, -1026), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c6m3_port" )
	{
		EntFire( "info_l4d1_survivor_spawn", "Kill", "", 0 );
		EntFire( "l4d1_survivors_relay", "Kill", "", 0 );
		EntFire( "l4d1_teleport_relay", "Kill", "", 0 );
		EntFire( "l4d1_script_relay", "Kill", "", 0 );
		EntFire( "francis_outro", "Kill", "", 0 );
		EntFire( "louis_outro", "Kill", "", 0 );
		EntFire( "zoey_outro", "Kill", "", 0 );
		EntFire( "relay_swappedcoop_setup", "Trigger", "", 0 );
		EntFire( "relay_coop", "Trigger", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
	}
	else if ( SessionState.MapName == "c7m1_docks" )
	{
		EntFire( "items_coop_delete", "Kill", "", 0 );
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "traincar_navblocker", "Kill", "", 0 );
		EntFire( "boat03_sbcollision", "Kill", "", 0 );
		EntFire( "boat01_sbcollision", "Kill", "", 0 );
		EntFire( "versus_tank", "Disable", "", 0 );
		EntFire( "barrel_picker1", "PickRandom", "", 0 );
		EntFire( "boat01_sbblocker", "UnblockNav", "", 0 );
		EntFire( "boat03_sbblocker", "UnblockNav", "", 0 );
		EntFire( "boat01_sbblocker_top", "BlockNav", "", 0 );
		EntFire( "boat03_sbblocker_top", "BlockNav", "", 0 );
		EntFire( "tankdooroutnavblocker", "BlockNav", "", 0 );
		EntFire( "tankdoorinnavblocker", "BlockNav", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(8784, 929, 21.4885), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c7m2_barge" )
	{
		EntFire( "car_alarm_spawner", "PickRandom", "", 0 );
		EntFire( "barrel_picker1", "PickRandom", "", 0 );
		EntFire( "scavenge_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "scavenge_ladder_nav", "BlockNav", "", 0 );
		EntFire( "boat_blocker", "Enable", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6064, 817, 127), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(5373, 734, 127), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c7m3_port" )
	{
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "survival_button_model", "Kill", "", 0 );
		EntFire( "survival_button", "Kill", "", 0 );
		EntFire( "survival_message", "Kill", "", 0 );
		EntFire( "tank_spawner_versus_relay", "Kill", "", 0 );
		EntFire( "door_nav_blocker", "UnblockNav", "", 0 );
		EntFire( "director_panic_relay", "Enable", "", 0 );
		EntFire( "InstanceAuto1-director_panic_relay", "Enable", "", 0 );
	}
	else if ( SessionState.MapName == "c8m1_apartment" )
	{
		EntFire( "scavenge_blocker", "UnblockNav", "", 0 );
		EntFire( "template_clock1", "ForceSpawn" );
	}
	else if ( SessionState.MapName == "c8m2_subway" )
	{
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "door_blocker", "Enable" );
	}
	else if ( SessionState.MapName == "c8m3_sewers" )
	{
		EntFire( "warehouse_door", "SetDamageFilter", "warehouse_door_filter" );
		EntFire( "office_basement_gate", "Open" );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(14128, 8007, -386), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c8m4_interior" )
	{
		EntFire( "fx_rain_trickle_01", "Stop", "", 0 );
		EntFire( "fx_rain_trickle_02", "Stop", "", 0 );
		EntFire( "fx_rain_trickle_03", "Stop", "", 0 );
	}
	else if ( SessionState.MapName == "c8m5_rooftop" )
	{
		EntFire( "survival_kill", "Trigger", "", 0 );
		EntFire( "pilot_radio_getin_case", "Kill", "", 0 );
	}
	else if ( SessionState.MapName == "c9m1_alleys" )
	{
		EntFire( "holdout_items", "Kill", "", 0 );
		EntFire( "coop_nav", "UnblockNav", "", 0 );
		EntFire( "holdout_nav", "BlockNav", "", 0 );
		EntFire( "versus_doorblockers", "Kill", "", 0 );
		EntFire( "survivorPos_survival_01", "Kill", "", 0 );
		EntFire( "survivorPos_survival_02", "Kill", "", 0 );
		EntFire( "survivorPos_survival_03", "Kill", "", 0 );
		EntFire( "survivorPos_survival_04", "Kill", "", 0 );
		EntFire( "scavenge_wall", "Kill", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
		EntFire( "props_scavenge", "Kill", "", 1 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(-5615, -10232, 9), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(-5152 -10232 9), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c9m2_lots" )
	{
		EntFire( "versus_doorblockers", "Kill", "", 0 );
		EntFire( "survival_start", "Kill", "", 0 );
		EntFire( "survival_start_relay", "Kill", "", 0 );
		EntFire( "survival_items", "Kill", "", 0 );
		EntFire( "door_breakable01", "Break", "", 0 );
		EntFire( "door_breakable03", "Break", "", 0 );
		EntFire( "door_breakable05", "Break", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6208, 6954, 38), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6078, 6589, 38), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c10m1_caves" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		EntFire( "coop_trigger", "Trigger", "", 0 );
	}
	else if ( SessionState.MapName == "c10m2_drainage" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
	}
	else if ( SessionState.MapName == "c10m3_ranchhouse" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c11m1_greenhouse" )
	{
		EntFire( "coop_trigger", "Enable", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(2876, 1281, 465), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(2872, 1153, 553), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c11m3_garage" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
	}
	else if ( SessionState.MapName == "c11m4_terminal" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
		EntFire( "breakwall04_illusionary", "Kill", "", 0 );
		EntFire( "breakwall04_inside", "Kill", "", 0 );
		EntFire( "breakwall04_outside", "Kill", "", 0 );
		EntFire( "breakwall04_filler", "Kill", "", 0 );
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c11m5_runway" )
	{
		EntFire( "coop_item_delete", "Kill", "", 0 );
	}
	else if ( SessionState.MapName == "C12m1_hilltop" )
	{
		EntFire( "coop_trigger", "Enable", "", 0 );
	}
	else if ( SessionState.MapName == "c12m5_cornfield" )
	{
		EntFire( "navblock_scavenge", "UnblockNav", "", 0 );
	}
	else if ( SessionState.MapName == "c13m1_alpinecreek" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "scene_relay", "Kill", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(1064, 231, 642), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(873, 2237, 541), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c13m2_southpinestream" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "tank_versus", "Kill", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(674, 2698, 261), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(2006, 2132, 500), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(3904, 1945, 416), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(7919.11, 3329.99, 432), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c13m3_memorialbridge" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "point_hurt", "TurnOn" );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(1837, -4515, 1176), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
	else if ( SessionState.MapName == "c13m4_cutthroatcreek" )
	{
		EntFire( "info_remarkable", "Kill", "", 0 );
		EntFire( "tank_versus", "Kill", "", 0 );
		
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(-3865, -5602, 192), 10 ) ) != null )
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
	}
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	if ( SessionState.MapName == "c8m4_interior" || SessionState.MapName == "c4m2_sugarmill_a" || SessionState.MapName == "c4m3_sugarmill_b" )
		EntFire( "func_button", "Kill" ); //experiment
	if ( Entities.FindByClassname( null, "trigger_finale" ) )
		EntFire( "func_button", "Kill" );
	
	EntFire( "gunshop_door_button", "Kill" );
	EntFire( "gunshop_door_01", "Unlock" );
	EntFire( "gunshop_door_01", "Open" );
	EntFire( "gunshop_door_01", "SetBreakable" );
	EntFire( "tanker_destroy_relay", "Trigger" );
	EntFire( "whitaker_relay", "Trigger" );
	EntFire( "carousel_start_relay", "Trigger" );
	EntFire( "carousel_gate_relay", "Trigger" );
	EntFire( "carousel_game_event", "Kill" );
	EntFire( "carousel_gate_button_model", "SetAnimation", "on" );
	EntFire( "carousel_gate_button_model", "StopGlowing" );
	EntFire( "carousel_gate_button_sound", "PlaySound" );
	EntFire( "carousel_instruct_timer", "Kill" );
	EntFire( "carousel_gate_button", "Kill" );
	EntFire( "carousel_button2_relay", "Trigger" );
	//EntFire( "relay_start_onslaught", "Trigger" );
	EntFire( "minifinale_gates_slide_door", "Open" );
	EntFire( "ticketbooth_hint", "Kill" );
	EntFire( "stadium_entrance_door_relay", "Trigger" );
	EntFire( "minifinale_gates_sound", "PlaySound" );
	EntFire( "ferry_button_stick_relay", "Trigger" );
	EntFire( "bridge_button", "Press" );
	EntFire( "button_callelevator", "Press" );
	EntFire( "relay_car_ready", "Trigger" );
	EntFire( "finale_cleanse_entrance_door", "Lock" );
	EntFire( "finale_cleanse_exit_door", "Unlock" );
	EntFire( "ceda_trailer_canopen_frontdoor_listener", "Kill" );
	EntFire( "finale_cleanse_backdoors_blocker", "Kill" );
	EntFire( "finale_end_doors_left", "Open" );
	EntFire( "finale_end_doors_right", "Open" );
	EntFire( "tractor_start_relay", "Trigger" );
	EntFire( "filter_generator", "TestActivator" );
	EntFire( "elevator", "MoveToFloor", "bottom" );
	EntFire( "elevator_pulley", "Start" );
	EntFire( "elevator_pulley2", "Start" );
	EntFire( "elevbuttonoutsidefront", "Skin", "1" );
	EntFire( "sound_elevator_startup", "PlaySound" );
	EntFire( "elevator_start_shake", "StartShake" );
	EntFire( "elevator_number_relay", "Trigger" );
	EntFire( "elevator_breakwalls*", "Kill" );
	EntFire( "elevator_game_event", "Kill" );
	EntFire( "button_minifinale", "Press" );
	EntFire( "relay_enable_chuch_zombie_loop", "Trigger" );
	EntFire( "train_engine_button", "Press" );
	EntFire( "tankdoorin", "Unlock" );
	EntFire( "tankdoorin", "Open" );
	EntFire( "tankdoorin_button", "Kill" );
	EntFire( "tankdoorout", "Unlock" );
	EntFire( "tankdoorout", "Open" );
	EntFire( "tankdoorout_button", "Kill" );
	EntFire( "tank_sound_timer", "Kill" );
	EntFire( "radio_fake_button", "Press" );
	EntFire( "drawbridge", "MoveToFloor", "bottom" );
	EntFire( "drawbridge_start_sound", "PlaySound" );
	EntFire( "startbldg_door_button", "Press" );
	EntFire( "startbldg_door", "Open" );
	EntFire( "stage_lights_button", "Press" );
	EntFire( "carousel_gate_button_sound", "Kill" );
	EntFire( "carousel2_game_event", "Kill" );
	EntFire( "finale_alarm_sound", "Kill" );
	EntFire( "door_sliding", "Open" ); //c8m2 and c8m3
	EntFire( "prop_gate_coaster", "SetAnimation", "close" );
	EntFire( "prop_gate_coaster", "SetAnimation", "idle_close", 1.50 );
	EntFire( "brush_clip_onslaught", "Kill" );
	EntFire( "info_zombie_spawn", "Kill" );
	EntFire( "barricade_gas_can", "Break" );
	EntFire( "van_button", "Press" );
	EntFire( "button", "Press" );
	EntFire( "warn survivors_trigger", "Kill" );
	EntFire( "helicopter_animated", "Kill" );
	EntFire( "howitzer_holdout_relay", "Trigger" );
	EntFire( "bunker_button", "Press" ); //c13m1
	EntFire( "template_ladders", "ForceSpawn" ); //c6m2
	EntFire( "scavenge_ladder_model", "Enable" ); //c6m2
	EntFire( "generator_glow", "Kill" ); //c7m3
}

function RemoveHUD()
{
	//Remove unneeded HUD elements for score display
	StatHUD.Fields.timer.flags = StatHUD.Fields.timer.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name0.flags = StatHUD.Fields.name0.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name1.flags = StatHUD.Fields.name1.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name2.flags = StatHUD.Fields.name2.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name3.flags = StatHUD.Fields.name3.flags | HUD_FLAG_NOTVISIBLE
}

function DisplayScores()
{
	local Scores = {};
	foreach ( survivor in Players.Survivors() )
		Scores.rawset( survivor, SurvivorStats.kills[survivor.GetCharacterName()] );
	
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
	
	if ( 0 in HiScores )
	{
		SessionState.FirstScore = SurvivorStats.kills[HiScores[0].GetCharacterName()];
		SessionState.FirstName = HiScores[0].GetName();
		SessionState.FirstSurvivor = HiScores[0];
	}
	if ( 1 in HiScores )
	{
		SessionState.SecondScore = SurvivorStats.kills[HiScores[1].GetCharacterName()];
		SessionState.SecondName = HiScores[1].GetName();
		SessionState.SecondSurvivor = HiScores[1];
	}
	if ( 2 in HiScores )
	{
		SessionState.ThirdScore = SurvivorStats.kills[HiScores[2].GetCharacterName()];
		SessionState.ThirdName = HiScores[2].GetName();
		SessionState.ThirdSurvivor = HiScores[2];
	}
	if ( 3 in HiScores )
	{
		SessionState.FourthScore = SurvivorStats.kills[HiScores[3].GetCharacterName()];
		SessionState.FourthName = HiScores[3].GetName();
		SessionState.FourthSurvivor = HiScores[3];
	}
	
	if ( GetCurrentPlayers() >= 1 )
	{
		HUDPlace( HUD_SCORE_1, 0.38, 0.40, 0.44, 0.06 );
		StatHUD.Fields.score0.flags = StatHUD.Fields.score0.flags & ~HUD_FLAG_NOTVISIBLE
	}
	if ( GetCurrentPlayers() >= 2 )
	{
		HUDPlace( HUD_SCORE_2, 0.38, 0.48, 0.44, 0.06 );
		StatHUD.Fields.score1.flags = StatHUD.Fields.score1.flags & ~HUD_FLAG_NOTVISIBLE
	}
	if ( GetCurrentPlayers() >= 3 )
	{
		HUDPlace( HUD_SCORE_3, 0.38, 0.56, 0.44, 0.06 );
		StatHUD.Fields.score2.flags = StatHUD.Fields.score2.flags & ~HUD_FLAG_NOTVISIBLE
	}
	if ( GetCurrentPlayers() == 4 )
	{
		HUDPlace( HUD_SCORE_4, 0.38, 0.64, 0.44, 0.06 );
		StatHUD.Fields.score3.flags = StatHUD.Fields.score3.flags & ~HUD_FLAG_NOTVISIBLE
	}
	HUDPlace( HUD_SCORE_TITLE, 0.30, 0.32, 0.44, 0.06 );
	HUDPlace( HUD_RIGHT_BOT, 0.30, 0.32, 0.44, 0.40 );
	StatHUD.Fields.round.flags = StatHUD.Fields.round.flags & ~HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.scorebackground.flags = StatHUD.Fields.scorebackground.flags & ~HUD_FLAG_NOTVISIBLE
}

function SetupModeHUD()
{
	HUDPlace( HUD_MID_BOX, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDSetLayout( StatHUD );
}
