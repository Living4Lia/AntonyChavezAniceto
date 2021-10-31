//-----------------------------------------------------
Msg("Activating VIP Escort: Virus Free\n");
Msg("Made by Rayman1103\n");

IncludeScript("virusfree");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetRawHealth( survivor.GetHealth() );
		survivor.SetHealthBuffer( 0 );
		survivor.SetReviveCount( 0 );
		SessionState.PlayerInfected[survivor.GetCharacterName()] <- false;
		SessionState.SetBlackWhite[survivor.GetCharacterName()] <- false;
		SessionState.InfectedState[survivor.GetCharacterName()] <- "Virus Free";
	}
	Say( null, "If your temporary health drains to zero while infected you will die. Health kits don't remove the infection, they just delay it. The safe room holds the cure.", false );
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS && !SessionState.VIPDefibStart )
		SessionState.InfectedState[victim.GetCharacterName()] <- "DEAD :(";
}

::LoadHUD <- function( args )
{
	g_ModeScript.SetupModeHUD();
}

function SetupModeHUD()
{
	if ( !SessionState.VIP )
	{
		Timers.AddTimer( 1.0, false, LoadHUD );
		return;
	}
	
	InfectedHUD <-
	{
		Fields =
		{
			name0 = 
			{
				slot = HUD_FAR_LEFT ,
				datafunc = @() GetInfectedInfo(0),
				name = "name0",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name1 = 
			{
				slot = HUD_MID_TOP ,
				datafunc = @() GetInfectedInfo(1),
				name = "name1",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name2 = 
			{
				slot = HUD_FAR_RIGHT ,
				datafunc = @() GetInfectedInfo(2),
				name = "name2",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
			name3 = 
			{
				slot = HUD_MID_BOT ,
				datafunc = @() GetInfectedInfo(3),
				name = "name3",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
			name9 = 
			{
				slot = HUD_RIGHT_TOP ,
				datafunc = @() GetInfectedInfo(9),
				name = "name9",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
		}
	}
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_RIGHT_TOP, 0.0, 0.04, 1.0, 0.045 );
	HUDSetLayout( InfectedHUD );
}
