//-----------------------------------------------------
Msg("Activating Dead End\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	weaponsToRemove =
	{
		weapon_defibrillator = 0
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

::DeadSurvivor <-
{
	Coach = false
	Ellis = false
	Nick = false
	Rochelle = false
}

::AliveSurvivor <-
{
	Amount = 4
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		RestoreTable( "DeadSurvivors", DeadSurvivor );
		SaveTable( "DeadSurvivors", DeadSurvivor );
	}
	else if ( reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION )
	{
		if ( nextmap != Utils.GetNextMap() )
			return;
		
		SaveTable( "DeadSurvivors", DeadSurvivor );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetSurvivorCharacter() == COACH )
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "BecomeRagdoll" );
		}
		else if ( !Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "Kill" );
		}
		g_ModeScript.DeadSurvivor.Coach = true;
		g_ModeScript.AliveSurvivor.Amount--;
	}
	else if ( victim.GetSurvivorCharacter() == ELLIS )
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "BecomeRagdoll" );
		}
		else if ( !Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "Kill" );
		}
		g_ModeScript.DeadSurvivor.Ellis = true;
		g_ModeScript.AliveSurvivor.Amount--;
	}
	else if ( victim.GetSurvivorCharacter() == NICK )
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "BecomeRagdoll" );
		}
		else if ( !Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "Kill" );
		}
		g_ModeScript.DeadSurvivor.Nick = true;
		g_ModeScript.AliveSurvivor.Amount--;
	}
	else if ( victim.GetSurvivorCharacter() == ROCHELLE )
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "BecomeRagdoll" );
		}
		else if ( !Director.HasAnySurvivorLeftSafeArea() )
		{
			EntFire( "survivor_death_model", "Kill" );
		}
		g_ModeScript.DeadSurvivor.Rochelle = true;
		g_ModeScript.AliveSurvivor.Amount--;
	}
	if ( Utils.GetCampaign() == THE_SACRIFICE && g_ModeScript.AliveSurvivor.Amount == 1 )
	{
		Say( null, "Survivors Failed: You need at least 2 living Survivors in order to complete this Campaign.", false );
		foreach ( survivor in Players.AliveSurvivors() )
			survivor.Kill();
	}
}

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 4 )
		return;
	
	if ( g_ModeScript.DeadSurvivor.Coach )
	{
		Player("!coach").Kill();
		if ( !Director.HasAnySurvivorLeftSafeArea() )
			EntFire( "player", "CancelCurrentScene" );
	}
	if ( g_ModeScript.DeadSurvivor.Ellis )
	{
		Player("!ellis").Kill();
		if ( !Director.HasAnySurvivorLeftSafeArea() )
			EntFire( "player", "CancelCurrentScene" );
	}
	if ( g_ModeScript.DeadSurvivor.Nick )
	{
		Player("!nick").Kill();
		if ( !Director.HasAnySurvivorLeftSafeArea() )
			EntFire( "player", "CancelCurrentScene" );
	}
	if ( g_ModeScript.DeadSurvivor.Rochelle )
	{
		Player("!rochelle").Kill();
		if ( !Director.HasAnySurvivorLeftSafeArea() )
			EntFire( "player", "CancelCurrentScene" );
	}
	
	Say( null, "If you die there is no coming back, so be careful that this doesn't become your Dead End.", false );
}

function Notifications::OnRoundStart::SurvivorCheck()
{
	RestoreTable( "DeadSurvivors", DeadSurvivor );
}
