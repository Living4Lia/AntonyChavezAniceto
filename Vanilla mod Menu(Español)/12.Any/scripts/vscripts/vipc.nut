//-----------------------------------------------------
Msg("Activating VIP Escort: Contagious\n");
Msg("Made by Rayman1103\n");

IncludeScript("contagious");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

::InfectPlayer <- function ( args )
{
	local validPlayers = [];
	foreach ( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetReviveCount() == 0 && !survivor.IsIncapacitated() )
			validPlayers.append( survivor );
	}
	local player = Utils.GetRandValueFromArray( validPlayers );
	if ( player )
	{
		player.SetHealthBuffer(player.GetHealth());
		player.SetRawHealth(1);
		player.SetReviveCount( 1 );
		player.SetNetProp("m_bIsOnThirdStrike", 0);
		player.StopSound( "Player.HeartbeatLoop" );
		player.StopSound( "Player.Heartbeat" );
		SessionState.PlayerInfected[player.GetCharacterName()] <- true;
	}
	if ( !SessionState.RemovedTimer )
	{
		local playersInfected = 0;
		foreach( survivor in Players.Survivors() )
		{
			if ( SessionState.PlayerInfected[survivor.GetCharacterName()] )
				playersInfected++;
		}
		if ( playersInfected == 5 )
		{
			g_ModeScript.InfectedHUD.Fields.timer.flags = g_ModeScript.InfectedHUD.Fields.timer.flags | HUD_FLAG_NOTVISIBLE
			SessionState.RemovedTimer = true;
		}
		else
		{
			Timers.AddTimer( 40.0, false, InfectPlayer );
			HUDManageTimers( 0, TIMER_COUNTDOWN, 40 );
		}
	}
}

function Notifications::OnIncapacitated::InfectSurvivor( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
	{
		SessionState.PlayerInfected[victim.GetCharacterName()] <- true;
		if ( !SessionState.ActiveTimer )
		{
			Timers.AddTimer( 40.0, false, InfectPlayer );
			HUDManageTimers( 0, TIMER_COUNTDOWN, 40 );
			SessionState.ActiveTimer = true;
		}
		if ( !SessionState.RemovedTimer )
		{
			local playersInfected = 0;
			foreach( survivor in Players.Survivors() )
			{
				if ( SessionState.PlayerInfected[survivor.GetCharacterName()] )
					playersInfected++;
			}
			if ( playersInfected == 5 )
			{
				g_ModeScript.InfectedHUD.Fields.timer.flags = g_ModeScript.InfectedHUD.Fields.timer.flags | HUD_FLAG_NOTVISIBLE
				SessionState.RemovedTimer = true;
			}
		}
	}
}

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
	HUDManageTimers( 0, TIMER_STOP, 0 );
	HUDManageTimers( 0, TIMER_SET, 0 );
	Say( null, "Once infected the virus will spread to the others after a set time. Try to stay alive and make it to the safe room where the cure will be administered.", false );
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
			timer = 
			{
				slot = HUD_MID_BOX ,
				staticstring = " Until Next Infection",
				name = "target",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_POSTSTR | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
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
	HUDPlace( HUD_MID_BOX, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_RIGHT_TOP, 0.0, 0.04, 1.0, 0.045 );
	HUDSetLayout( InfectedHUD );
}
