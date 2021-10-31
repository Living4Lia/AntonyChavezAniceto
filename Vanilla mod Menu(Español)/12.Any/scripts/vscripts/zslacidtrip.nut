//-----------------------------------------------------
Msg("Activating ZSL Acid Trip\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_survival_base");

ZSLOptions <-
{
	cm_ShouldHurry = 1
	TankHitDamageModifierCoop = 0.5
	cm_BaseCommonAttackDamage = 0
	
	SpitterLimit = 12
	TankLimit = 4
	cm_TankLimit = 4
	SurvivorMaxIncapacitatedCount = 0
	
	RandomPrimary =
	[
		"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	RandomSecondary =
	[
		"weapon_pistol_magnum",
	]
	
	RandomTertiary =
	[
		"weapon_adrenaline",
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		local TRand = RandomInt(0,RandomTertiary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		else if(id == 2) return RandomTertiary[TRand];
		return 0;
	}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );

::ModifySpit <- function ( args )
{
	foreach( spit in Objects.OfClassname("spitter_projectile") )
	{
		spit.SetKeyValue( "solid", 1 );
	}
}

function Notifications::OnAbilityUsed::SpitterSpit( player, ability, params )
{
	if ( player.GetType() == Z_SPITTER )
	{
		Timers.AddTimer(0.2, false, ModifySpit);
	}
}
