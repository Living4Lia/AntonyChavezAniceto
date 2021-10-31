//-----------------------------------------------------
Msg("Activating Thursday Morning Claw Hammer!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 0
	cm_MaxSpecials = 8
	cm_DominatorLimit = 8
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 4
	ChargerLimit = 4
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	cm_SpecialRespawnInterval = 10
	cm_AggressiveSpecials = 1
	cm_AutoReviveFromSpecialIncap = 1
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	cm_AllowSurvivorRescue = 0
	ProhibitBosses = false
	cm_BaseCommonAttackDamage = 0
	TankHitDamageModifierCoop = 0.1

	RandomPrimary =
	[
		"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		return 0;
	}

	TempHealthDecayRate = 0.001
}

ZSLState <-
{
	IsRaceEvent = false
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnSurvivorsSpawned::GiveRandomWeapons( amount )
{
	if ( amount != 4 )
		return;
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}
