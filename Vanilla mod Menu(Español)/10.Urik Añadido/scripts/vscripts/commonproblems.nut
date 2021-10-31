//-----------------------------------------------------
Msg("Activating Common Problems\n");
Msg("Made by Rayman1103\n");


MutationOptions <-
{
	ActiveChallenge = 1

	cm_ShouldHurry = 1
	ProhibitBosses = 1
	CommonLimit = 50
	cm_CommonLimit = 50
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

	HordeEscapeCommonLimit = 50
	PreferredMobDirection = SPAWN_ANYWHERE
}

unlocked_train_door <- false;
function Update()
{
	if( !unlocked_train_door && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire( "tankdoorout_button", "unlock" );
		EntFire( "tank_sound_timer", "kill" );
		unlocked_train_door = true;
	}
}
