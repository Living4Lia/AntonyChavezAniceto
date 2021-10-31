//-----------------------------------------------------
Msg("Activating Death Clock: Tanks\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("deathclock_base");

DeathClockOptions <-
{
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	//TankHitDamageModifierCoop = 0.08
	SurvivorMaxIncapacitatedCount = 0
	TankLimit = 10
	cm_TankLimit = 10
	WitchLimit = 0
	cm_WitchLimit = 0
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		ammo =	"weapon_molotov_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
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
		//weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		upgrade_item = 0
		//ammo = 0
	}
}

DeathClockState <-
{
	SpawnTank = false
	TriggerRescue = false
}

AddDefaultsToTable( "DeathClockOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "DeathClockState", g_ModeScript, "MutationState", g_ModeScript );

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
		if ( damageTable.Attacker.GetZombieType() == 8 && damageTable.DamageType == DMG_CLUB && damageTable.Victim.IsSurvivor() )
		{
			ScriptedDamageInfo.DamageDone = 2
			return true
		}
	}
	catch( error )
	{
		
	}
	return true
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "finale_cleanse_entrance_door", "lock" );
	EntFire( "finale_cleanse_exit_door", "unlock" );
	EntFire( "ceda_trailer_canopen_frontdoor_listener", "kill" );
	EntFire( "finale_cleanse_backdoors_blocker", "kill" );
	EntFire( "radio_fake_button", "press" );
	EntFire( "drawbridge", "movetofloor", "bottom" );
	EntFire( "drawbridge_start_sound", "playsound" );
	EntFire( "startbldg_door_button", "press" );
	EntFire( "startbldg_door", "open" );
	EntFire( "elevator", "movetofloor", "bottom" );
	EntFire( "elevator_pulley", "start" );
	EntFire( "elevator_pulley2", "start" );
	EntFire( "elevbuttonoutsidefront", "skin", "1" );
	EntFire( "sound_elevator_startup", "playsound" );
	EntFire( "elevator_start_shake", "startshake" );
	EntFire( "elevator_number_relay", "trigger" );
	EntFire( "elevator_breakwalls", "kill" );
	EntFire( "elevator_game_event", "kill" );
	
	EntFire( "spawn_church_zombie", "addoutput", "population tank" );
	
	EntFire( "info_director", "FireConceptToAny", "PlayerHurryUp" );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	SpawnTank(null);
	Timers.AddTimer( 10.0, true, SpawnTank );
}

::FinaleStarted <- function ()
{
	SessionState.TriggerRescue = true;
	Director.ForceNextStage();
	if ( Entities.FindByName( null, "relay_car_ready" ) )
		EntFire( "relay_car_ready", "Trigger" );
}

::SpawnTank <- function ( args )
{
	SessionState.SpawnTank = true;
	Director.ForceNextStage();
}
