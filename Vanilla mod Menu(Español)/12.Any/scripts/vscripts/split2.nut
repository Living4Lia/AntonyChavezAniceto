//-----------------------------------------------------
Msg("Activating Split Decision: M60 Edition\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

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
	//SurvivorMaxIncapacitatedCount = 1
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
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_chainsaw = 0
		weapon_defibrillator = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
		weapon_melee = 0
		weapon_upgradepack_explosive = 0
		weapon_upgradepack_incendiary = 0
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
		"weapon_rifle_m60",
		"weapon_pistol_magnum",
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
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.75 // pain_pills_decay_rate default 0.27
		}
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

::AdvanceWave <- function ( args )
{
	SessionState.SpawnSpecials = true;
	Director.ForceNextStage();
}

::SpawnSpecials <- function ()
{
	local function SetSpecialLimit( special )
	{
		if ( special == Z_SMOKER )
		{
			SessionOptions.SmokerLimit += 1;
			SessionOptions.TotalSmokers += 1;
		}
		else if ( special == Z_BOOMER )
		{
			SessionOptions.BoomerLimit += 1;
			SessionOptions.TotalBoomers += 1;
		}
		else if ( special == Z_HUNTER )
		{
			SessionOptions.HunterLimit += 1;
			SessionOptions.TotalHunters += 1;
		}
		else if ( special == Z_SPITTER )
		{
			SessionOptions.SpitterLimit += 1;
			SessionOptions.TotalSpitters += 1;
		}
		else if ( special == Z_JOCKEY )
		{
			SessionOptions.JockeyLimit += 1;
			SessionOptions.TotalJockeys += 1;
		}
		else if ( special == Z_CHARGER )
		{
			SessionOptions.ChargerLimit += 1;
			SessionOptions.TotalChargers += 1;
		}
	}
	
	local InfectedTypes =
	[
		Z_SMOKER
		//Z_BOOMER
		Z_HUNTER
		Z_SPITTER
		Z_JOCKEY
		Z_CHARGER
	]
	
	/*if ( SessionState.SpecialWave != null )
	{
		Utils.RemoveValueFromArray(InfectedTypes, SessionState.SpecialWave);
		if ( SessionState.SpecialWave != SessionState.SpecialWave2 )
			Utils.RemoveValueFromArray(InfectedTypes, SessionState.SpecialWave2);
	}*/
	
	local random_wave = Utils.GetRandValueFromArray(InfectedTypes);
	local random_wave2 = Utils.GetRandValueFromArray(InfectedTypes);
	SessionState.SpecialWave = random_wave;
	SessionState.SpecialWave2 = random_wave2;
	SetSpecialLimit(random_wave);
	SetSpecialLimit(random_wave2);
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
		if ( survivor.GetRawHealth() < 100 && survivor.GetReviveCount() < 2 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	SessionState.LeftStart = true;
	SessionState.SpawnSpecials = true;
	Director.ForceNextStage();
	if ( !Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
	{
		foreach (trigger_finale in Objects.OfClassname("trigger_finale"))
		{
			trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
		}
	}
}

::TriggerRescue <- function ( args )
{
	SessionState.TriggerRescue = true;
	Director.ForceNextStage();
}

::FinaleStarted <- function ()
{
	SessionState.FinaleStarted = true;
	Timers.AddTimer( 300.0, false, TriggerRescue );
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
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
		survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
	}
	Timers.AddTimerByName("HealthRegenTimer", 2.0, true, HealthRegen);
	//Say( null, "If your temporary health drains to zero you will be incapped, if black and white you will die.", false );
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	if ( player.GetReviveCount() == 2 )
		player.SetRawHealth(69);
	else
		player.SetRawHealth(25);
	player.SetHealthBuffer(0);
}

function Notifications::OnWitchSpawned::WitchSpawn( witch, params )
{
	local splitAmount = 0;
	if ( SessionState.AllowWitchSplit )
	{
		if ( SessionState.WitchSplitLevel == 1 )
		{
			SessionState.FirstClone[witch.GetBaseIndex()] <- true;
			witch.SetRawHealth(500);
			splitAmount = 2;
		}
		else if ( SessionState.WitchSplitLevel == 2 )
		{
			SessionState.SpecialCloned[witch.GetBaseIndex()] <- true;
			witch.SetRawHealth(250);
			splitAmount = 3;
		}
		
		if ( SessionState.WitchesSplit < splitAmount )
		{
			SessionState.WitchesSplit++;
			
			if ( SessionState.WitchesSplit == splitAmount )
			{
				SessionState.AllowWitchSplit = false;
				SessionState.WitchesSplit = 0;
			}
		}
	}
	else
	{
		SessionState.NonClone[witch.GetBaseIndex()] <- true;
	}
}

function Notifications::OnSpawn::InfectedSpawn( player, params )
{
	local splitAmount = 0;
	if ( player.GetType() == Z_BOOMER )
	{
		if ( SessionState.AllowBoomerSplit )
		{
			if ( SessionState.BoomerSplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				splitAmount = 2;
			}
			else if ( SessionState.BoomerSplitLevel == 2 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				player.SetHealth(player.GetHealth() / 2);
				splitAmount = 3;
			}
			
			if ( SessionState.BoomersSplit < splitAmount )
			{
				SessionState.BoomersSplit++;
				
				if ( SessionState.BoomersSplit == splitAmount )
				{
					SessionState.AllowBoomerSplit = false;
					SessionState.BoomersSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
		}
	}
	if ( player.GetType() == Z_SMOKER )
	{
		if ( SessionState.AllowSmokerSplit )
		{
			if ( SessionState.SmokerSplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				splitAmount = 2;
			}
			else if ( SessionState.SmokerSplitLevel == 2 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				player.SetHealth(player.GetHealth() / 2);
				splitAmount = 3;
			}
			
			if ( SessionState.SmokersSplit < splitAmount )
			{
				SessionState.SmokersSplit++;
				
				if ( SessionState.SmokersSplit == splitAmount )
				{
					SessionState.AllowSmokerSplit = false;
					SessionState.SmokersSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
		}
	}
	if ( player.GetType() == Z_HUNTER )
	{
		if ( SessionState.AllowHunterSplit )
		{
			if ( SessionState.HunterSplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				splitAmount = 2;
			}
			else if ( SessionState.HunterSplitLevel == 2 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				splitAmount = 3;
			}
			
			if ( SessionState.HuntersSplit < splitAmount )
			{
				SessionState.HuntersSplit++;
				
				if ( SessionState.HuntersSplit == splitAmount )
				{
					SessionState.AllowHunterSplit = false;
					SessionState.HuntersSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
		}
	}
	if ( player.GetType() == Z_CHARGER )
	{
		if ( SessionState.AllowChargerSplit )
		{
			if ( SessionState.ChargerSplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				player.SetHealth(400);
				splitAmount = 2;
			}
			else if ( SessionState.ChargerSplitLevel == 2 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				player.SetHealth(250);
				splitAmount = 3;
			}
			
			if ( SessionState.ChargersSplit < splitAmount )
			{
				SessionState.ChargersSplit++;
				
				if ( SessionState.ChargersSplit == splitAmount )
				{
					SessionState.AllowChargerSplit = false;
					SessionState.ChargersSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
		}
	}
	if ( player.GetType() == Z_SPITTER )
	{
		if ( SessionState.AllowSpitterSplit )
		{
			if ( SessionState.SpitterSplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				splitAmount = 2;
			}
			else if ( SessionState.SpitterSplitLevel == 2 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				splitAmount = 3;
			}
			
			if ( SessionState.SpittersSplit < splitAmount )
			{
				SessionState.SpittersSplit++;
				
				if ( SessionState.SpittersSplit == splitAmount )
				{
					SessionState.AllowSpitterSplit = false;
					SessionState.SpittersSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
		}
	}
	if ( player.GetType() == Z_JOCKEY )
	{
		if ( SessionState.AllowJockeySplit )
		{
			if ( SessionState.JockeySplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				player.SetHealth(200);
				splitAmount = 2;
			}
			else if ( SessionState.JockeySplitLevel == 2 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				player.SetHealth(150);
				splitAmount = 3;
			}
			
			if ( SessionState.JockeysSplit < splitAmount )
			{
				SessionState.JockeysSplit++;
				
				if ( SessionState.JockeysSplit == splitAmount )
				{
					SessionState.AllowJockeySplit = false;
					SessionState.JockeysSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
		}
	}
	if ( player.GetType() == Z_TANK )
	{
		if ( SessionState.AllowTankSplit )
		{
			if ( SessionState.TankSplitLevel == 1 )
			{
				SessionState.FirstClone[player.GetBaseIndex()] <- true;
				player.SetHealth(2000);
				splitAmount = 2;
			}
			else if ( SessionState.TankSplitLevel == 2 )
			{
				SessionState.SecondClone[player.GetBaseIndex()] <- true;
				player.SetHealth(750);
				splitAmount = 4;
			}
			else if ( SessionState.TankSplitLevel == 3 )
			{
				SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
				player.SetHealth(500);
				splitAmount = 3;
			}
			
			if ( SessionState.TanksSplit < splitAmount )
			{
				SessionState.TanksSplit++;
				
				if ( SessionState.TanksSplit == splitAmount )
				{
					SessionState.AllowTankSplit = false;
					SessionState.TanksSplit = 0;
				}
			}
		}
		else
		{
			SessionState.NonClone[player.GetBaseIndex()] <- true;
			SessionState.TankInPlay = true;
			player.SetHealth(3000);
		}
	}
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker )
	{
		local nonClone = false;
		local firstClone = false;
		local secondClone = false;
		if ( (victim.GetBaseIndex() in SessionState.SpecialCloned) && (SessionState.SpecialCloned[victim.GetBaseIndex()]) )
		{
			SessionState.SpecialCloned[victim.GetBaseIndex()] <- false;
			//return;
		}
		if ( (victim.GetBaseIndex() in SessionState.NonClone) && (SessionState.NonClone[victim.GetBaseIndex()]) )
		{
			SessionState.NonClone[victim.GetBaseIndex()] <- false;
			nonClone = true;
		}
		if ( (victim.GetBaseIndex() in SessionState.FirstClone) && (SessionState.FirstClone[victim.GetBaseIndex()]) )
		{
			SessionState.FirstClone[victim.GetBaseIndex()] <- false;
			firstClone = true;
		}
		if ( (victim.GetBaseIndex() in SessionState.SecondClone) && (SessionState.SecondClone[victim.GetBaseIndex()]) )
		{
			SessionState.SecondClone[victim.GetBaseIndex()] <- false;
			secondClone = true;
		}
		if ( victim.GetType() != Z_SURVIVOR )
		{
			local splitAmount = 0;
			if ( victim.GetType() == Z_BOOMER )
			{
				if ( nonClone )
				{
					SessionState.BoomerSplitLevel = 1;
					SessionState.AllowBoomerSplit = true;
					SessionOptions.BoomerLimit = 12;
					SessionOptions.TotalBoomers = 12;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.BoomerSplitLevel = 2;
					SessionState.AllowBoomerSplit = true;
					SessionOptions.BoomerLimit = 12;
					SessionOptions.TotalBoomers = 12;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowBoomerSplit = false;
					SessionState.BoomersSplit = 0;
					SessionState.BoomerSplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_SMOKER )
			{
				if ( nonClone )
				{
					SessionState.SmokerSplitLevel = 1;
					SessionState.AllowSmokerSplit = true;
					SessionOptions.SmokerLimit = 12;
					SessionOptions.TotalSmokers = 12;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.SmokerSplitLevel = 2;
					SessionState.AllowSmokerSplit = true;
					SessionOptions.SmokerLimit = 12;
					SessionOptions.TotalSmokers = 12;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowSmokerSplit = false;
					SessionState.SmokersSplit = 0;
					SessionState.SmokerSplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_HUNTER )
			{
				if ( nonClone )
				{
					SessionState.HunterSplitLevel = 1;
					SessionState.AllowHunterSplit = true;
					SessionOptions.HunterLimit = 12;
					SessionOptions.TotalHunters = 12;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.HunterSplitLevel = 2;
					SessionState.AllowHunterSplit = true;
					SessionOptions.HunterLimit = 12;
					SessionOptions.TotalHunters = 12;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowHunterSplit = false;
					SessionState.HuntersSplit = 0;
					SessionState.HunterSplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_CHARGER )
			{
				if ( nonClone )
				{
					SessionState.ChargerSplitLevel = 1;
					SessionState.AllowChargerSplit = true;
					SessionOptions.ChargerLimit = 12;
					SessionOptions.TotalChargers = 12;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.ChargerSplitLevel = 2;
					SessionState.AllowChargerSplit = true;
					SessionOptions.ChargerLimit = 12;
					SessionOptions.TotalChargers = 12;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowChargerSplit = false;
					SessionState.ChargersSplit = 0;
					SessionState.ChargerSplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_SPITTER )
			{
				if ( nonClone )
				{
					SessionState.SpitterSplitLevel = 1;
					SessionState.AllowSpitterSplit = true;
					SessionOptions.SpitterLimit = 12;
					SessionOptions.TotalSpitters = 12;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.SpitterSplitLevel = 2;
					SessionState.AllowSpitterSplit = true;
					SessionOptions.SpitterLimit = 12;
					SessionOptions.TotalSpitters = 12;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowSpitterSplit = false;
					SessionState.SpittersSplit = 0;
					SessionState.SpitterSplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_JOCKEY )
			{
				if ( nonClone )
				{
					SessionState.JockeySplitLevel = 1;
					SessionState.AllowJockeySplit = true;
					SessionOptions.JockeyLimit = 12;
					SessionOptions.TotalJockeys = 12;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.JockeySplitLevel = 2;
					SessionState.AllowJockeySplit = true;
					SessionOptions.JockeyLimit = 12;
					SessionOptions.TotalJockeys = 12;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowJockeySplit = false;
					SessionState.JockeysSplit = 0;
					SessionState.JockeySplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_TANK )
			{
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
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowTankSplit = false;
					SessionState.TanksSplit = 0;
					SessionState.TankSplitLevel = 0;
				}
			}
			if ( victim.GetType() == Z_WITCH )
			{
				if ( nonClone )
				{
					SessionState.WitchSplitLevel = 1;
					SessionState.AllowWitchSplit = true;
					splitAmount = 2;
				}
				else if ( firstClone )
				{
					SessionState.WitchSplitLevel = 2;
					SessionState.AllowWitchSplit = true;
					splitAmount = 3;
				}
				else
				{
					SessionState.AllowWitchSplit = false;
					SessionState.WitchesSplit = 0;
					SessionState.WitchSplitLevel = 0;
				}
			}
			
			if ( splitAmount == 2 )
			{
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( 10, 0, 0 ) );
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( -10, 0, 0 ) );
			}
			else if ( splitAmount == 3 )
			{
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( 10, 0, 0 ) );
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( -10, 0, 0 ) );
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( 20, 0, 0 ) );
			}
			else if ( splitAmount == 4 )
			{
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( 10, 0, 0 ) );
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( -10, 0, 0 ) );
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( 20, 0, 0 ) );
				Utils.SpawnZombie( victim.GetType(), victim.GetLocation() + Vector( -20, 0, 0 ) );
			}
			
			SessionOptions.BoomerLimit = 0;
			SessionOptions.SmokerLimit = 0;
			SessionOptions.HunterLimit = 0;
			SessionOptions.ChargerLimit = 0;
			SessionOptions.SpitterLimit = 0;
			SessionOptions.JockeyLimit = 0;
			SessionOptions.TotalBoomers = 0;
			SessionOptions.TotalSmokers = 0;
			SessionOptions.TotalHunters = 0;
			SessionOptions.TotalChargers = 0;
			SessionOptions.TotalSpitters = 0;
			SessionOptions.TotalJockeys = 0;
		}
	}
	
	local infectedStats = Utils.GetInfectedStats();
	if ( victim.GetType() == Z_TANK && infectedStats.Tanks == 0 )
	{
		SessionState.TankInPlay = false;
		Timers.AddTimer( 6.9, false, AdvanceWave );
	}
	if ( victim.GetType() != Z_TANK && victim.GetType() != Z_WITCH && infectedStats.Specials == 0 )
	{
		Timers.AddTimer( 6.9, false, AdvanceWave );
	}
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
