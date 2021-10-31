//-----------------------------------------------------
Msg("Activating Gun Game\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheSurvivors();

MutationOptions <-
{
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	cm_NoSurvivorBots = 1
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
}

MutationState <-
{
	PlayerKills = {}
	PlayerDeaths = {}
	PlayerPrimary = {}
	SpawnProtection = {}
	GameEnded = false
	RoundActive = true
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
	EmptyString = ""
	
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
			return (SessionState.PlayerKills[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

RoundState <-
{
	currentround = 0
	currentplayers = {}
}

GunGameWeaponList <-
[
	"pistol"
	"dual_pistols"
	"pistol_magnum"
	"smg"
	"smg_silenced"
	"smg_mp5"
	"pumpshotgun"
	"shotgun_chrome"
	"rifle"
	"rifle_ak47"
	"rifle_desert"
	"rifle_sg552"
	"rifle_m60"
	"autoshotgun"
	"shotgun_spas"
	"grenade_launcher"
	"hunting_rifle"
	"sniper_military"
	"sniper_scout"
	"sniper_awp"
	"machete"
]

function EasyLogic::OnGameplayStart::SetupData( modename, mapname )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		SessionState.PlayerKills[survivor.GetCharacterName()] <- 0;
		SessionState.PlayerDeaths[survivor.GetCharacterName()] <- 0;
		SessionState.PlayerPrimary[survivor.GetCharacterName()] <- null;
		SessionState.SpawnProtection[survivor.GetCharacterName()] <- false;
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	try
	{
		local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
		local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
		if ( victim.GetType() == Z_SURVIVOR )
		{
			if ( SessionState.SpawnProtection[victim.GetCharacterName()] == true )
			{
				return false;
			}
			else
			{
				if ( damageTable.DamageType == 16777280 && attacker.GetType() == Z_SURVIVOR )
				{
					ScriptedDamageInfo.DamageDone = 50;
					return true;
				}
			}
		}
	}
	catch( error )
	{
		
	}
	return true;
}

::LockDoor <- function ( args )
{
	EntFire( "prop_door_rotating_checkpoint", "SetSpeed", "0" );
}

::EndGame <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
		survivor.Kill();
}

::TeleportToStart <- function ( args )
{
	//teleport players to the start point
	g_ModeScript.TeleportPlayersToStartPoints( "pvp_deathmatch_spawn_*" );
}

::DisableGlow <- function ( player )
{
	player.Input( "SetGlowEnabled", "0" );
}

::StopScene <- function ( player )
{
	player.Input( "CancelCurrentScene" );
}

::StopSurvivorScene <- function ( args )
{
	EntFire( "player", "CancelCurrentScene" );
}

::DisableSpawnProtection <- function ( player )
{
	SessionState.SpawnProtection[player.GetCharacterName()] = false;
	player.Input( "Alpha", "255" );
}

::RemoveWeapons <- function ( player )
{
	player.DropAllWeapons();
}

::AdvanceGun <- function ( player )
{
	local playerKills = SessionState.PlayerKills[player.GetCharacterName()];
	if ( playerKills == 0 )
		player.Give( "pistol" );
	else if ( playerKills == 1 )
	{
		player.Give( "pistol" );
		player.Give( "pistol" );
	}
	else
		player.Give( g_ModeScript.GunGameWeaponList[playerKills] );
	
	local PlayerInv = player.GetHeldItems();
	if ( "slot0" in PlayerInv )
		SessionState.PlayerPrimary[player.GetCharacterName()] <- Entity(PlayerInv["slot0"]);
}

::RevivePlayer <- function ( player )
{
	player.Defib();
	local random_spawn = RandomInt( 1, 4 );
	player.Input( "TeleportToSurvivorPosition", "pvp_deathmatch_spawn_" + random_spawn.tostring() );
	player.Input( "ReleaseFromSurvivorPosition" );
	player.Input( "DisableLedgeHang" );
	player.Input( "SetGlowEnabled", "0" );
	if ( !SessionState.GameEnded )
	{
		Timers.AddTimer(0.1, false, RemoveWeapons, player);
		Timers.AddTimer(0.4, false, AdvanceGun, player);
		Timers.AddTimer(3.0, false, StopScene, player);
		SessionState.SpawnProtection[player.GetCharacterName()] = true;
		player.Input( "Alpha", "155" );
		Timers.AddTimer(5.0, false, DisableSpawnProtection, player);
	}
}

::GetCurrentPlayers <- function ()
{
	return g_ModeScript.RoundState.currentplayers.len();
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
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "prop_minigun", "Kill" );
	EntFire( "prop_minigun_l4d1", "Kill" );
	EntFire( "prop_mounted_machine_gun", "Kill" );
	EntFire( "relay_intro_start", "Kill" );
	EntFire( "relay_intro_finished", "Trigger" );
	EntFire( "func_orator", "Kill" );
	EntFire( "logic_choreographed_scene", "Kill" );
	EntFire( "info_remarkable", "Kill" );
	EntFire( "survivorPos_*", "Kill" );
	EntFire( "info_game_event_proxy", "Kill" );
	//EntFire( "survival_spawnpoints", "Kill" );
	//EntFire( "func_simpleladder", "setteam", "2" );
	
	if ( SessionState.MapName == "c7m2_barge" )
	{
		Ladder <- null;
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6064, 817, 127), 10 ) ) != null )
		{
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		}
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(5373, 734, 127), 10 ) ) != null )
		{
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		}
	}
	else if ( SessionState.MapName == "c8m3_sewers" )
	{
		Ladder <- null;
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(14128, 8007, -386), 10 ) ) != null )
		{
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		}
	}
	else if ( SessionState.MapName == "c9m2_lots" )
	{
		Ladder <- null;
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6208, 6954, 38), 10 ) ) != null )
		{
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		}
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(6078, 6589, 38), 10 ) ) != null )
		{
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		}
	}
	else if ( SessionState.MapName == "c13m4_cutthroatcreek" )
	{
		Ladder <- null;
		while( ( Ladder = Entities.FindByClassnameWithin( Ladder, "func_simpleladder", Vector(-3865, -5602, 192), 10 ) ) != null )
		{
			DoEntFire( "!self", "SetTeam", "0", 0, null, Ladder );
		}
	}
	
	if ( SessionState.MapName == "c2m1_highway" )
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
	else if ( SessionState.MapName == "c4m5_milltown_escape" )
	{
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
}

function Notifications::OnPlayerLeft::DetectPlayers( player, name, SteamID, params )
{
	if ( (player.IsHuman()) && (SteamID in g_ModeScript.RoundState.currentplayers) )
		g_ModeScript.RoundState.currentplayers.rawdelete(SteamID);
}

function Notifications::OnPlayerJoined::DetectPlayers( player, name, IPAddress, SteamID, params )
{
	if ( (player.IsHuman()) && !(SteamID in g_ModeScript.RoundState.currentplayers) )
		g_ModeScript.RoundState.currentplayers.rawset( SteamID, true );
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	if ( SessionState.MapName != "c8m3_sewers" )
	{
		EntFire( "func_button", "kill" ); //experiment
	}
	EntFire( "gunshop_door_button", "kill" );
	EntFire( "gunshop_door_01", "unlock" );
	EntFire( "gunshop_door_01", "open" );
	EntFire( "gunshop_door_01", "setbreakable" );
	EntFire( "tanker_destroy_relay", "trigger" );
	EntFire( "whitaker_relay", "trigger" );
	EntFire( "carousel_start_relay", "trigger" );
	EntFire( "carousel_gate_relay", "trigger" );
	EntFire( "carousel_game_event", "kill" );
	EntFire( "carousel_gate_button_model", "setanimation", "on" );
	EntFire( "carousel_gate_button_model", "stopglowing" );
	EntFire( "carousel_gate_button_sound", "playsound" );
	EntFire( "carousel_instruct_timer", "kill" );
	EntFire( "carousel_gate_button", "kill" );
	EntFire( "carousel_button2_relay", "trigger" );
	//EntFire( "relay_start_onslaught", "trigger" );
	EntFire( "minifinale_gates_slide_door", "open" );
	EntFire( "ticketbooth_hint", "kill" );
	EntFire( "stadium_entrance_door_relay", "trigger" );
	EntFire( "minifinale_gates_sound", "playsound" );
	EntFire( "ferry_button_stick_relay", "trigger" );
	EntFire( "bridge_button", "press" );
	EntFire( "button_callelevator", "press" );
	EntFire( "relay_car_ready", "trigger" );
	EntFire( "finale_cleanse_entrance_door", "lock" );
	EntFire( "finale_cleanse_exit_door", "unlock" );
	EntFire( "ceda_trailer_canopen_frontdoor_listener", "kill" );
	EntFire( "finale_cleanse_backdoors_blocker", "kill" );
	EntFire( "finale_end_doors_left", "open" );
	EntFire( "finale_end_doors_right", "open" );
	EntFire( "tractor_start_relay", "trigger" );
	EntFire( "filter_generator", "testactivator" );
	EntFire( "elevator","movetofloor", "bottom" );
	EntFire( "elevator_pulley", "start" );
	EntFire( "elevator_pulley2", "start" );
	EntFire( "elevbuttonoutsidefront", "skin", "1" );
	EntFire( "sound_elevator_startup", "playsound" );
	EntFire( "elevator_start_shake", "startshake" );
	EntFire( "elevator_number_relay", "trigger" );
	EntFire( "elevator_breakwalls*", "kill" );
	EntFire( "elevator_game_event", "kill" );
	EntFire( "button_minifinale", "press" );
	EntFire( "relay_enable_chuch_zombie_loop", "trigger" );
	EntFire( "train_engine_button", "press" );
	EntFire( "tankdoorin", "unlock" );
	EntFire( "tankdoorin", "open" );
	EntFire( "tankdoorout", "unlock" );
	EntFire( "tankdoorout", "open" );
	EntFire( "radio_fake_button", "press" );
	EntFire( "drawbridge", "movetofloor", "bottom" );
	EntFire( "drawbridge_start_sound", "playsound" );
	EntFire( "startbldg_door_button", "press" );
	EntFire( "startbldg_door", "open" );
	EntFire( "stage_lights_button", "press" );
	EntFire( "carousel_gate_button_sound", "kill" );
	EntFire( "carousel2_game_event", "kill" );
	EntFire( "finale_alarm_sound", "kill" );
	EntFire( "door_sliding", "open" ); //c8m2 and c8m3
	EntFire( "prop_gate_coaster", "setanimation", "close" );
	EntFire( "prop_gate_coaster", "setanimation", "idle_close", 1.50 );
	EntFire( "brush_clip_onslaught", "kill" );
	EntFire( "info_zombie_spawn", "kill" );
	
	EntFire( "player", "DisableLedgeHang" );
	EntFire( "player", "SetGlowEnabled", "0" );
	EntFire( "prop_door_rotating_checkpoint", "Close" );
	Timers.AddTimer(1.0, false, LockDoor);
	Timers.AddTimerByName("StopSurvivorSceneTimer", 0.1, true, StopSurvivorScene);
	
	HUDManageTimers( 0, TIMER_COUNTUP, 0 );
	HUDSetLayout( g_ModeScript.StatHUD );
}

function Notifications::OnItemPickup::PickedUpItem( player, classname, params )
{
	player.Input( "CancelCurrentScene" );
}

function Notifications::OnWeaponFire::FiredWeapon( player, classname, params )
{
	if ( ( player.GetCharacterName() in SessionState.SpawnProtection ) && ( SessionState.SpawnProtection[player.GetCharacterName()] ) )
	{
		DisableSpawnProtection( player );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	local damageType = ::VSLib.EasyLogic.GetEventInt(params, "type");
	if ( ( victim.GetCharacterName() in SessionState.PlayerPrimary ) && ( SessionState.PlayerPrimary[victim.GetCharacterName()] != null ) )
		SessionState.PlayerPrimary[victim.GetCharacterName()].Input( "Kill" );
	
	SessionState.PlayerDeaths[victim.GetCharacterName()]++;
	Timers.AddTimer(5.0, false, RevivePlayer, victim);
	if ( SessionState.RoundActive == true )
	{
		if ( attacker )
		{
			if ( victim.GetType() == Z_SURVIVOR && victim.GetBaseEntity() != attacker.GetBaseEntity() )
			{
				SessionState.PlayerKills[attacker.GetCharacterName()]++;
				RemoveWeapons(attacker);
				if ( SessionState.PlayerKills[attacker.GetCharacterName()] < 21 )
					Timers.AddTimer(0.1, false, AdvanceGun, attacker);
			}
			else
			{
				if ( SessionState.PlayerKills[victim.GetCharacterName()] > 0 )
					SessionState.PlayerKills[attacker.GetCharacterName()]--;
			}
		}
		else
		{
			if ( damageType == DMG_FALL )
			{
				if ( SessionState.PlayerKills[victim.GetCharacterName()] > 0 )
					SessionState.PlayerKills[attacker.GetCharacterName()]--;
			}
		}
	}
	
	if ( SessionState.PlayerKills[attacker.GetCharacterName()] >= 21 )
	{
		SessionState.GameEnded = true;
		g_ModeScript.RemoveHUD();
		g_ModeScript.DisplayScores();
		Convars.SetValue( "sv_permawipe", "1" );
		Convars.SetValue( "director_no_death_check", "0" );
		Timers.AddTimer(10.0, false, EndGame);
	}
}

function Notifications::OnFirstSpawn::TeleportToSpawn( player, params )
{
	if ( player.GetPlayerType() == Z_SURVIVOR )
	{
		Timers.AddTimer(0.5, false, TeleportToStart);
		player.Input( "DisableLedgeHang" );
		player.Input( "SetGlowEnabled", "0" );
	}
}

function Notifications::OnPlayerVomited::EnableTemporaryGlow( victim, boomer, params )
{
	victim.Input( "SetGlowEnabled", "1" );
	Timers.AddTimer(20.0, false, DisableGlow, victim);
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
		Scores.rawset( survivor, SessionState.PlayerKills[survivor.GetCharacterName()] );
	
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
		SessionState.FirstScore = SessionState.PlayerKills[HiScores[0].GetCharacterName()];
		SessionState.FirstName = HiScores[0].GetName();
		SessionState.FirstSurvivor = HiScores[0];
	}
	if ( 1 in HiScores )
	{
		SessionState.SecondScore = SessionState.PlayerKills[HiScores[1].GetCharacterName()];
		SessionState.SecondName = HiScores[1].GetName();
		SessionState.SecondSurvivor = HiScores[1];
	}
	if ( 2 in HiScores )
	{
		SessionState.ThirdScore = SessionState.PlayerKills[HiScores[2].GetCharacterName()];
		SessionState.ThirdName = HiScores[2].GetName();
		SessionState.ThirdSurvivor = HiScores[2];
	}
	if ( 3 in HiScores )
	{
		SessionState.FourthScore = SessionState.PlayerKills[HiScores[3].GetCharacterName()];
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
	StatHUD <-
	{
		Fields =
		{
			timer = 
			{
				slot = HUD_MID_BOX ,
				staticstring = "",
				name = "timer",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
			round = 
			{
				slot = HUD_SCORE_TITLE ,
				datafunc = @() SessionState.FinalScores,
				name = "round",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
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
	HUDPlace( HUD_MID_BOX, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	//HUDSetLayout( StatHUD );
}

::enabled_coach_hud <- false;
::enabled_ellis_hud <- false;
::enabled_nick_hud <- false;
::enabled_rochelle_hud <- false;
function EasyLogic::Update::Think()
{
	if ( !enabled_nick_hud && Entities.FindByName( null, "!nick" ) )
	{
		StatHUD.Fields.name0.flags = StatHUD.Fields.name0.flags & ~HUD_FLAG_NOTVISIBLE
		enabled_nick_hud = true;
	}
	if ( !enabled_rochelle_hud && Entities.FindByName( null, "!rochelle" ) )
	{
		StatHUD.Fields.name1.flags = StatHUD.Fields.name1.flags & ~HUD_FLAG_NOTVISIBLE
		enabled_rochelle_hud = true;
	}
	if ( !enabled_coach_hud && Entities.FindByName( null, "!coach" ) )
	{
		StatHUD.Fields.name2.flags = StatHUD.Fields.name2.flags & ~HUD_FLAG_NOTVISIBLE
		enabled_coach_hud = true;
	}
	if ( !enabled_ellis_hud && Entities.FindByName( null, "!ellis" ) )
	{
		StatHUD.Fields.name3.flags = StatHUD.Fields.name3.flags & ~HUD_FLAG_NOTVISIBLE
		enabled_ellis_hud = true;
	}
}
