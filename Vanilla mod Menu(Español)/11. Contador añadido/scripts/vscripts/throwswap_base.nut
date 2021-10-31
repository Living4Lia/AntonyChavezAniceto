//-----------------------------------------------------

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
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
		//"weapon_pipe_bomb",
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

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) && victim.GetTeam() != SURVIVORS )
		{
			if ( victim.GetClassname() == "infected" )
			{
				damageTable.DamageDone = 1000;
				return true;
			}
			if ( victim.GetClassname() == "witch" )
			{
				damageTable.DamageDone = 200;
				return true;
			}
			if ( victim.GetType() == Z_TANK )
			{
				damageTable.DamageDone = 600;
				return true;
			}
			else
			{
				damageTable.DamageDone = 1000;
				return true;
			}
		}
		if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) && victim.GetTeam() == SURVIVORS )
		{
			return false;
		}
		if ( victim.GetTeam() == SURVIVORS && attacker.GetClassname() == "infected" )
		{
			if ( victim.IsIncapacitated() )
			{
				damageTable.DamageDone = 25;
				return true;
			}
			else
			{
				damageTable.DamageDone = 20;
				return true;
			}
		}
	}
	catch( error )
	{
		
	}
	return true;
}

::ListOfThrowables <-
[
	"molotov"
	"molotov"
	"pipe_bomb"
	"pipe_bomb"
]

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::SwitchThrowable <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetActiveWeapon().GetClassname() == "weapon_molotov" )
		{
			survivor.Remove( "molotov" );
			survivor.Give( "pipe_bomb" );
		}
		else if ( survivor.GetActiveWeapon().GetClassname() == "weapon_pipe_bomb" )
		{
			survivor.Remove( "pipe_bomb" );
			survivor.Give( "molotov" );
		}
	}
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	Utils.RemoveZombieSpawns();
}

function Notifications::OnSurvivorsSpawned::GiveThrowables( amount )
{
	if ( amount != 4 )
		return;
	
	Utils.SanitizeHeldItems();
	local function GiveRandomWeapon( args )
	{
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfThrowables, true);
			survivor.Give(randWep);
		}
	}
	
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(20.0, true, SwitchThrowable);
	Timers.AddTimerByName("HealthRegenTimer", 3.0, true, HealthRegen);
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

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
