//-----------------------------------------------------
Msg("Activating Your Eternal Slumber\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AggressiveSpecials = 0
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 10
	cm_MaxSpecials = 10
	cm_SpecialRespawnInterval = 20
	
	MobMaxPending = 0
	ShouldAllowSpecialsWithTank = true
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	
	SmokerLimit = 2
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 2
	JockeyLimit = 1
	ChargerLimit = 1
	//WitchLimit = 0
	//cm_WitchLimit = 0
	
	weaponsToRemove =
	{
		weapon_pipe_bomb = 0
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

MutationState <-
{
	AdjustGasCansPoured = 0
	AdjustNumCansNeeded = -1
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

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( attacker.GetClassname() == "witch" && victim.GetTeam() == SURVIVORS )
	{
		ScriptedDamageInfo.DamageDone = 15;
		return true;
	}
	return true;
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
	if ( g_ModeScript.AliveSurvivor.Amount == 3 )
	{
		if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
		{
			SessionState.AdjustNumCansNeeded = NumCansNeeded;
			SessionState.AdjustNumCansNeeded -= 2;
			EntFire( "game_scavenge_progress_display", "SetTotalItems", SessionState.AdjustNumCansNeeded );
			g_ModeScript.SearchNumCansNeeded();
		}
		Convars.SetValue( "z_tank_health", "2000" );
		Convars.SetValue( "z_witch_health", "850" );
		
		local random_chance = RandomInt( 0, 1 );
		if ( random_chance == 0 )
		{
			SessionOptions.SmokerLimit = 1;
			SessionOptions.BoomerLimit = 1;
			SessionOptions.cm_DominatorLimit -= 2;
			SessionOptions.cm_MaxSpecials -= 2;
		}
		else if ( random_chance == 1 )
		{
			SessionOptions.HunterLimit = 1;
			SessionOptions.SpitterLimit = 1;
			SessionOptions.cm_DominatorLimit -= 2;
			SessionOptions.cm_MaxSpecials -= 2;
		}
	}
	else if ( g_ModeScript.AliveSurvivor.Amount == 2 )
	{
		if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
		{
			SessionState.AdjustNumCansNeeded -= 2;
			EntFire( "game_scavenge_progress_display", "SetTotalItems", SessionState.AdjustNumCansNeeded );
			g_ModeScript.SearchNumCansNeeded();
		}
		Convars.SetValue( "z_tank_health", "1500" );
		Convars.SetValue( "z_witch_health", "700" );
		
		SessionOptions.SmokerLimit = 1;
		SessionOptions.BoomerLimit = 1;
		SessionOptions.HunterLimit = 1;
		SessionOptions.SpitterLimit = 1;
		SessionOptions.JockeyLimit = 1;
		SessionOptions.ChargerLimit = 1;
		SessionOptions.cm_DominatorLimit = 6;
		SessionOptions.cm_MaxSpecials = 6;
		SessionOptions.cm_SpecialRespawnInterval = 25;
	}
	else if ( g_ModeScript.AliveSurvivor.Amount == 1 )
	{
		if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
		{
			SessionState.AdjustNumCansNeeded -= 2;
			EntFire( "game_scavenge_progress_display", "SetTotalItems", SessionState.AdjustNumCansNeeded );
			g_ModeScript.SearchNumCansNeeded();
		}
		Convars.SetValue( "z_tank_health", "1000" );
		Convars.SetValue( "z_witch_health", "500" );
		
		SessionOptions.SmokerLimit = 1;
		SessionOptions.BoomerLimit = 1;
		SessionOptions.HunterLimit = 1;
		SessionOptions.SpitterLimit = 1;
		SessionOptions.JockeyLimit = 1;
		SessionOptions.ChargerLimit = 1;
		SessionOptions.cm_DominatorLimit = 4;
		SessionOptions.cm_MaxSpecials = 4;
		SessionOptions.cm_SpecialRespawnInterval = 30;
	}
	if ( Utils.GetCampaign() == THE_SACRIFICE && g_ModeScript.AliveSurvivor.Amount == 1 )
	{
		Say( null, "Survivors Failed: You need at least 2 living Survivors in order to complete this Campaign.", false );
		foreach ( survivor in Players.AliveSurvivors() )
			survivor.Kill();
	}
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	Utils.RemoveZombieSpawns();
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
	
	Say( null, "Your Eternal Slumber is at hand, don't be killed or you'll never ever be coming back... like ever.", false );
}

function Notifications::OnRoundStart::SurvivorCheck()
{
	RestoreTable( "DeadSurvivors", DeadSurvivor )
	//RestoreTable( "AliveSurvivors", AliveSurvivor )
}

function Notifications::OnMapEnd::SaveInfo()
{
	SaveTable( "DeadSurvivors", DeadSurvivor )
	//SaveTable( "AliveSurvivors", AliveSurvivor )
}

function Notifications::OnSurvivorsLeftStartArea::ScavengeFinaleCheck()
{
	if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
	{
		foreach (info_director in Objects.OfClassname("info_director"))
		{
			info_director.ConnectOutput( "OnTeamScored", AdjustScores );
		}
	}
}

function AdjustScores()
{
	Msg("Activated AdjustScores()\n");
	EntFire( "info_director", "RunScriptCode", DirectorScript.MapScript.LocalScript.AdjustGasCanPoured() );
}

::AdjustGasCanPoured <- function ()
{
	SessionState.AdjustGasCansPoured++

	if ( SessionState.AdjustGasCansPoured == SessionState.AdjustNumCansNeeded )
	{
		Msg(" needed: " + SessionState.AdjustNumCansNeeded + "\n") 
		EntFire( "relay_car_ready", "trigger" )
	}

	//EvalGasCansPouredOrTouched()
}

function SearchNumCansNeeded()
{
	if ( SessionState.AdjustGasCansPoured >= SessionState.AdjustNumCansNeeded )
	{
		Msg(" needed: " + SessionState.AdjustNumCansNeeded + "\n") 
		EntFire( "relay_car_ready", "trigger" )
	}
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
