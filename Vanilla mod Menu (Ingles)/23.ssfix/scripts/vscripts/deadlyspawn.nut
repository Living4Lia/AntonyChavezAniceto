//-----------------------------------------------------
Msg("Activating Deadly Spawn\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 10
	cm_MaxSpecials = 10
	cm_SpecialRespawnInterval = 0
	cm_SpecialSlotCountdownTime = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	//cm_ProhibitBosses = true
	SpecialInfectedAssault = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	//ShouldAllowSpecialsWithTank = true
	//ZombieTankHealth = 5000
	FarAcquireRange = 999999
	NearAcquireRange = 999999
	FarAcquireTime = 0.0
	NearAcquireTime = 0.0
	
	BoomerLimit = 2
	SmokerLimit = 2
	HunterLimit = 2
	ChargerLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	
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
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_chainsaw = 0
		weapon_defibrillator = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
		weapon_melee = 0
		weapon_upgradepack_explosive = 0
		weapon_upgradepack_incendiary = 0
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
		"weapon_rifle_m60",
		"weapon_pistol_magnum",
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
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.75 // pain_pills_decay_rate default 0.27
		}
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
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
		survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
	}
	Say( null, "If your temporary health drains to zero you will be incapped, if black and white you will die.", false );
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker && victim.GetType() != Z_COMMON && victim.GetType() != Z_SURVIVOR )
	{
		local amount = 10;
		local vectorOverride = 10;
		if ( victim.GetType() == Z_BOOMER )
		{
			foreach( infected in Players.Infected() )
			{
				if ( infected.GetType() != Z_TANK )
					infected.Kill();
			}
			amount = 20;
		}
		if ( victim.GetType() == Z_TANK )
		{
			amount = 60;
		}
		if ( victim.GetType() == Z_WITCH )
		{
			amount = 40;
		}
			
		for ( local i = 0; i < amount; i++ )
		{
			Utils.SpawnZombie( Z_COMMON, victim.GetLocation() + Vector( vectorOverride, 0, 0 ) );
			vectorOverride += 10;
		}
		foreach( infected in Zombies.CommonInfected() )
			infected.SetNetProp("m_mobRush", 1);
	}
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetHealth() <= 1 && survivor.GetIncapacitatedCount() > 0 )
			survivor.Incapacitate();
	}
}
