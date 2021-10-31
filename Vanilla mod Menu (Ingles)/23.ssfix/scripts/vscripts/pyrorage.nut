//-----------------------------------------------------
Msg("Activating Pyro Rage\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("pvp_base");

PVPOptions <-
{
	DefaultItems =
	[
		"weapon_molotov",
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

AddDefaultsToTable( "PVPOptions", g_ModeScript, "MutationOptions", g_ModeScript );
