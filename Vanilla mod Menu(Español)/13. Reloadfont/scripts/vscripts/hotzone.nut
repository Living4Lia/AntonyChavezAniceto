//-----------------------------------------------------
Msg("Activating Hot Zone\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

// Various director settings
MutationOptions <-
{
	ActiveChallenge = 1
	
	cm_AllowSurvivorRescue = 0
	//SpecialInitialSpawnDelayMin = 5
	//SpecialInitialSpawnDelayMax = 5
	SurvivorMaxIncapacitatedCount = 0

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
			return false;
		
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
		"weapon_molotov",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
			return DefaultItems[idx];

		return 0;
	}
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.001 // pain_pills_decay_rate default 0.27
		}
	}
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
				damageTable.DamageDone = 40;
				return true
			}
		}
	}
	catch( error )
	{
		
	}
	return true
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::ForcePanic <- function ( args )
{
	EntFire( "info_director", "ForcePanicEvent" );
}

function Notifications::OnIncapacitated::RemovePistol( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		victim.Remove("pistol");
}

::removed_miniguns <- false;
::removed_weapon_spawns <- false;
::set_health <- false;
::started_health_regen <- false;
::triggered_panic_event <- false;
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
	if( !set_health && Entities.FindByClassname( null, "player" ) )
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
		removed_weapon_spawns = true;
    }
	if ( !removed_miniguns )
	{
		EntFire( "prop_minigun", "Kill" );
		EntFire( "prop_minigun_l4d1", "Kill" );
		EntFire( "prop_mounted_machine_gun", "Kill" );
		removed_miniguns = true;
	}
	if ( !triggered_panic_event && !Entities.FindByClassname( null, "trigger_finale" ) && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "info_director", "ForcePanicEvent" );
		Timers.AddTimer( 20.0, true, ForcePanic );
		triggered_panic_event = true;
	}
	if ( !started_health_regen )
	{
		Timers.AddTimerByName("HealthRegenTimer", 2.0, true, HealthRegen);
		started_health_regen = true;
	}
}
