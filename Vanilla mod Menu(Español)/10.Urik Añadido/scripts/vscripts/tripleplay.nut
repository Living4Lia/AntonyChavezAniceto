//-----------------------------------------------------
Msg("Activating Three Throws\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	ActiveChallenge = 1
	cm_AllowSurvivorRescue = 0
	cm_CommonLimit = 0
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_SpecialRespawnInterval = 3
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
		//"weapon_molotov",
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
	HPRegenTime = 2.0
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local DMG_PIPEBOMB = 134217792;
	local attacker = Entity(damageTable.Attacker);
	local victim = Entity(damageTable.Victim);
	if ( attacker.IsPlayer() )
		attacker = Player(damageTable.Attacker);
	if ( victim.IsPlayer() )
		victim = Player(damageTable.Victim);
	try
	{
		if( damageTable.DamageType == DMG_PIPEBOMB && victim.GetTeam() != SURVIVORS )
		{
			if( victim.GetClassname() == "infected" )
			{
				damageTable.DamageDone = 1000
				return true
			}
			if( victim.GetClassname() == "witch" )
			{
				damageTable.DamageDone = 200
				return true
			}
			if( victim.IsPlayer() )
			{
				if( victim.GetPlayerType() == Z_TANK )
				{
					damageTable.DamageDone = 600
					return true
				}
				else
				{
					damageTable.DamageDone = 1000
					return true
				}
			}
		}
		if( damageTable.DamageType == DMG_PIPEBOMB && victim.GetTeam() == SURVIVORS )
		{
			return false
		}
		if ( victim.GetTeam() == SURVIVORS && attacker.GetClassname() == "infected" )
		{
			if ( Player(damageTable.Victim).IsIncapacitated() )
			{
				damageTable.DamageDone = 25;
				return true
			}
			else
			{
				damageTable.DamageDone = 20;
				return true
			}
		}
	}
	catch( error )
	{
		
	}
	return true
}

::ListOfThrowables <-
[
	"molotov"
	"pipe_bomb"
	"vomitjar"
]

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "prop_minigun", "Kill" );
	EntFire( "prop_minigun_l4d1", "Kill" );
	EntFire( "prop_mounted_machine_gun", "Kill" );
	Utils.RemoveZombieSpawns();
}

::GiveThrowable <- function ( args )
{
	printf("Changing Weapons") // printf will automatically add \n to the end
	
	// Sanitizing weapons usually takes 1 game frame (because EntFire
	// sends inputs which are processed the next game frame).
	Utils.SanitizeHeldItems();
	
	// Thus, we can't sanitize weapons AND give the players weapons on the same game frame.
	// So what we need to do is add a small delay before giving them new weapons.
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfThrowables);
			survivor.Give(randWep);
		}
	}
	
	// A 0.1 second delay is wayyy more than enough time after sanitizing weapons
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
}

function Notifications::OnSurvivorsSpawned::GiveThrowables( amount )
{
	if ( amount != 4 )
		return;
	
	printf("Changing Weapons") // printf will automatically add \n to the end
	
	// Sanitizing weapons usually takes 1 game frame (because EntFire
	// sends inputs which are processed the next game frame).
	Utils.SanitizeHeldItems();
	
	// Thus, we can't sanitize weapons AND give the players weapons on the same game frame.
	// So what we need to do is add a small delay before giving them new weapons.
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfThrowables);
			survivor.Give(randWep);
		}
	}
	
	// A 0.1 second delay is wayyy more than enough time after sanitizing weapons
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(20.0, true, GiveThrowable);
	Timers.AddTimerByName("HealthRegenTimer", SessionState.HPRegenTime, true, HealthRegen);
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

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function EasyLogic::Update::Think()
{
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
