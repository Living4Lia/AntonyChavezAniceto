//-----------------------------------------------------
Msg("Activating Sunday Morning Smoker Roast!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 0
	cm_MaxSpecials = 12
	cm_DominatorLimit = 12
	BoomerLimit = 0
	SmokerLimit = 12
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	cm_SpecialRespawnInterval = 8
	cm_AggressiveSpecials = 1
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 5
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE //SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	cm_AutoReviveFromSpecialIncap = 1
	cm_AllowSurvivorRescue = 0
	ShouldAllowSpecialsWithTank = true
	cm_BaseCommonAttackDamage = 0
	TankHitDamageModifierCoop = 0.1

	DefaultItems =
	[
		"weapon_molotov",
		//"weapon_pistol_magnum",
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

ZSLState <-
{
	IsRaceEvent = false
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnIncapacitated::IncappedPlayer( player, attacker, params )
{
	player.Remove("weapon_pistol");
}
