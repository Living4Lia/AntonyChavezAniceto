//-----------------------------------------------------
Msg("Activating Altered Genetics\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 8
	cm_MaxSpecials = 12
	cm_AggressiveSpecials = 1
	SpecialRespawnInterval = 5
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	ShouldAllowSpecialsWithTank = true
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	BoomerLimit = 2
	SmokerLimit = 2
	HunterLimit = 2
	ChargerLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	TankLimit = 2
	cm_TankLimit = 2
	//WitchLimit = 0
	//cm_WitchLimit = 0
}

function Notifications::OnPostSpawn::ChangeSIGenetics( player, params )
{
	if ( player.GetTeam() == INFECTED && player.GetType() != Z_TANK )
	{
		local SITypes =
		[
			1, //Z_SMOKER
			2, //Z_BOOMER
			3, //Z_HUNTER
			4, //Z_SPITTER
			5, //Z_JOCKEY
			6, //Z_CHARGER
			//8 //Z_TANK
		]
		
		Utils.RemoveValueFromArray(SITypes, player.GetType());
		player.SetNetProp( "m_zombieClass", Utils.GetRandValueFromArray(SITypes) );
	}
}
