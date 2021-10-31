//-----------------------------------------------------
Msg("Activating 3 of a Kind\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheModel( "models/infected/smoker.mdl" );
Utils.PrecacheModel( "models/infected/smoker_l4d1.mdl" );
Utils.PrecacheModel( "models/infected/boomer.mdl" );
Utils.PrecacheModel( "models/infected/boomer_l4d1.mdl" );
Utils.PrecacheModel( "models/infected/boomette.mdl" );
Utils.PrecacheModel( "models/infected/hunter.mdl" );
Utils.PrecacheModel( "models/infected/hunter_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/limbs/exploded_boomette.mdl" ) )
{
	Utils.PrecacheModel( "models/infected/limbs/exploded_boomette.mdl" );
	::three_of_kind_no_female_boomers <- true;
}
Utils.PrecacheModel( "models/infected/spitter.mdl" );
Utils.PrecacheModel( "models/infected/jockey.mdl" );
Utils.PrecacheModel( "models/infected/charger.mdl" );

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 0
	cm_ShouldHurry = 1
	cm_SpecialRespawnInterval = 13
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 0
	SpecialInfectedAssault = true
	LockTempo = true
	cm_MaxSpecials = 6
	cm_DominatorLimit = 6
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	//WitchLimit = 0
	//cm_WitchLimit = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	//TankHitDamageModifierCoop = 0.3
	ShouldAllowSpecialsWithTank = true
	ZombieTankHealth = 750
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.334 // pain_pills_decay_rate default 0.27
		}
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
	EnableTanks = false
	SpecialSlotTimer = 13.0
	SIModelsBase = [ [ "models/infected/smoker.mdl", "models/infected/smoker_l4d1.mdl" ],
					[ "models/infected/boomer.mdl", "models/infected/boomer_l4d1.mdl", "models/infected/boomette.mdl" ],
						[ "models/infected/hunter.mdl", "models/infected/hunter_l4d1.mdl" ],
							[ "models/infected/spitter.mdl" ],
								[ "models/infected/jockey.mdl" ],
									[ "models/infected/charger.mdl" ] ]
	SIModels = [ [ "models/infected/smoker.mdl", "models/infected/smoker_l4d1.mdl" ],
				[ "models/infected/boomer.mdl", "models/infected/boomer_l4d1.mdl", "models/infected/boomette.mdl" ],
					[ "models/infected/hunter.mdl", "models/infected/hunter_l4d1.mdl" ],
						[ "models/infected/spitter.mdl" ],
							[ "models/infected/jockey.mdl" ],
								[ "models/infected/charger.mdl" ] ]
	ModelCheck = [ false, false, false, false, false, false ]
	LastBoomerModel = ""
	BoomersChecked = 0
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) && victim.GetTeam() != SURVIVORS )
	{
		damageTable.DamageDone = 1000;
	}
	return true;
}

function GetRandomInfected()
{
	local InfectedChoices =
	[
		Z_SMOKER
		Z_BOOMER
		Z_HUNTER
		Z_SPITTER
		Z_JOCKEY
		Z_CHARGER
		Z_TANK
	]
	
	if ( Utils.IsFinale() )
		Utils.RemoveValueFromArray( InfectedChoices, Z_TANK );
	
	for ( local i = 0; i < 3; i++ )
	{
		local random_choice = Utils.GetRandValueFromArray( InfectedChoices );
		
		switch ( random_choice )
		{
			case Z_SMOKER:
			{
				SessionOptions.SmokerLimit += 2;
				break;
			}
			case Z_BOOMER:
			{
				SessionOptions.BoomerLimit += 2;
				Utils.RemoveValueFromArray( InfectedChoices, Z_BOOMER );
				break;
			}
			case Z_HUNTER:
			{
				SessionOptions.HunterLimit += 2;
				break;
			}
			case Z_SPITTER:
			{
				SessionOptions.SpitterLimit += 2;
				break;
			}
			case Z_JOCKEY:
			{
				SessionOptions.JockeyLimit += 2;
				break;
			}
			case Z_CHARGER:
			{
				SessionOptions.ChargerLimit += 2;
				break;
			}
			case Z_TANK:
			{
				SessionOptions.TankLimit += 2;
				SessionOptions.cm_TankLimit += 2;
				SessionState.EnableTanks = true;
				break;
			}
			default:
				break;
		}
	}
}

::SpawnTank <- function ( args )
{
	Msg("Spawning Tank!\n");
	Utils.SpawnZombie( Z_TANK );
}

function RemoveInfectedFailsafe()
{
	if ( Director.GetCommonInfectedCount() > 0 )
	{
		local infected = null;
		while ( infected = Entities.FindByClassname( infected, "infected" ) )
		{
			if ( infected.IsValid() )
				infected.Kill();
		}
	}
}

function Notifications::OnRoundStart::RandomInfected()
{
	g_ModeScript.GetRandomInfected();
	
	local spawner = null;
	while ( spawner = Entities.FindByClassname( spawner, "info_zombie_spawn" ) )
	{
		if ( spawner.IsValid() )
		{
			local population = NetProps.GetPropString( spawner, "m_szPopulation" );
			
			if ( population == "boomer" || population == "hunter" || population == "smoker" || population == "jockey"
				|| population == "charger" || population == "spitter" || population == "new_special" || population == "church"
					|| population == "tank" || population == "witch" || population == "witch_bride" || population == "river_docks_trap" )
				continue;
			else
				spawner.Kill();
		}
	}
}

::ResetSpecialTimers <- function ( args )
{
	Director.ResetSpecialTimers();
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
	Timers.AddTimer(SessionState.SpecialSlotTimer, true, ResetSpecialTimers);
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	if ( SessionState.EnableTanks )
	{
		SpawnTank(null);
		Timers.AddTimer( SessionState.SpecialSlotTimer, true, SpawnTank );
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

function Notifications::OnPlayerVomited::InfectedVomited( victim, attacker, params )
{
	if ( victim.GetTeam() == INFECTED )
	{
		local KillTimer = 2.0;
		
		if ( victim.GetType() == Z_TANK )
			KillTimer = 5.0;
		
		Timers.AddTimer(KillTimer, false, KillInfected, { infected = victim, attacker = attacker });
	}
}

/*function Notifications::OnSpawn::SpecialSpawn( player, params )
{
	if ( ( !player.IsSurvivor() ) && ( player.GetTeam() == INFECTED ) && ( player.GetType() != Z_TANK ) )
	{
		local health = player.GetMaxHealth();
		player.SetHealth( health / 2 );
		player.SetMaxHealth( health / 2 );
	}
}*/

function Notifications::OnSpawn::ZSLSpecialSpawned( player, params )
{
	if ( player.GetTeam() == INFECTED )
	{
		local zombieType = player.GetType();
		if ( zombieType < 7 )
		{
			local modelName = player.GetModel();
			
			if ( !SessionState.ModelCheck[ zombieType - 1 ] )
			{
				if ( (zombieType == 2) && !("three_of_kind_no_female_boomers" in getroottable()) )
				{
					if ( SessionState.LastBoomerModel != modelName )
					{
						SessionState.LastBoomerModel = modelName;
						SessionState.BoomersChecked++;
					}
					if ( SessionState.BoomersChecked > 1 )
						SessionState.ModelCheck[ zombieType - 1 ] = true;
				}
				else
					SessionState.ModelCheck[ zombieType - 1 ] = true;
				
				if ( SessionState.SIModelsBase[zombieType - 1].find( modelName ) == null )
				{
					SessionState.SIModelsBase[zombieType - 1].append( modelName );
					SessionState.SIModels[zombieType - 1].append( modelName );
				}
			}
			
			if ( SessionState.SIModelsBase[zombieType - 1].len() == 1 )
				return;
			
			local zombieModels = SessionState.SIModels[zombieType - 1];
			if ( zombieModels.len() == 0 )
				SessionState.SIModels[zombieType - 1].extend( SessionState.SIModelsBase[zombieType - 1] );
			local foundModel = zombieModels.find( modelName );
			if ( foundModel != null )
			{
				zombieModels.remove( foundModel );
				return;
			}
			
			local randomElement = RandomInt( 0, zombieModels.len() - 1 );
			local randomModel = zombieModels[ randomElement ];
			zombieModels.remove( randomElement );
			player.SetModel( randomModel );
		}
	}
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	g_ModeScript.RemoveInfectedFailsafe();
}
