//-----------------------------------------------------
Msg("Activating VIP Escort: Uncommon Ambush\n");
Msg("Made by Rayman1103\n");

IncludeScript("uncommonambush");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );
