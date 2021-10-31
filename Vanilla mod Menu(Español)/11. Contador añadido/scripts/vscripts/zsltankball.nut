//-----------------------------------------------------
Msg("Activating ZSL Tankball!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_survival_base");

ZSLOptions <-
{
	TankLimit = 12
	cm_TankLimit = 12
	TankHitDamageModifierCoop = 0.25
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
		weapon_chainsaw = 0
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_defibrillator = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		weapon_melee = 0
		upgrade_item = 0
		ammo = 0
	}

	DefaultItems =
	[
		"weapon_pistol",
		"weapon_adrenaline",
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

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	if ( attacker.IsSurvivor() && victim.GetType() == Z_TANK )
	{
		return false;
	}
	return true;
}

::ZSLSpawnTank <- function ( args )
{
	Utils.SpawnZombie( Z_TANK );
	SessionState.ZSLTanksSpawned++;
}

::ZSLAutoStart <- function ( args )
{
	ZSLSpawnTank( null );
	Timers.AddTimer(5.0, true, ZSLSpawnTank);
	Timers.AddTimerByName("HealthDecayTimer", 2.0, true, HealthDecay);
	SessionState.AutoStarted = true;
}
