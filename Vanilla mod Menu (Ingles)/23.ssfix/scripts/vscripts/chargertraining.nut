//-----------------------------------------------------
Msg("Activating Versus Training - Chargers\n");
Msg("Made by Rayman1103\n");


MutationOptions <-
{
	// Challenge vars
	ActiveChallenge = 1
	
	TankLimit = 0
	cm_TankLimit = 0
	
	// Always convert to the Charger
	function ConvertZombieClass( iClass )
	{
		return 6;
	}
}

unlocked_train_door <- false;
function Update()
{
	if(!unlocked_train_door && Director.HasAnySurvivorLeftSafeArea())
	{
		EntFire("tankdoorout_button","unlock");
		EntFire("tank_sound_timer","kill");
		unlocked_train_door = true;
	}
}