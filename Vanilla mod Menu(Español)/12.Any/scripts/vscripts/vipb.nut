//-----------------------------------------------------
Msg("Activating VIP Escort: BooM60\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("boom60");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );
