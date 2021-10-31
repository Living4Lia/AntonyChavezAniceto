//-----------------------------------------------------
Msg("Activating VIP Escort: Split Decision\n");
Msg("Made by Rayman1103\n");

IncludeScript("split");
IncludeScript("vip_base");

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 12
	cm_MaxSpecials = 12
	cm_SpecialRespawnInterval = 0
	cm_SpecialSlotCountdownTime = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	//cm_ProhibitBosses = true
	SpecialInfectedAssault = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	ShouldAllowSpecialsWithTank = true
	//ZombieTankHealth = 5000
	
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TotalBoomers = 0
	TotalSmokers = 0
	TotalHunters = 0
	TotalChargers = 0
	TotalSpitters = 0
	TotalJockeys = 0
	TotalSpecials = 12
	PanicSpecialsOnly = true
	PanicWavePauseMax = 0
	PanicWavePauseMin = 0
	//SpawnSetRule = SPAWN_SURVIVORS
	
	weaponsToRemove =
	{
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
}

MutationState <-
{
	AllowBoomerSplit = false
	AllowSmokerSplit = false
	AllowHunterSplit = false
	AllowChargerSplit = false
	AllowSpitterSplit = false
	AllowJockeySplit = false
	AllowTankSplit = false
	AllowWitchSplit = false
	BoomersSplit = 0
	SmokersSplit = 0
	HuntersSplit = 0
	ChargersSplit = 0
	SpittersSplit = 0
	JockeysSplit = 0
	TanksSplit = 0
	WitchesSplit = 0
	BoomerSplitLevel = 0
	SmokerSplitLevel = 0
	HunterSplitLevel = 0
	ChargerSplitLevel = 0
	SpitterSplitLevel = 0
	JockeySplitLevel = 0
	TankSplitLevel = 0
	WitchSplitLevel = 0
	SpecialCloned = {}
	NonClone = {}
	FirstClone = {}
	SecondClone = {}
	SpecialWave = null
	SpecialWave2 = null
	TriggerRescue = false
	LeftStart = false
	SpawnSpecials = false
	TankInPlay = false
	FinaleStarted = false
	CurrentStage = -1
	AdvanceWaveTimer = 8.0
	SpawnedSurvivor = false
	VIPSpawned = false
	Nick = null
	VIP = null
	HasPermaWipe = false
	SaveVIPData = true
	SaveVIPHealth = true
	VIPDefibStart = false
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours"
}

function GetNextStage()
{
	if ( !SessionState.LeftStart )
		return;
	
	if ( SessionState.FinaleStarted )
	{
		SessionState.CurrentStage++;

		if ( SessionState.CurrentStage == 0 )
		{
			Msg("Activated STAGE_PANIC\n");
			SessionOptions.ScriptedStageType = STAGE_PANIC;
			SessionOptions.ScriptedStageValue = 2;
		}
		else if ( SessionState.CurrentStage == 1 )
		{
			Msg("Activated STAGE_DELAY\n");
			SessionOptions.ScriptedStageType = STAGE_DELAY;
			SessionOptions.ScriptedStageValue = 10;
			SessionState.CurrentStage = -1;
		}
	}
	else
	{
		if ( SessionState.SpawnSpecials && !SessionState.TankInPlay )
		{
			Msg("Spawning Specials!\n");
			SpawnSpecials();
			SessionOptions.ScriptedStageType = STAGE_PANIC;
			SessionOptions.ScriptedStageValue = 1;
			SessionState.SpawnSpecials = false;
		}
		else
		{
			SessionOptions.ScriptedStageType = STAGE_DELAY;
			SessionOptions.ScriptedStageValue = -1;
		}
	}
	if ( SessionState.TriggerRescue )
	{
		Msg("Triggered STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE;
		SessionState.TriggerRescue = false;
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) && !victim.IsSurvivor() )
		{
			damageTable.DamageDone = 1000;
			return true;
		}
		if ( victim.GetTeam() == SURVIVORS )
		{
			if ( attacker.GetClassname() == "witch" )
			{
				damageTable.DamageDone = 35;
				return true;
			}
			if ( attacker.GetType() == Z_CHARGER && damageTable.DamageType == DMG_CLUB && !victim.IsSurvivorTrapped() )
			{
				damageTable.DamageDone = 5;
				return true;
			}
			if ( damageTable.DamageType == DMG_BURN )
			{
				if ( victim.GetSurvivorCharacter() == 9 )
				{
					return false;
				}
			}
		}
	}
	catch( error )
	{
		
	}
	return true;
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetReviveCount() == 0 )
		{
			if ( survivor.GetRawHealth() < 100 )
				survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
		}
		else if ( survivor.GetReviveCount() == 1 )
		{
			if ( survivor.GetHealthBuffer() < 100 )
				survivor.SetHealthBuffer( survivor.GetHealthBuffer() + 1 );
		}
	}
}

::TankDeathCheck <- function ( args )
{
	if ( Utils.GetInfectedStats().Tanks == 0 )
	{
		SessionState.AllowTankSplit = false;
		SessionState.TanksSplit = 0;
		SessionState.TankSplitLevel = 0;
		Timers.AddTimer( 30.0, false, SpawnTank );
	}
}
