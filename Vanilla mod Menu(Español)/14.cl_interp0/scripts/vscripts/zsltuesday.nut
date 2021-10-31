//-----------------------------------------------------
Msg("Activating Tuesday Night Tank Fight!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

Utils.PrecacheModel("models/infected/hulk.mdl");
Utils.PrecacheModel("models/infected/hulk_dlc3.mdl");
Utils.PrecacheModel("models/infected/hulk_l4d1.mdl");

ZSLOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	cm_SpecialRespawnInterval = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 10
	cm_TankLimit = 10
	//cm_TankRun = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 0
	ProhibitBosses = false
	//TankRunSpawnDelay = 0
	cm_AllowSurvivorRescue = 0
	ZombieTankHealth = 1000
	SurvivorMaxIncapacitatedCount = 0

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
		//"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	RandomSecondary =
	[
		"pistol_magnum",
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		return 0;
	}
}

ZSLState <-
{
	IsRaceEvent = false
	SaferoomAward = 1
	TieBreaker = "kills"
	SpawnTank = false
	TriggerRescue = false
	TankModelsBase = [ "models/infected/hulk.mdl", "models/infected/hulk_dlc3.mdl", "models/infected/hulk_l4d1.mdl" ]
	TankModels = [ "models/infected/hulk.mdl", "models/infected/hulk_dlc3.mdl", "models/infected/hulk_l4d1.mdl" ]
	ModelCheck = false
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function GetNextStage()
{
	if ( SessionState.SpawnTank )
	{
		Msg("Spawning Tank!\n");
		SessionOptions.ScriptedStageType = STAGE_TANK
		SessionOptions.ScriptedStageValue = 1
		SessionState.SpawnTank = false;
	}
	else if ( !SessionState.SpawnTank )
	{
		SessionOptions.ScriptedStageType = STAGE_DELAY
		SessionOptions.ScriptedStageValue = -1
	}
	if ( SessionState.TriggerRescue )
	{
		Msg("Triggered STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE
		SessionState.TriggerRescue = false;
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( victim.IsSurvivor() )
	{
		if ( attacker.GetType() == Z_TANK )
		{
			ScriptedDamageInfo.DamageDone = 9;
			return true;
		}
		if ( damageTable.DamageType == (damageTable.DamageType | DMG_BURN) )
		{
			if ( !Director.HasAnySurvivorLeftSafeArea() )
				return true;
			if ( !SessionState.SurvivorInStart[victim.GetCharacterName()] )
				return false;
		}
	}
	return true;
}

::SpawnTankDelay <- function ( args )
{
	SpawnTank(null);
	Timers.AddTimer( 5.0, true, SpawnTank );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	if ( Utils.IsFinale() && SessionState.HasSurvivalFinale )
	{
		Timers.AddTimer( 20.0, false, SpawnTankDelay );
	}
	else
	{
		SpawnTank(null);
		Timers.AddTimer( 7.0, true, SpawnTank );
	}
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

function Notifications::OnRoundStart::DoStuff()
{
	foreach( gascan in Objects.OfModel("models/props_junk/gascan001a.mdl") )
		gascan.Input( "Kill" );
	
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "weapon_molotov", "Kill" );
}

function Notifications::OnTankSpawned::SetHealth( tank, params )
{
	tank.SetMaxHealth( 1000 );
	tank.SetRawHealth( 1000 );
	local modelName = tank.GetModel();
	
	if ( !SessionState.ModelCheck )
	{
		SessionState.ModelCheck = true;
		
		if ( SessionState.TankModelsBase.find( modelName ) == null )
		{
			SessionState.TankModelsBase.append( modelName );
			SessionState.TankModels.append( modelName );
		}
	}
	
	local tankModels = SessionState.TankModels;
	if ( tankModels.len() == 0 )
		SessionState.TankModels.extend( SessionState.TankModelsBase );
	local foundModel = tankModels.find( modelName );
	if ( foundModel != null )
	{
		tankModels.remove( foundModel );
		return;
	}
	
	local randomElement = RandomInt( 0, tankModels.len() - 1 );
	local randomModel = tankModels[ randomElement ];
	tankModels.remove( randomElement );
	tank.SetModel( randomModel );
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( victim.IsSurvivor() )
	{
		foreach( adrenaline in Objects.OfClassname("weapon_adrenaline") )
		{
			if ( adrenaline.GetNetPropEntity( "m_hOwner" ) == null )
				adrenaline.Kill();
		}
	}
}

function Notifications::OnSurvivorsSpawned::GiveMolotov( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		survivor.Give("molotov");
		//if ( survivor.IsHuman() )
			survivor.Give("adrenaline");
	}
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}
