//-----------------------------------------------------
Msg("Activating The Last of Us\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AllowSurvivorRescue = false
	cm_BaseCommonAttackDamage = 100
	cm_CommonLimit = 35 //25
	cm_HeadshotOnly = 1
	cm_ShouldHurry = 1
	cm_MaxSpecials = 0
	cm_DominatorLimit = 0
	AlwaysAllowWanderers = true
	NumReservedWanderers = 40 //30
	PreferredMobDirection = SPAWN_ANYWHERE
	//SurvivorMaxIncapacitatedCount = 4 //99
	//MegaMobSize = 15 //testing 15
	//MegaMobMinSize = 15 //testing 15
	//MegaMobMaxSize = 15 //testing 20
	//MobMinSize = 10 //15
	//MobMaxSize = 10 //15
	//MobSpawnMinTime = 999999
	//MobSpawnMaxTime = 999999
	//MobSpawnSize = 5 //15
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	
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

MutationState <-
{
	AdjustGasCansPoured = 0
	AdjustNumCansNeeded = -1
	CurrentStage = -1
	FinaleStarted = false
	TriggerRescue = false
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

function GetNextStage()
{
	if ( SessionState.FinaleStarted )
	{
		Msg("GetNextStage() called\n");
		SessionState.CurrentStage++;

		//  stage sequencing
		if ( SessionState.CurrentStage == 0 )
		{
			Msg("Activated STAGE_PANIC\n");
			SessionOptions.ScriptedStageType = STAGE_PANIC
			SessionOptions.ScriptedStageValue = 1
		}
		else if ( SessionState.CurrentStage == 1 )
		{
			Msg("Activated STAGE_DELAY\n");
			SessionOptions.ScriptedStageType = STAGE_DELAY
			SessionOptions.ScriptedStageValue = 15
			SessionState.CurrentStage = -1;
		}
		if ( SessionState.TriggerRescue )
		{
			Msg("Activated STAGE_ESCAPE\n");
			SessionOptions.ScriptedStageType = STAGE_ESCAPE
			SessionState.TriggerRescue = false;
		}
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	try
	{
		if ( Utils.GetDifficulty() == EASY )
		{
			if( damageTable.Attacker.GetClassname() == "infected" && damageTable.Victim.IsSurvivor() )
			{
				ScriptedDamageInfo.DamageDone = 15
				return true
			}
		}
		else if ( Utils.GetDifficulty() == NORMAL )
		{
			if( damageTable.Attacker.GetClassname() == "infected" && damageTable.Victim.IsSurvivor() )
			{
				ScriptedDamageInfo.DamageDone = 24
				return true
			}
		}
		else if ( Utils.GetDifficulty() == ADVANCED )
		{
			if( damageTable.Attacker.GetClassname() == "infected" && damageTable.Victim.IsSurvivor() )
			{
				ScriptedDamageInfo.DamageDone = 33
				return true
			}
		}
		else if ( Utils.GetDifficulty() == EXPERT )
		{
			if( damageTable.Attacker.GetClassname() == "infected" && damageTable.Victim.IsSurvivor() )
			{
				ScriptedDamageInfo.DamageDone = 69
				return true
			}
		}
	}
	catch( error )
	{
		
	}
	return true
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
		AliveSurvivor.Amount--;
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
		AliveSurvivor.Amount--;
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
		AliveSurvivor.Amount--;
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
		AliveSurvivor.Amount--;
	}
	if ( AliveSurvivor.Amount == 3 )
	{
		if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
		{
			SessionState.AdjustNumCansNeeded = NumCansNeeded;
			SessionState.AdjustNumCansNeeded -= 2;
			EntFire( "game_scavenge_progress_display", "SetTotalItems", SessionState.AdjustNumCansNeeded );
			g_ModeScript.SearchNumCansNeeded();
		}
	}
	else if ( AliveSurvivor.Amount == 2 )
	{
		if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
		{
			SessionState.AdjustNumCansNeeded -= 2;
			EntFire( "game_scavenge_progress_display", "SetTotalItems", SessionState.AdjustNumCansNeeded );
			g_ModeScript.SearchNumCansNeeded();
		}
	}
	else if ( AliveSurvivor.Amount == 1 )
	{
		if ( Entities.FindByClassname( null, "game_scavenge_progress_display" ) )
		{
			SessionState.AdjustNumCansNeeded -= 2;
			EntFire( "game_scavenge_progress_display", "SetTotalItems", SessionState.AdjustNumCansNeeded );
			g_ModeScript.SearchNumCansNeeded();
		}
	}
	if ( Utils.GetCampaign() == THE_SACRIFICE && AliveSurvivor.Amount == 1 )
	{
		Say( null, "Survivors Failed: You need at least 2 living Survivors in order to complete this Campaign.", false );
		foreach ( survivor in Players.AliveSurvivors() )
			survivor.Kill();
	}
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "addoutput", "count 1" );
	EntFire( "weapon_melee_spawn", "addoutput", "count 1" );
	EntFire( "weapon_pistol_spawn", "addoutput", "count 1" );
	EntFire( "weapon_pistol_magnum_spawn", "addoutput", "count 1" );
	EntFire( "weapon_pumpshotgun_spawn", "addoutput", "count 1" );
	EntFire( "weapon_shotgun_chrome_spawn", "addoutput", "count 1" );
	EntFire( "weapon_smg_spawn", "addoutput", "count 1" );
	EntFire( "weapon_smg_silenced_spawn", "addoutput", "count 1" );
	EntFire( "weapon_hunting_rifle_spawn", "addoutput", "count 1" );
	EntFire( "weapon_sniper_military_spawn", "addoutput", "count 1" );
	EntFire( "weapon_autoshotgun_spawn", "addoutput", "count 1" );
	EntFire( "weapon_shotgun_spas_spawn", "addoutput", "count 1" );
	EntFire( "weapon_rifle_spawn", "addoutput", "count 1" );
	EntFire( "weapon_rifle_ak47_spawn", "addoutput", "count 1" );
	EntFire( "weapon_rifle_desert_spawn", "addoutput", "count 1" );
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
	
	Say( null, "You are THE LAST OF US. Dying in the game is dying forever...", false );
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
	
	Utils.RemoveFootLockers();
	
	EntFire( "info_director", "FireConceptToAny", "PlayerWarnCareful" );
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
		foreach ( info_director in Objects.OfClassname( "info_director" ) )
			info_director.ConnectOutput( "OnTeamScored", AdjustScores );
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
}

function SearchNumCansNeeded()
{
	if ( SessionState.AdjustGasCansPoured >= SessionState.AdjustNumCansNeeded )
	{
		Msg(" needed: " + SessionState.AdjustNumCansNeeded + "\n") 
		EntFire( "relay_car_ready", "trigger" )
	}
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
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
