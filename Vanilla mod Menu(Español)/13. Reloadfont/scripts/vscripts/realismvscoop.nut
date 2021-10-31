//-----------------------------------------------------
Msg("Activating Realism Versus CO-OP\n");
Msg("Made by Rayman1103\n");


MutationOptions <-
{
	ActiveChallenge = 1

	cm_AllowPillConversion = 0

	weaponsToRemove =
	{
		weapon_first_aid_kit = 0
		weapon_defibrillator = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}		

	DefaultItems =
	[
		"weapon_first_aid_kit",
		"weapon_pistol",
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
