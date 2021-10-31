//-----------------------------------------------------
Msg("Activating Healing Horde\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_TempHealthOnly = 1
	cm_AllowPillConversion = 0
	cm_ShouldHurry = 1
	//cm_AggressiveSpecials = 1
	//cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 20
	//cm_DominatorLimit = 10
	cm_MaxSpecials = 0
	cm_ProhibitBosses = true
	//cm_SpecialRespawnInterval = 0
	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
	//PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	//SpecialInfectedAssault = 1
	//SpecialInitialSpawnDelayMin = 0
	//SpecialInitialSpawnDelayMax = 5
	SurvivorMaxIncapacitatedCount = 1

	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	
	weaponsToRemove =
	{
		weapon_defibrillator = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
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
			TempHealthDecayRate = 1.0 // pain_pills_decay_rate default 0.27
		}
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( victim.GetTeam() == SURVIVORS && attacker.GetClassname() == "infected" )
		{
			damageTable.DamageDone = 20;
			return true;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

::ForcePanic <- function ( args )
{
	Utils.ForcePanicEvent();
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 100 );
		//survivor.SetHealth( 0 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
	Say( null, "Kill baddies to get health. If hp reachs 0 you incap, if black and white you die.", false );
}

function Notifications::OnSurvivorsLeftStartArea::ForcePanicEvent()
{
	if ( !Entities.FindByClassname( null, "trigger_finale" ) )
	{
		Utils.ForcePanicEvent();
		Timers.AddTimer( 15.0, true, ForcePanic );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnDeath::RegenHealth( victim, attacker, params )
{
	if ( attacker.IsSurvivor() )
	{
		if ( victim.GetType() == Z_COMMON )
		{
			if ( attacker.GetHealthBuffer() <= 97.5 )
				attacker.SetHealthBuffer( attacker.GetHealthBuffer() + 2.5 );
			else
				attacker.SetHealthBuffer( 100 );
		}
	}
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetHealthBuffer() <= 1 && !survivor.IsInSafeSpot() )
			survivor.Incapacitate();
	}
}
