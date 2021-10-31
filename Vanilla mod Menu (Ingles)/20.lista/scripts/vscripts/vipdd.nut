//-----------------------------------------------------
Msg("Activating VIP Escort: Death's Door\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("vip_base");

MutationOptions <-
{
	cm_ShouldHurry = 1
	//cm_AllowPillConversion = 0
	cm_AllowSurvivorRescue = 0
	SurvivorMaxIncapacitatedCount = 0
	
	/*weaponsToConvert =
	{
		weapon_pain_pills = "weapon_first_aid_kit_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
	weaponsToRemove =
	{
		weapon_adrenaline = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}*/

	DefaultItems =
	[
		"weapon_pistol",
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

	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.27 // pain_pills_decay_rate default
		}
	}
}

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
}
