//-----------------------------------------------------
Msg("Activating Two Against Many\n");
Msg("Made by Rayman1103\n");


MutationOptions <-
{
	ActiveChallenge = 1
	//cm_NoSurvivorBots = 1
	cm_ProhibitBosses = true
	cm_MaxSpecials = 0
	CommonLimit = 45
	MegaMobMaxSize = 55
	MegaMobMinSize = 55
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_defibrillator =	"weapon_first_aid_kit_spawn"		
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
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
