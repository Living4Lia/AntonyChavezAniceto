//-----------------------------------------------------
Msg("Activating Special Aid\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_TempHealthOnly = 1
	cm_AllowPillConversion = 0
	cm_ShouldHurry = 1
	cm_AggressiveSpecials = 1
	//cm_AutoReviveFromSpecialIncap = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 10
	cm_MaxSpecials = 10
	cm_ProhibitBosses = false
	cm_SpecialRespawnInterval = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SpecialInfectedAssault = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	SurvivorMaxIncapacitatedCount = 1

	SmokerLimit = 2
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	ChargerLimit = 2
	WitchLimit = 0
	cm_WitchLimit = 0
	
	weaponsToRemove =
	{
		weapon_defibrillator = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
		weapon_vomitjar = 0
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
		if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) && !victim.IsSurvivor() )
		{
			if ( victim.GetType() == Z_TANK )
				damageTable.DamageDone = 250;
			else
				damageTable.DamageDone = 1000;
			return true;
		}
		if ( attacker.GetTeam() == SURVIVORS && victim.GetTeam() == SURVIVORS )
		{
			return false;
		}
	}
	catch( error )
	{
		
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
	Say( null, "Kill baddies to get health. If hp reachs 0 you incap, if black and white you die. Tank kills refresh the group.", false );
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnTankKilled::RegenHealth( tank, attacker, params )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		survivor.Revive();
		survivor.SetHealthBuffer( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
	Utils.PlaySoundToAll("Gallery.GnomeFTW");
}

function Notifications::OnDeath::RegenHealth( victim, attacker, params )
{
	if ( attacker.IsSurvivor() )
	{
		if ( attacker.GetHealthBuffer() <= 75 )
		{
			attacker.SetHealthBuffer( attacker.GetHealthBuffer() + 25 );
		}
		else
		{
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
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
