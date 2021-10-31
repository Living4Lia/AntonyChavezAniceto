//-----------------------------------------------------
Msg("Activating Saturday Morning Special Edition!!\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 10
	cm_MaxSpecials = 10
	cm_SpecialRespawnInterval = 0
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	ShouldAllowSpecialsWithTank = true
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	cm_AutoReviveFromSpecialIncap = 1
	cm_BaseCommonAttackDamage = 0.0
	//TankHitDamageModifierCoop = 0.1

	SmokerLimit = 1
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 1
	JockeyLimit = 2
	ChargerLimit = 2
	//TankLimit = 0
	//cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0

	RandomPrimary =
	[
		/*"autoshotgun",
		"rifle",
		"rifle_desert",
		"sniper_military",
		"shotgun_spas",
		"rifle_ak47"*/
		"smg",
		"smg_silenced",
		"smg_mp5",
		"pumpshotgun",
		"shotgun_chrome"
	]
	RandomSecondary =
	[
		"pistol"
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPrimary.len()-1);
		local SRand = RandomInt(0,RandomSecondary.len()-1);
		if(id == 0) return RandomPrimary[PRand];
		else if(id == 1) return RandomSecondary[SRand];
		return 0;
	}

	TempHealthDecayRate = 0.001
}

ZSLState <-
{
	IsRaceEvent = false
	SpawnTank = false
	TriggerRescue = false
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

//Overrides array in zsl_base
::ListOfRandomWeps <-
[
	"smg",
	"smg_silenced",
	"smg_mp5",
	"pumpshotgun",
	"shotgun_chrome"
]

function Notifications::OnSurvivorsSpawned::GiveRandomWeapons( amount )
{
	if ( amount != 4 )
		return;
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}
