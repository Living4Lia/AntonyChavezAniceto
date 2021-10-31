//-----------------------------------------------------
Msg("Activating Left 4 Gun Game: Tank Splitters\n");
Msg("Made by Rayman1103\n");

IncludeScript("tanksplitters");
IncludeScript("gungame_base");

GunGameOptions <-
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
}

GunGameState <-
{
	SpawnTank = false
	TriggerRescue = false
	AllowTankSplit = false
	TanksSplit = 0
	TankSplitLevel = 0
	SpecialCloned = {}
	NonClone = {}
	FirstClone = {}
	SecondClone = {}
	HPRegenTime = 3.0
}

AddDefaultsToTable( "GunGameOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "GunGameState", g_ModeScript, "MutationState", g_ModeScript );

::TankDeathCheck <- function ( args )
{
	if ( Utils.GetInfectedStats().Tanks == 0 )
	{
		SessionState.AllowTankSplit = false;
		SessionState.TanksSplit = 0;
		SessionState.TankSplitLevel = 0;
		Timers.AddTimer( 10.0, false, SpawnTank );
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
			damageTable.DamageDone = 2000;
		}
		if ( attacker.GetTeam() == SURVIVORS && victim.GetTeam() == SURVIVORS )
		{
			return false;
		}
		if ( victim.GetType() == Z_TANK )
		{
			if ( damageTable.Weapon.GetClassname() == "weapon_melee" )
			{
				damageTable.DamageDone = 6000;
			}
			if ( damageTable.Weapon.GetClassname() == "weapon_chainsaw" )
			{
				damageTable.DamageDone = 500;
			}
		}
		if ( attacker.GetType() == Z_TANK && victim.GetTeam() == SURVIVORS )
		{
			damageTable.DamageDone = 10;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function EasyLogic::OnTakeDamage::GunGameDamage( damageTable )
{
	//Intentionally left blank to override function in gungame_base.nut
}

function Notifications::OnPlayerVomited::InfectedVomited( victim, attacker, params )
{
	if ( victim.GetType() == Z_TANK )
	{
		Timers.AddTimer(5.0, false, KillInfected, { infected = victim, attacker = attacker });
	}
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	//Intentionally left blank to override function in tanksplit.nut
}
