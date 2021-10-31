//-----------------------------------------------------
Msg("Activating Acid Trip\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_ShouldHurry = 1
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 8 //10
	cm_MaxSpecials = 8 //10
	cm_SpecialRespawnInterval = 10
	cm_AggressiveSpecials = 1
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	ShouldAllowSpecialsWithTank = true
	TankHitDamageModifierCoop = 0.5
	cm_BaseCommonAttackDamage = 0
	
	SmokerLimit = 0
	BoomerLimit = 0 //2
	HunterLimit = 0
	SpitterLimit = 8
	JockeyLimit = 0
	ChargerLimit = 0
	TankLimit = 4
	WitchLimit = 0
	TotalSpitters = 8
	//TotalBoomers = 2
	TotalSpecials = 8 //10
	PanicSpecialsOnly = true
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		ammo = "weapon_pain_pills_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}

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
		weapon_adrenaline = 0
		weapon_defibrillator = 0
		weapon_first_aid_kit = 0
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

	RandomPrimary =
	[
		"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	RandomSecondary =
	[
		"weapon_pistol_magnum",
	]
	
	RandomTertiary =
	[
		"weapon_pain_pills",
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		local TRand = RandomInt(0,RandomTertiary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		else if(id == 2) return RandomTertiary[TRand];
		return 0;
	}
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.001 // pain_pills_decay_rate default 0.27
		}
	}
}

MutationState <-
{
	SpawnTank = false
	TriggerRescue = false
}

function GetNextStage()
{
	if ( SessionState.SpawnTank )
	{
		Msg("Spawning Tank!\n");
		SessionOptions.ScriptedStageType = STAGE_TANK
		SessionOptions.ScriptedStageValue = 1
		SessionState.SpawnTank = false;
		Timers.AddTimer( 3.0, false, NextStage );
	}
	else
	{
		Msg("Triggered STAGE_PANIC\n");
		SessionOptions.ScriptedStageType = STAGE_PANIC
		SessionOptions.ScriptedStageValue = 1
	}
	if ( SessionState.TriggerRescue )
	{
		Msg("Triggered STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE
		SessionState.TriggerRescue = false;
	}
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	Utils.RemoveZombieSpawns();
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
	}
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
	Timers.AddTimer( 60.0, true, SpawnTank );
	EntFire( "startbldg_door_button", "Press" );
	EntFire( "startbldg_door", "Open" );
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	if ( Entities.FindByClassname( null, "trigger_finale" ) )
	{
		foreach (trigger_finale in Objects.OfClassname("trigger_finale"))
		{
			trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
		}
	}
}

::FinaleStarted <- function ()
{
	Timers.AddTimer( 180.0, false, TriggerRescue );
}

::SpawnTank <- function ( args )
{
	SessionState.SpawnTank = true;
	Director.ForceNextStage();
}

::TriggerRescue <- function ( args )
{
	SessionState.TriggerRescue = true;
	Director.ForceNextStage();
	if ( Entities.FindByName( null, "relay_car_ready" ) )
		EntFire( "relay_car_ready", "Trigger" );
}

::NextStage <- function ( args )
{
	Director.ForceNextStage();
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
