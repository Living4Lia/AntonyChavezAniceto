//-----------------------------------------------------
Msg("Activating Air Raid\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_CommonLimit = 0
	cm_AutoReviveFromSpecialIncap = 1
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_SpecialRespawnInterval = 5
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	cm_AggressiveSpecials = 1

	BoomerLimit = 3
	SmokerLimit = 3
	HunterLimit = 3
	ChargerLimit = 2
	SpitterLimit = 1
	JockeyLimit = 2

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_first_aid_kit = "weapon_pain_pills_spawn"
		ammo = "weapon_upgradepack_explosive_spawn"
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
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_chainsaw = 0
		weapon_defibrillator = 0
		weapon_melee = 0
		weapon_upgradepack_explosive = 0
		upgrade_item = 0
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
		"weapon_pistol_magnum"
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

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
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
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}	
