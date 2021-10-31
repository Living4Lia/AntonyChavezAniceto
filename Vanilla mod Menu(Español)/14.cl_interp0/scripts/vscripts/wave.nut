//-----------------------------------------------------
Msg("Activating Wave\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheCSSWeapons();
Utils.PrecacheSurvivors();

MutationOptions <-
{
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 12
	cm_MaxSpecials = 0
	cm_SpecialRespawnInterval = 0
	//cm_WanderingZombieDensityModifier = 0
	WanderingZombieDensityModifier = 0
	AlwaysAllowWanderers = false
	PreferredMobDirection = SPAWN_ANYWHERE
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	MegaMobMaxSize = 0
	MegaMobMinSize = 0
	MegaMobSize = 0
	MobSpawnSize = 0
	MobMinSize = 0
	MobMaxSize = 0
	MobMaxPending = 0
	//PanicForever = 1
	SpecialInfectedAssault = 1
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
	
	TotalSpecials = 0
	TotalSmokers = 0
	TotalBoomers = 0
	TotalHunters = 0
	TotalSpitters = 0
	TotalJockeys = 0
	TotalChargers = 0
	
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
		//upgrade_item = 0
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
	PlayerCash = {}
	CurrentWave = -1
	WaveActive = false
	AdvanceMiniWave = false
	ExtraMiniWave = false
	InfectedAlive = 0
	SpawnTank = false
	BossTank = null
	BossHealth = 10000
	BossAlive = false
	PlayerInTrader = {}
	TraderOpen = false
	SpacerString = "  "
	
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
	
	function DisplayCash(ind)
	{
		local p = Utils.GetPlayerFromCharacter(ind)
		if(p)
		{
			return (SessionState.PlayerCash[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

function EasyLogic::OnGameplayStart::TeleportToStart(modename, mapname)
{
	//teleport players to the start point
	TeleportPlayersToStartPoints( "wave_playerstart" );
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		SessionState.PlayerInTrader[survivor.GetCharacterName()] <- false;
		SessionState.PlayerCash[survivor.GetCharacterName()] <- 0;
	}
}

function EasyLogic::OnUserCommand::WaveCommands(player, args, text)
{
	local Command = GetArgument(0);
	
	switch ( Command )
	{
		case "drop_cash":
		{
			local Amount = GetArgument(1);
			local Survivor = player.GetLookingEntity();

			if ( !Survivor )
				return
			
			if ( Amount )
				Amount = Amount.tointeger();
			
			if ( !Amount )
				Amount = 50;
			
			if ( !Survivor.IsSurvivor() )
				return;
			
			if ( SessionState.PlayerCash[player.GetCharacterName()] < Amount )
				Amount = SessionState.PlayerCash[player.GetCharacterName()];
			
			SessionState.PlayerCash[Survivor.GetCharacterName()] += Amount;
			SessionState.PlayerCash[player.GetCharacterName()] -= Amount;
			
			break;
		}
	}
}

/*function GetNextStage()
{
	if ( SessionState.SpawnTank )
	{
		Msg("Spawning Tank!\n");
		SessionOptions.ScriptedStageType = STAGE_TANK
		SessionOptions.ScriptedStageValue = 1
		SessionState.SpawnTank = false;
	}
	else
	{
		SessionOptions.ScriptedStageType = STAGE_DELAY
		SessionOptions.ScriptedStageValue = -1
	}
}*/

::GetNextWave <- function ( args )
{
	SessionState.CurrentWave++;
	SessionState.AdvanceMiniWave = true;
	
	switch ( SessionState.CurrentWave )
	{
		case 0:
		{
			HUDManageTimers( 0, TIMER_COUNTDOWN, 10 );
			g_ModeScript.StatHUD.Fields.infectedalive.flags = g_ModeScript.StatHUD.Fields.infectedalive.flags | g_ModeScript.HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.tradertimer.flags = g_ModeScript.StatHUD.Fields.tradertimer.flags & ~g_ModeScript.HUD_FLAG_NOTVISIBLE
			EntFire( "trader_door", "Close" );
			Timers.AddTimer(10.0, false, GetNextWave);
			break;
		}
		case 1:
		{
			SetMobLimit(30);
			SessionState.InfectedAlive = 30;
			Timers.AddTimerByName("PanicEventTimer", 15.0, true, CreatePanicEvent );
			g_ModeScript.StatHUD.Fields.tradertimer.flags = g_ModeScript.StatHUD.Fields.tradertimer.flags | g_ModeScript.HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.infectedalive.flags = g_ModeScript.StatHUD.Fields.infectedalive.flags & ~g_ModeScript.HUD_FLAG_NOTVISIBLE
			SessionState.WaveActive = true;
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 2:
		{
			SetMobLimit(45);
			SessionOptions.cm_MaxSpecials = 2;
			SessionOptions.BoomerLimit = 1;
			SessionOptions.HunterLimit = 1;
			SessionState.InfectedAlive = 47;
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			break;
		}
		case 3:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 4;
			SessionOptions.BoomerLimit = 1;
			SessionOptions.HunterLimit = 1;
			SessionOptions.SmokerLimit = 1;
			SessionOptions.SpitterLimit = 1;
			SessionState.InfectedAlive = 64;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 4:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 6;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 1;
			SessionOptions.SmokerLimit = 1;
			SessionOptions.SpitterLimit = 1;
			SessionState.InfectedAlive = 81;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 5:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 8;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 2;
			SessionOptions.SmokerLimit = 1;
			SessionOptions.SpitterLimit = 1;
			SessionOptions.JockeyLimit = 1;
			SessionOptions.ChargerLimit = 1;
			SessionState.InfectedAlive = 98;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 6:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 10;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 2;
			SessionOptions.SmokerLimit = 2;
			SessionOptions.SpitterLimit = 2;
			SessionOptions.JockeyLimit = 1;
			SessionOptions.ChargerLimit = 1;
			SessionState.InfectedAlive = 115;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 7:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 12;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 2;
			SessionOptions.SmokerLimit = 2;
			SessionOptions.SpitterLimit = 2;
			SessionOptions.JockeyLimit = 2;
			SessionOptions.ChargerLimit = 2;
			SessionState.InfectedAlive = 132;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 8:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 12;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 2;
			SessionOptions.SmokerLimit = 2;
			SessionOptions.SpitterLimit = 2;
			SessionOptions.JockeyLimit = 2;
			SessionOptions.ChargerLimit = 2;
			SessionState.InfectedAlive = 147;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 9:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 12;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 2;
			SessionOptions.SmokerLimit = 2;
			SessionOptions.SpitterLimit = 2;
			SessionOptions.JockeyLimit = 2;
			SessionOptions.ChargerLimit = 2;
			SessionState.InfectedAlive = 162;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 10:
		{
			SetMobLimit(60);
			SessionOptions.cm_MaxSpecials = 12;
			SessionOptions.BoomerLimit = 2;
			SessionOptions.HunterLimit = 2;
			SessionOptions.SmokerLimit = 2;
			SessionOptions.SpitterLimit = 2;
			SessionOptions.JockeyLimit = 2;
			SessionOptions.ChargerLimit = 2;
			SessionState.InfectedAlive = 177;
			Timers.AddTimerByName("PanicEventTimer", 30.0, true, CreatePanicEvent );
			EntFire( "info_director", "ForcePanicEvent" );
			StartAssault();
			break;
		}
		case 11:
		{
			SessionOptions.TankLimit = 1;
			SessionOptions.cm_TankLimit = 1;
			SessionOptions.ZombieTankHealth <- 10000;
			SessionState.InfectedAlive = 1;
			//SessionState.SpawnTank = true;
			//Director.ForceNextStage();
			SessionState.BossAlive = true;
			Utils.SpawnZombieNearPlayer( Players.AnyAliveSurvivor(), Z_TANK, 1500, 1000 );
			g_ModeScript.StatHUD.Fields.infectedalive.datafunc = g_ModeScript.StatHUD.Fields.infectedalive.datafunc = @() SessionState.BossHealth
			break;
		}
		default:
			break;
	}
}

::CreatePanicEvent <- function ( args )
{
	if ( SessionState.InfectedAlive > 0 )
	{
		Utils.ForcePanicEvent();
		StartAssault();
	}
	else
		Timers.RemoveTimerByName( "PanicEventTimer" );
}

::ReviveSurvivors <- function ( args )
{
	foreach(survivor in Players.DeadSurvivors())
		survivor.Defib();
}

::WarpSurvivors <- function ()
{
	local TraderWarpZone = Entities.FindByName( null, "trader_warp_zone" ).GetOrigin();
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( SessionState.PlayerInTrader[survivor.GetCharacterName()] )
			survivor.SetLocation( TraderWarpZone );
	}
}

::SetMobLimit <- function ( amount )
{
	SessionOptions.cm_CommonLimit = amount;
	SessionOptions.MegaMobMaxSize = amount;
	SessionOptions.MegaMobMinSize = amount;
	SessionOptions.MegaMobSize = amount;
	SessionOptions.MobSpawnSize = amount;
	SessionOptions.MobMinSize = amount;
	SessionOptions.MobMaxSize = amount;
	SessionOptions.MobMaxPending = amount;
}

::AdvanceMiniWave <- function ( args )
{
	switch ( SessionState.CurrentWave )
	{
		case 4:
		{
			SetMobLimit(15);
			break;
		}
		case 5:
		{
			SetMobLimit(30);
			break;
		}
		case 6:
		{
			SetMobLimit(45);
			break;
		}
		case 7:
		{
			SetMobLimit(60);
			break;
		}
		case 8:
		{
			if ( SessionState.ExtraMiniWave )
			{
				SetMobLimit(15);
				SessionState.ExtraMiniWave = false;
			}
			else
			{
				SetMobLimit(60);
				SessionState.ExtraMiniWave = true;
				SessionState.AdvanceMiniWave = true;
			}
			break;
		}
		case 9:
		{
			if ( SessionState.ExtraMiniWave )
			{
				SetMobLimit(30);
				SessionState.ExtraMiniWave = false;
			}
			else
			{
				SetMobLimit(60);
				SessionState.ExtraMiniWave = true;
				SessionState.AdvanceMiniWave = true;
			}
			break;
		}
		case 10:
		{
			if ( SessionState.ExtraMiniWave )
			{
				SetMobLimit(45);
				SessionState.ExtraMiniWave = false;
			}
			else
			{
				SetMobLimit(60);
				SessionState.ExtraMiniWave = true;
				SessionState.AdvanceMiniWave = true;
			}
			break;
		}
		default:
			break;
	}
	CreatePanicEvent(null);
}

::OpenTrader <- function ( args )
{
	local RandomSound = RandomInt( 0, 1 );
	EntFire( "trader_door", "Open" );
	Timers.AddTimer(30.0, false, TraderNags);
	Timers.AddTimer(60.0, false, CloseTrader);
	HUDManageTimers( 0, TIMER_COUNTDOWN, 60 );
	g_ModeScript.StatHUD.Fields.infectedalive.flags = g_ModeScript.StatHUD.Fields.infectedalive.flags | g_ModeScript.HUD_FLAG_NOTVISIBLE
	g_ModeScript.StatHUD.Fields.tradertimer.flags = g_ModeScript.StatHUD.Fields.tradertimer.flags & ~g_ModeScript.HUD_FLAG_NOTVISIBLE
	if ( RandomSound == 0 )
		Utils.PlaySound("npc\\Whitaker\\ComeUpstairsLongerB02.wav");
		//Utils.PlaySoundToAll("Whitaker_ComeUpstairsLongerB02");
	else
		Utils.PlaySound("npc\\Whitaker\\ComeUpstairsLongerA02.wav");
		//Utils.PlaySoundToAll("Whitaker_ComeUpstairsLongerA02");
	ReviveSurvivors(null);
	SessionState.TraderOpen = true;
}

::CloseTrader <- function ( args )
{
	local RandomSound = RandomInt( 0, 2 );
	EntFire( "trader_door", "Close" );
	WarpSurvivors();
	g_ModeScript.StatHUD.Fields.tradertimer.flags = g_ModeScript.StatHUD.Fields.tradertimer.flags | g_ModeScript.HUD_FLAG_NOTVISIBLE
	g_ModeScript.StatHUD.Fields.infectedalive.flags = g_ModeScript.StatHUD.Fields.infectedalive.flags & ~g_ModeScript.HUD_FLAG_NOTVISIBLE
	if ( RandomSound == 0 )
		Utils.PlaySound("npc\\Whitaker\\DefendChatter15.wav");
		//Utils.PlaySoundToAll("Whitaker_DefendChatter15");
	else
		Utils.PlaySound("npc\\Whitaker\\DefendChatter14.wav");
		//Utils.PlaySoundToAll("Whitaker_DefendChatter14"); //Whitaker_DefendChatter19
	GetNextWave(null);
	SessionState.TraderOpen = false;
}

::TraderNags <- function ( args )
{
	local RandomSound = RandomInt( 0, 3 );
	if ( RandomSound == 0 )
		Utils.PlaySound("npc\\Whitaker\\Nags02.wav");
		//Utils.PlaySoundToAll("Whitaker_Nags02");
	else if ( RandomSound == 1 )
		Utils.PlaySound("npc\\Whitaker\\Nags04.wav");
		//Utils.PlaySoundToAll("Whitaker_Nags04");
	else if ( RandomSound == 2 )
		Utils.PlaySound("npc\\Whitaker\\Nags05.wav");
		//Utils.PlaySoundToAll("Whitaker_Nags05");
	else
		Utils.PlaySound("npc\\Whitaker\\Nags07.wav");
		//Utils.PlaySoundToAll("Whitaker_Nags07");
}

function Notifications::OnRoundStart::DoStuff()
{
	foreach(gascan in Objects.OfModel("models/props_junk/gascan001a.mdl"))
	{
		if ( gascan.GetName().find("_gascan") == null )
			gascan.Kill();
	}
	foreach(propanetank in Objects.OfModel("models/props_junk/propanecanister001a.mdl"))
	{
		if ( propanetank.GetName().find("_propanetank") == null )
			propanetank.Kill();
	}
	foreach(oxygentank in Objects.OfModel("models/props_equipment/oxygentank01.mdl"))
	{
		if ( oxygentank.GetName().find("_oxygentank") == null )
			oxygentank.Kill();
	}
	foreach(fireworkcrate in Objects.OfModel("models/props_junk/explosive_box001.mdl"))
	{
		if ( fireworkcrate.GetName().find("_fireworkcrate") == null )
			fireworkcrate.Kill();
	}
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "upgrade_item", "Kill" );
	EntFire( "upgrade_laser_sight", "Kill" );
	
	EntFire( "prop_minigun", "Kill" );
	EntFire( "prop_minigun_l4d1", "Kill" );
	EntFire( "prop_mounted_machine_gun", "Kill" );
	
	if ( SessionState.MapName == "c4m1_milltown_a" || SessionState.MapName == "c4m4_milltown_b" )
	{
		foreach(ladder in Objects.OfClassnameWithin("func_simpleladder", Vector(-249, 6145, 105.001), 10))
			ladder.Kill();
	}
}

function SurvivorInTrader()
{
	if ( !Entity(activator).IsSurvivor() )
		return;
	local player = Player(activator);
	//printl(player.GetName() + " in trader");
	SessionState.PlayerInTrader[player.GetCharacterName()] <- true;
}

function SurvivorNotInTrader()
{
	if ( !Entity(activator).IsSurvivor() )
		return;
	local player = Player(activator);
	//printl(player.GetName() + " not in trader");
	SessionState.PlayerInTrader[player.GetCharacterName()] <- false;
}

function Notifications::OnMapFirstStart::ConnectOutputs()
{
	foreach( trigger in Objects.OfName("trader_trigger") )
	{
		trigger.ConnectOutput( "OnStartTouch", g_ModeScript.SurvivorInTrader );
		trigger.ConnectOutput( "OnEndTouch", g_ModeScript.SurvivorNotInTrader );
	}
}

function Notifications::OnSpawn::L4D1SurvivorSpawned( player, params )
{
	if ( player.GetSurvivorCharacter() > 3 )
	{
		if ( player.GetSurvivorCharacter() == 5 )
			SessionState.PlayerCash["Survivor"] <- 0;
		
		SessionState.PlayerInTrader[player.GetCharacterName()] <- false;
		SessionState.PlayerCash[player.GetCharacterName()] <- 0;
	}
}

function Notifications::OnTankSpawned::BossTankSpawned( tank, params )
{
	if ( SessionState.CurrentWave == 11 )
	{
		tank.InputColor(255, 0, 0);
		SessionState.BossTank = tank;
	}
}

function Notifications::OnHurt::UpdateTankHealth( entity, attacker, params )
{
	if ( SessionState.BossAlive )
	{
		local health = ::VSLib.EasyLogic.GetEventInt(params, "health");
		if ( entity.GetType() == Z_TANK )
			SessionState.BossHealth = health;
	}
}

::EndGame <- function (args)
{
	Utils.RollStatsCrawl();
}

function Notifications::OnTankKilled::Victory( tank, attacker, params )
{
	if ( tank.GetIndex() == SessionState.BossTank.GetIndex() )
	{
		Utils.SayToAll("Your squad survived!");
		SessionState.BossAlive = false;
		Timers.AddTimer(5.0, false, EndGame);
	}
}

function Notifications::OnDeath::SIDeath( victim, attacker, params )
{
	if ( attacker != null )
	{
		if ( victim.GetClassname() == "player" )
		{
			if ( attacker.GetType() == Z_SURVIVOR && victim.GetType() != Z_SURVIVOR )
				SessionState.PlayerCash[attacker.GetCharacterName()] += 25;
			if ( victim.GetType() != Z_SURVIVOR && SessionOptions.cm_MaxSpecials > 0 ) //&& SessionState.InfectedAlive > 0 )
			{
				SessionState.InfectedAlive--;
				SessionOptions.cm_MaxSpecials--;
			}
		}
		else if ( victim.GetClassname() == "infected" )
		{
			if ( attacker.GetType() == Z_SURVIVOR )
				SessionState.PlayerCash[attacker.GetCharacterName()] += 5;
			if ( SessionOptions.cm_CommonLimit > 0 )
			{
				SessionState.InfectedAlive--;
				SessionOptions.cm_CommonLimit--;
			}
		}
	}
}

function Notifications::OnSurvivorsDead::RemoveL4D1Survivors()
{
	foreach( survivor in Players.Survivors() )
	{
		if ( survivor.GetSurvivorCharacter() > 3 )
		{
			survivor.SetTeam(4);
			survivor.Input("Kill");
		}
	}
}

function SetupModeHUD()
{
	StatHUD <-
	{
		Fields =
		{
			infectedalive = 
			{
				slot = HUD_MID_BOX ,
				datafunc = @() SessionState.InfectedAlive,
				name = "infectedalive",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			wave = 
			{
				slot = HUD_SCORE_TITLE ,
				datafunc = @() "Wave " + SessionState.CurrentWave + " / " + "10",
				name = "wave",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			tradertimer = 
			{
				slot = HUD_LEFT_TOP ,
				name = "tradertimer",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
			name0 = 
			{
				slot = HUD_FAR_LEFT ,
				datafunc = @() SessionState.DisplayName(0) + SessionState.SpacerString + "$" + SessionState.DisplayCash(0),
				name = "name0",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name1 = 
			{
				slot = HUD_MID_TOP ,
				datafunc = @() SessionState.DisplayName(1) + SessionState.SpacerString + "$" + SessionState.DisplayCash(1),
				name = "name1",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name2 = 
			{
				slot = HUD_FAR_RIGHT ,
				datafunc = @() "$" + SessionState.DisplayCash(2) + SessionState.SpacerString + SessionState.DisplayName(2),
				name = "name2",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
			name3 = 
			{
				slot = HUD_MID_BOT ,
				datafunc = @() "$" + SessionState.DisplayCash(3) + SessionState.SpacerString + SessionState.DisplayName(3),
				name = "name3",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
		}
	}
	HUDPlace( HUD_MID_BOX, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_LEFT_TOP, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDSetLayout( StatHUD );
	GetNextWave(null);
}

function EasyLogic::Update::Think()
{
	if ( SessionState.AdvanceMiniWave && !SessionState.TraderOpen && SessionState.InfectedAlive > 0 && SessionOptions.cm_CommonLimit <= 0 )
	{
		if ( SessionState.CurrentWave >= 4 && SessionState.InfectedAlive != SessionOptions.cm_MaxSpecials )
		{
			SessionState.AdvanceMiniWave = false;
			AdvanceMiniWave(null);
		}
	}
	if ( !SessionState.TraderOpen && SessionState.WaveActive && SessionState.InfectedAlive <= 0 )
	{
		OpenTrader(null);
		Timers.RemoveTimerByName( "PanicEventTimer" );
	}
	if ( SessionState.CurrentWave == 11 && SessionState.BossTank != null && SessionState.BossTank.IsAlive() )
	{
		if ( SessionState.BossTank.GetHealth() < 10000 )
		{
			SessionState.BossTank.SetHealth( SessionState.BossTank.GetHealth() + 100 );
			SessionState.BossHealth += 100;
		}
	}
}
