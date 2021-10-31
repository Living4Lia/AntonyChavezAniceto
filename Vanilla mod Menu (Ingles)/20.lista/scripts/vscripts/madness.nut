//-----------------------------------------------------
Msg("Activating Madness\n");
Msg("Made by DarkDragon\n");


MutationOptions <-
{
	ActiveChallenge = 1
	cm_ShouldHurry = 1
	ProhibitBosses = 1
	CommonLimit = 90
	cm_CommonLimit = 90
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
}

triggered_panic_event <- false;
unlocked_train_door <- false;
function Update()
{
	if( !triggered_panic_event && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire("info_director","ForcePanicEvent");
		triggered_panic_event = true;
	}
	if( !unlocked_train_door && Director.HasAnySurvivorLeftSafeArea() )
	{
		EntFire("tankdoorout_button","unlock");
		EntFire("tank_sound_timer","kill");
		unlocked_train_door = true;
	}
}
