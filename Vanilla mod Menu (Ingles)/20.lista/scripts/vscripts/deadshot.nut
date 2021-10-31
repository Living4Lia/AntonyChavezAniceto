//-----------------------------------------------------
Msg("Activating Deadshot!\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheCSSWeapons();

MutationOptions <-
{
	//cm_BaseCommonAttackDamage = 12
	cm_CommonLimit = 40
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	AlwaysAllowWanderers = true
	NumReservedWanderers = 40
	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
	IntensityRelaxThreshold = 0.99
	RelaxMinInterval = 1
	RelaxMaxInterval = 2
	RelaxMaxFlowTravel = 50
	MegaMobMaxSize = 40
	MegaMobMinSize = 40
	MegaMobSize = 40
	MobMaxPending = 40
	MobSpawnMaxTime = 2
	MobSpawnMinTime = 1
	MobSpawnSize = 40
	SurvivorMaxIncapacitatedCount = 1
	
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
		//weapon_melee = 0
		weapon_chainsaw = 0
		//weapon_pipe_bomb = 0
		//weapon_molotov = 0
		//weapon_vomitjar = 0
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
		
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}

	TempHealthDecayRate = 0.001 //100
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.001 // pain_pills_decay_rate default 0.27
		}
	}
}

MutationState <-
{
	SurvivorsSpawned = false
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Entity(damageTable.Attacker);
	local victim = Entity(damageTable.Victim);
	
	if (damageTable.Weapon)
	{
		if ( damageTable.Weapon.GetClassname() == "weapon_pistol" && victim.GetClassname() == "infected" )
		{
			if ( Convars.GetStr( "z_difficulty" ).tolower() == "easy" )
				damageTable.DamageDone = 1;
			else
				damageTable.DamageDone = 3;
		}
		else if ( damageTable.Weapon.GetClassname() == "weapon_pistol_magnum" && victim.GetClassname() == "infected" )
		{
			if ( Convars.GetStr( "z_difficulty" ).tolower() == "easy" )
				damageTable.DamageDone = 2;
			else
				damageTable.DamageDone = 6;
		}
	}
	if ( victim.GetTeam() == SURVIVORS && attacker.GetClassname() == "infected" )
	{
		damageTable.DamageDone = 24;
	}
	if ( victim.GetTeam() == SURVIVORS && attacker.GetTeam() == SURVIVORS )
	{
		if ( damageTable.DamageType == 8 )
			return true;
		else
			return false;
	}
	
	return true;
}

function EasyLogic::OnBash::DisableDamage( attacker, victim )
{
	if ( attacker.GetTeam() == SURVIVORS && victim.GetTeam() == INFECTED )
	{
		return ALLOW_BASH_PUSHONLY;
	}
}

::StartMob <- function( args )
{
	SessionOptions.cm_CommonLimit = 40;
	Timers.AddTimer(90.0, false, StopMob);
	EntFire( "info_director", "ForcePanicEvent" );
}

::StopMob <- function( args )
{
	SessionOptions.cm_CommonLimit = 0;
	Timers.AddTimer(30.0, false, StartMob);
}

function Notifications::OnIncapacitated::KillSurvivor( victim, attacker, params )
{
	victim.Input("CancelCurrentScene");
	victim.Hurt(999);
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetType() == Z_SURVIVOR )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

::ListOfRandomWeps <-
[
	"pumpshotgun"
	"shotgun_chrome"
	"hunting_rifle"
]

::GiveWeapons <- function( args )
{
	Utils.SanitizeHeldPrimary();
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach ( survivor in Players.AliveSurvivors() )
		{
			local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
			survivor.Give(randWep);
			survivor.Give("weapon_pipe_bomb");
			survivor.GiveRandomMelee();
			survivor.Give("weapon_pistol_magnum");
			survivor.Give("weapon_pistol");
			survivor.Give("weapon_pistol");
		}
	}
	Timers.AddTimer(0.5, false, GiveRandomWeapon);
}

function Notifications::OnSpawn::GaveWeapons( player, params )
{
	if ( !SessionState.SurvivorsSpawned && player.GetTeam() == SURVIVORS && !Director.HasAnySurvivorLeftSafeArea() )
	{
		SessionState.SurvivorsSpawned = true;
		Timers.AddTimer(1.0, false, GiveWeapons);
	}
}

::panic_started <- false;
::removed_weapon_spawns <- false;
::set_health <- false;
::unlocked_train_door <- false;
function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();

	Survivors <- 
	[
		"!nick"
		"!ellis" 
		"!rochelle" 
		"!coach"
	]

	Survivor <- null;
	if ( !set_health && Entities.FindByName( null, "!nick" ) )
	{
		foreach(s in Survivors)
		{
			while( Survivor = Entities.FindByName( Survivor, s ) )
			{
				Survivor.SetHealthBuffer( 0 );
			}
		}
		EntFire( "!nick", "sethealth", 100 );
		EntFire( "!rochelle", "sethealth", 100 );
		EntFire( "!coach", "sethealth", 100 );
		EntFire( "!ellis", "sethealth", 100 );
		set_health = true;
	}
	if( !removed_weapon_spawns )
    {
		EntFire( "weapon_spawn", "kill" );
		foreach( melee_spawn in Objects.OfClassname("weapon_melee_spawn") )
			melee_spawn.Kill();
		removed_weapon_spawns = true;
    }
	if( !unlocked_train_door && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "tankdoorout_button", "unlock" );
		EntFire( "tank_sound_timer", "kill" );
		unlocked_train_door = true;
	}
	if( !panic_started && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "info_director", "ForcePanicEvent", "", 20 );
		Timers.AddTimer(90.0, false, StopMob);
		panic_started = true;
	}
}

