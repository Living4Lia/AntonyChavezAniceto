//-----------------------------------------------------
Msg("Activating Witchcraft\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

foreach( worldspawn in Objects.OfClassname( "worldspawn" ) )
	worldspawn.SetKeyValue( "timeofday", 2 );

MutationOptions <-
{
	AllowWitchesInCheckpoints = true
	cm_ProhibitBosses = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 30
	cm_WitchLimit = 30

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_vomitjar =	"weapon_molotov_spawn"
		ammo =	"upgrade_laser_sight"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
	DefaultItems =
	[
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
}

MutationState <-
{
	WitchWarping = {}
}

::SpawnWitch <- function ( args )
{
	Msg("Spawning Witch!\n");
	local witch = Z_WITCH;
	
	if ( RandomInt( 0, 1 ) == 1 )
		witch = Z_WITCH_BRIDE;
	
	Utils.SpawnZombie( witch );
}

::WarpBackWitch <- function ( args )
{
	args.witch.SetLocation( args.location );
	args.witch.SetKeyValue( "solid", 2 );
	args.witch.SetKeyValue( "rendermode", 0 );
	args.witch.SetKeyValue( "renderfx", 0 );
	SessionState.WitchWarping[args.witch.GetBaseIndex()] <- false;
}

function EasyLogic::OnTakeDamage::AllowTakeDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) )
	{
		if ( !victim.IsSurvivor() )
		{
			damageTable.DamageDone = 1000;
		}
		if ( attacker.GetTeam() == SURVIVORS && victim.GetTeam() == SURVIVORS )
		{
			return false;
		}
	}
	if ( victim.GetType() == Z_WITCH )
	{
		if ( (victim.GetBaseIndex() in SessionState.WitchWarping) && (SessionState.WitchWarping[victim.GetBaseIndex()]) )
			return false;
	}
	if ( attacker.GetType() == Z_WITCH && victim.IsSurvivor() )
	{
		if ( (attacker.GetBaseIndex() in SessionState.WitchWarping) && (SessionState.WitchWarping[attacker.GetBaseIndex()]) )
			return false;
		
		if ( !victim.IsIncapacitated() )
		{
			if ( Utils.GetDifficulty() == EASY )
				damageTable.DamageDone = 15;
			else if ( Utils.GetDifficulty() == NORMAL )
				damageTable.DamageDone = 20;
			else if ( Utils.GetDifficulty() == ADVANCED )
				damageTable.DamageDone = 25;
			else if ( Utils.GetDifficulty() == EXPERT )
				damageTable.DamageDone = 50;
		}
	}
	return true;
}

::StartleWitch <- function ( args )
{
	if ( !args.witch.IsEntityValid() )
		return;
	
	args.witch.Damage( 0, 0, args.attacker );
}

function Notifications::OnWitchSpawned::WitchSpawn( witch, params )
{
	local validTargets = [];
	foreach ( survivor in Players.AliveSurvivors() )
	{
		if ( !survivor.IsIncapacitated() )
			validTargets.append( survivor );
	}
	
	if ( validTargets.len() == 0 )
		return;
	
	local randomTarget = Utils.GetRandValueFromArray( validTargets );
	
	if ( randomTarget.IsHuman() )
	{
		Timers.AddTimer(0.2, false, StartleWitch, { witch = witch, attacker = randomTarget });
		return;
	}
	
	witch.SetKeyValue( "rendermode", 23 );
	witch.SetKeyValue( "renderfx", 15 );
	witch.SetKeyValue( "solid", 1 );
	local spawnLocation = witch.GetLocation();
	SessionState.WitchWarping[witch.GetBaseIndex()] <- true;
	witch.SetLocation( randomTarget.GetLocation() );
	Timers.AddTimer( 0.4, false, WarpBackWitch, { witch = witch, location = spawnLocation } );
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

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "info_zombie_spawn", "Kill" );
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
}

function Notifications::OnSurvivorsLeftStartArea::CreateWitchTimer()
{
	SpawnWitch(null);
	Timers.AddTimerByName( "NormalWitchTimer", 5.0, true, SpawnWitch );
	
	foreach ( trigger_finale in Objects.OfClassname( "trigger_finale" ) )
		trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
}

::FinaleStarted <- function ()
{
	Timers.RemoveTimerByName( "NormalWitchTimer" );
	SpawnWitch(null);
	Timers.AddTimer( 3.0, true, SpawnWitch );
}

function EasyLogic::OnProcessResponse::RemoveWitchResponses()
{
	local g_witchcraft =
	[
		{
			name = "PlayerWitchStartAttack",
			criteria =
			[
				[ "Concept", "WitchStartAttack" ],
			],
			responses =
			[
				{
					scenename = "",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "PlayerWarnWitchAngry",
			criteria =
			[
				[ "Concept", "WitchGettingAngry" ],
			],
			responses =
			[
				{
					scenename = "",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
	]
	ResponseRules.ProcessRules( g_witchcraft );
}

function EasyLogic::Update::Think()
{
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
