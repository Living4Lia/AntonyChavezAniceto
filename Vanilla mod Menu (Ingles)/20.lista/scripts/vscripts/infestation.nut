//-----------------------------------------------------
Msg("Activating Infestation\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	RelaxMinInterval = 0
	RelaxMaxInterval = 0
	SpecialRespawnInterval = 7
	cm_DominatorLimit = 15
	cm_MaxSpecials = 15
	CommonLimit = 0
	cm_CommomLimit = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 15
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ProhibitBosses = 1
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb = 	"weapon_molotov_spawn"
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

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	Utils.RemoveZombieSpawns();
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
