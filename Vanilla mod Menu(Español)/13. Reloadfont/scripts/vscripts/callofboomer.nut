//-----------------------------------------------------
Msg("Activating Call of Boomer\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 40
	cm_DominatorLimit = 6
	cm_MaxSpecials = 6
	cm_SpecialRespawnInterval = 10
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	//ShouldAllowMobsWithTank = true
	ShouldAllowSpecialsWithTank = true
	SurvivorMaxIncapacitatedCount = 1
	ZombieTankHealth = 1 //10
	MobMinSize = 15
	MobMaxSize = 20
	InfectedFlags = INFECTED_FLAG_CANT_SEE_SURVIVORS | INFECTED_FLAG_CANT_HEAR_SURVIVORS | INFECTED_FLAG_CANT_FEEL_SURVIVORS
	
	SmokerLimit = 0
	BoomerLimit = 6
	HunterLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0

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
		weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
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
	
	DefaultItems =
	[
		"weapon_smg_silenced",
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
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	try
	{
		local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
		local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
		if ( attacker.GetClassname() == "infected" || attacker.GetType() == Z_BOOMER )
		{
			ScriptedDamageInfo.DamageDone = 1;
			return true;
		}
		if ( attacker.IsSurvivor() )
		{
			if ( victim.GetType() == Z_BOOMER || victim.GetType() == Z_TANK )
				return false;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function EasyLogic::OnBash::AllowBash( attacker, victim )
{
	if ( attacker.GetType() == Z_SURVIVOR && victim.GetClassname() == "infected" )
		return ALLOW_BASH_PUSHONLY;
}

function Notifications::OnPlayerVomited::SpawnTank( victim, boomer, params )
{
	if ( victim.IsSurvivor() )
	{
		Msg("Spawning Tank!\n");
		
		SessionOptions.TankLimit <- 6;
		SessionOptions.cm_TankLimit <- 6;
		Utils.SpawnZombie( Z_TANK, null );
	}
}

function Notifications::OnIncapacitated::ReviveSurvivor( victim, attacker, params )
{
	if ( victim.IsSurvivor() )
		victim.Revive();
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
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
