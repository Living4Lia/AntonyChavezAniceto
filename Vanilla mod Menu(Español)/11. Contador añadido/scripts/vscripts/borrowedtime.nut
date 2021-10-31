//-----------------------------------------------------
Msg("Activating Borrowed Time\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_TempHealthOnly = 1
	cm_AllowPillConversion = 0
	cm_ShouldHurry = 1
	SurvivorMaxIncapacitatedCount = 1
	
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
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.75 // pain_pills_decay_rate default 0.27
		}
	}
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
			if ( attacker.GetHealthBuffer() <= 98 )
				attacker.SetHealthBuffer( attacker.GetHealthBuffer() + 2 );
			else
				attacker.SetHealthBuffer( 100 );
		}
		else if ( victim.GetType() == Z_TANK )
		{
			foreach ( survivor in Players.AliveSurvivors() )
			{
				if ( survivor.GetHealthBuffer() <= 50 )
					survivor.SetHealthBuffer( survivor.GetHealthBuffer() + 50 );
				else
					survivor.SetHealthBuffer( 100 );
			}
		}
		else if ( victim.GetType() == Z_WITCH )
		{
			foreach ( survivor in Players.AliveSurvivors() )
			{
				if ( survivor.GetHealthBuffer() <= 70 )
					survivor.SetHealthBuffer( survivor.GetHealthBuffer() + 30 );
				else
					survivor.SetHealthBuffer( 100 );
			}
		}
		else
		{
			if ( attacker.GetHealthBuffer() <= 80 )
				attacker.SetHealthBuffer( attacker.GetHealthBuffer() + 20 );
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
