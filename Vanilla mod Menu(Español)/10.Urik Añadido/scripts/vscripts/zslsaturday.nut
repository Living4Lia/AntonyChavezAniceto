//-----------------------------------------------------
Msg("Activating Saturday Night Tankball!!\n");
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
	cm_MaxSpecials = 0
	cm_DominatorLimit = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 8
	cm_TankLimit = 8
	cm_AggressiveSpecials = 1
	cm_AllowSurvivorRescue = 0
	ProhibitBosses = false
	TankHitDamageModifierCoop = 0.5
	EscapeSpawnTanks = true
	SurvivorMaxIncapacitatedCount = 0

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

ZSLState <-
{
	IsRaceEvent = false
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
	try
	{
		local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
		local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
		if ( attacker.IsSurvivor() && victim.GetType() == Z_TANK )
		{
			return false;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnTankSpawned::ZSLSetTankModel( tank, params )
{
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

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
	Timers.AddTimer( 30.0, true, SpawnTank );
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
