//-----------------------------------------------------
Msg("Activating Tank Brawl\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_ShouldHurry = 1
	cm_AllowSurvivorRescue = 0
	cm_InfiniteFuel = 1
	cm_ProhibitBosses = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 15
	cm_TankLimit = 15
	
	EscapeSpawnTanks = false

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
		//weapon_melee = 0
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

	DefaultItems =
	[
		
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
	SpawnTank = false
	TriggerRescue = false
	StartedFinale = false
	AllowTankSplit = false
	TanksSplit = 0
	TankSplitLevel = 0
	SpecialCloned = {}
	NonClone = {}
	FirstClone = {}
	SecondClone = {}
	RandomColor1 = 255
	RandomColor2 = 255
	RandomColor3 = 255
}

function GetNextStage()
{
	if ( SessionState.SpawnTank )
	{
		Msg("Spawning Tank!\n");
		SessionOptions.ScriptedStageType = STAGE_TANK;
		SessionOptions.ScriptedStageValue = 1;
		SessionState.SpawnTank = false;
	}
	else if ( !SessionState.SpawnTank )
	{
		SessionOptions.ScriptedStageType = STAGE_DELAY;
		SessionOptions.ScriptedStageValue = -1;
	}
	if ( SessionState.TriggerRescue )
	{
		Msg("Triggered STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE;
		SessionState.TriggerRescue = false;
	}
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::KillInfected <- function ( infected )
{
	if ( !infected.IsPlayerEntityValid() )
		return;
	
	infected.Kill();
	
	if ( infected.IsAlive() )
		Timers.AddTimer(0.1, false, KillInfected, infected);
}

::TankDeathCheck <- function ( args )
{
	if ( Utils.GetInfectedStats().Tanks == 0 )
	{
		SessionState.AllowTankSplit = false;
		SessionState.TanksSplit = 0;
		SessionState.TankSplitLevel = 0;
		if ( SessionState.StartedFinale )
			SpawnTank(null);
		else
			Timers.AddTimer( 20.0, false, SpawnTank );
	}
}

::SpawnTank <- function ( args )
{
	SessionState.SpawnTank = true;
	Director.ForceNextStage();
	Timers.AddTimer( 3.0, false, TankDeathCheck );
}

::TriggerRescue <- function ( args )
{
	SessionState.TriggerRescue = true;
	Director.ForceNextStage();
}

::FinaleStarted <- function ()
{
	SessionState.StartedFinale = true;
	
	if ( Utils.GetInfectedStats().Tanks == 0 )
		SpawnTank(null);
	
	Timers.AddTimer( 240.0, false, TriggerRescue );
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( attacker.IsSurvivor() && victim.GetType() == Z_TANK )
	{
		if ( damageTable.Weapon.GetClassname() == "weapon_melee" )
		{
			damageTable.DamageDone = 8000;
		}
	}
	if ( attacker.GetType() == Z_TANK && victim.GetTeam() == SURVIVORS )
	{
		damageTable.DamageDone = 15;
	}
	return true;
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "info_zombie_spawn", "Kill" );
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
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
		survivor.GiveRandomMelee();
	}
	Timers.AddTimerByName("HealthRegenTimer", 2.0, true, HealthRegen);
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	if ( SessionState.MapName == "c8m4_interior" )
	{
		EntFire( "elevator", "movetofloor", "bottom" );
		EntFire( "elevator_pulley", "start" );
		EntFire( "elevator_pulley2", "start" );
		EntFire( "elevbuttonoutsidefront", "skin", "1" );
		EntFire( "sound_elevator_startup", "playsound" );
		EntFire( "elevator_start_shake", "startshake" );
		EntFire( "elevator_number_relay", "trigger" );
		EntFire( "elevator_breakwalls", "kill" );
		EntFire( "elevator_game_event", "kill" );
	}
	EntFire( "finale_cleanse_entrance_door", "lock" );
	EntFire( "finale_cleanse_exit_door", "unlock" );
	EntFire( "ceda_trailer_canopen_frontdoor_listener", "kill" );
	EntFire( "finale_cleanse_backdoors_blocker", "kill" );
	EntFire( "radio_fake_button", "press" );
	EntFire( "drawbridge", "movetofloor", "bottom" );
	EntFire( "drawbridge_start_sound", "playsound" );
	EntFire( "startbldg_door_button", "press" );
	EntFire( "startbldg_door", "open" );
	
	Utils.DisableCarAlarms();
	
	if ( Entities.FindByName( null, "instructor_impound" ) )
		EntFire( "trigger_multiple", "kill" );
}

function Notifications::OnSurvivorsLeftStartArea::IgniteBarricade()
{
	EntFire( "barricade_gas_can", "Ignite" );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	if ( !Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
	{
		foreach (trigger_finale in Objects.OfClassname("trigger_finale"))
		{
			trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
		}
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnIncapacitated::IncappedPlayer( player, attacker, params )
{
	player.Remove("weapon_pistol");
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(100);
	player.SetHealthBuffer(0);
}

function Notifications::OnEnterSaferoom::KillTank( player, params )
{
	if ( player.GetTeam() == INFECTED )
		player.Kill();
}

function Notifications::OnTankSpawned::TankSpawn( tank, params )
{
	local splitAmount = 0;
	if ( SessionState.AllowTankSplit )
	{
		if ( SessionState.TankSplitLevel == 1 )
		{
			SessionState.FirstClone[tank.GetBaseIndex()] <- true;
			//tank.SetHealth(3000);
			tank.InputColor(SessionState.RandomColor1, SessionState.RandomColor2, SessionState.RandomColor3);
			splitAmount = 2;
		}
		else if ( SessionState.TankSplitLevel == 2 )
		{
			SessionState.SecondClone[tank.GetBaseIndex()] <- true;
			//tank.SetHealth(1500);
			tank.InputColor(SessionState.RandomColor1, SessionState.RandomColor2, SessionState.RandomColor3);
			splitAmount = 4;
		}
		else if ( SessionState.TankSplitLevel == 3 )
		{
			SessionState.SpecialCloned[tank.GetBaseIndex()] <- true;
			//tank.SetHealth(500);
			tank.InputColor(SessionState.RandomColor1, SessionState.RandomColor2, SessionState.RandomColor3);
			splitAmount = 4;
		}
		
		/*if ( SessionState.TanksSplit < splitAmount )
		{
			SessionState.TanksSplit++;
			
			if ( SessionState.TanksSplit == splitAmount )
			{
				SessionState.AllowTankSplit = false;
				SessionState.TanksSplit = 0;
			}
		}*/
	}
	else
	{
		if ( Utils.GetInfectedStats().Tanks > 0 )
		{
			printl("ALERT: Prime Tank has spawned while other Tanks are alive!!!");
			tank.Input("Kill");
		}
		else
		{
			SessionState.NonClone[tank.GetBaseIndex()] <- true;
			SessionState.RandomColor1 = RandomInt(0, 255);
			SessionState.RandomColor2 = RandomInt(0, 255);
			SessionState.RandomColor3 = RandomInt(0, 255);
			tank.InputColor(SessionState.RandomColor1, SessionState.RandomColor2, SessionState.RandomColor3);
			//tank.SetHealth(6000);
		}
	}
	Timers.AddTimer(30.0, false, KillInfected, tank);
}

function Notifications::OnTankKilled::TankDeath( tank, attacker, params )
{
	local nonClone = false;
	local firstClone = false;
	local secondClone = false;
	if ( (tank.GetBaseIndex() in SessionState.SpecialCloned) && (SessionState.SpecialCloned[tank.GetBaseIndex()]) )
	{
		SessionState.SpecialCloned[tank.GetBaseIndex()] <- false;
		//return;
	}
	if ( (tank.GetBaseIndex() in SessionState.NonClone) && (SessionState.NonClone[tank.GetBaseIndex()]) )
	{
		SessionState.NonClone[tank.GetBaseIndex()] <- false;
		nonClone = true;
	}
	if ( (tank.GetBaseIndex() in SessionState.FirstClone) && (SessionState.FirstClone[tank.GetBaseIndex()]) )
	{
		SessionState.FirstClone[tank.GetBaseIndex()] <- false;
		firstClone = true;
	}
	if ( (tank.GetBaseIndex() in SessionState.SecondClone) && (SessionState.SecondClone[tank.GetBaseIndex()]) )
	{
		SessionState.SecondClone[tank.GetBaseIndex()] <- false;
		secondClone = true;
	}
	local splitAmount = 0;
	if ( nonClone )
	{
		SessionState.TankSplitLevel = 1;
		SessionState.AllowTankSplit = true;
		splitAmount = 2;
	}
	else if ( firstClone )
	{
		SessionState.TankSplitLevel = 2;
		SessionState.AllowTankSplit = true;
		splitAmount = 4;
	}
	else if ( secondClone )
	{
		SessionState.TankSplitLevel = 3;
		SessionState.AllowTankSplit = true;
		splitAmount = 4;
	}
	else
	{
		SessionState.AllowTankSplit = false;
		SessionState.TanksSplit = 0;
		SessionState.TankSplitLevel = 0;
	}
	
	if ( splitAmount == 2 )
	{
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( 50, 0, 0 ) );
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( -50, 0, 0 ) );
	}
	else if ( splitAmount == 3 )
	{
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( 50, 0, 0 ) );
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( -50, 0, 0 ) );
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( 100, 0, 0 ) );
	}
	else if ( splitAmount == 4 )
	{
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( 50, 0, 0 ) );
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( -50, 0, 0 ) );
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( 100, 0, 0 ) );
		Utils.SpawnZombie( Z_TANK, tank.GetLocation() + Vector( -100, 0, 0 ) );
	}
	
	Timers.AddTimer( 0.5, false, TankDeathCheck );
}

function EasyLogic::Update::Think()
{
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
