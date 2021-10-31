//-----------------------------------------------------
Msg("Activating Disinfected\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_SpecialRespawnInterval = 7
	cm_TankLimit = 10
	cm_WitchLimit = 10
	BoomerLimit = 1
	SmokerLimit = 2
	HunterLimit = 4
	ChargerLimit = 3
	SpitterLimit = 1
	JockeyLimit = 3
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	ShouldAllowSpecialsWithTank = true
	cm_AggressiveSpecials = 1
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	cm_AutoReviveFromSpecialIncap = 1

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
		weapon_defibrillator = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_molotov = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
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
		"weapon_vomitjar",
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

MutationState <-
{
	Spawn2ndTank = true
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( attacker.GetTeam() == INFECTED && ( victim.GetType() >= 1 && victim.GetType() <= 6 ) )
	{
		damageTable.DamageDone = 1000;
		return true;
	}
	return true;
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::KillInfected <- function ( args )
{
	if ( !args.infected.IsEntityValid() )
		return;
	
	args.infected.Kill( DMG_GENERIC, args.attacker );
	
	if ( args.infected.IsAlive() )
		Timers.AddTimer(0.1, false, KillInfected, { infected = args.infected, attacker = args.attacker });
}

::KillWitch <- function ( args )
{
	if ( !args.witch.IsEntityValid() )
		return;
	
	args.witch.Kill( DMG_GENERIC, args.attacker );
}

function Notifications::OnPlayerVomited::InfectedVomited( victim, attacker, params )
{
	if ( victim.GetTeam() == INFECTED )
	{
		local KillTimer = 3.0;
		
		if ( victim.GetType() == Z_TANK )
			KillTimer = 20.0;
		
		Timers.AddTimer(KillTimer, false, KillInfected, { infected = victim, attacker = attacker });
	}
}

function Notifications::OnWitchStartled::WitchVomited( witch, victim, params )
{
	Timers.AddTimer(6.9, false, KillWitch, { witch = witch, attacker = victim });
}

function Notifications::OnTankSpawned::SetHealth( tank, params )
{
	tank.SetKeyValue( "max_health", 1000 );
	tank.SetKeyValue( "health", 1000 );
	
	if ( SessionState.Spawn2ndTank )
	{
		SessionState.Spawn2ndTank = false;
		ZSpawn( { type = Z_TANK, pos = tank.GetLocation() } );
	}
}

function Notifications::OnTankKilled::TankKilled( victim, attacker, params )
{
	SessionState.Spawn2ndTank = true;
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnRoundStart::DoStuff()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
	
	EntFire( "weapon_spawn", "Kill" );
	
	EntFire( "prop_minigun", "Kill" );
	EntFire( "prop_minigun_l4d1", "Kill" );
	EntFire( "prop_mounted_machine_gun", "Kill" );
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
	Timers.AddTimerByName("HealthRegenTimer", 1.0, true, HealthRegen);
}
