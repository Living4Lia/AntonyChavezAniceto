//-----------------------------------------------------
Msg("Activating VIP Escort: Plague of the Dead\n");
Msg("Made by Rayman1103\n");

IncludeScript("plague");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = true
	SaveVIPHealth = false
	VIPRules = "The Survivor's heartbeat is linked to yours, if he dies, everyone dies. There are no incaps, if you go down, you're dead."
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

::VIPData.givemedkits <- false;

::GetInfectionTimer <- function ( ind )
{
	local player = Utils.GetPlayerFromCharacter(ind);
	
	if ( !player )
		return;
	
	local time = Timers.ReadTimer( player.GetSurvivorCharacter() );
	if ( player.IsAlive() && time > 0 && time < 11 )
	{
		foreach( hud in g_ModeScript.PlagueHUD.Fields )
		{
			if ( hud.name == "name" + player.GetSurvivorCharacter() )
				hud.flags = hud.flags | HUD_FLAG_BLINK;
		}
	}
	else
	{
		foreach( hud in g_ModeScript.PlagueHUD.Fields )
		{
			if ( hud.name == "name" + player.GetSurvivorCharacter() )
				hud.flags = hud.flags & ~HUD_FLAG_BLINK;
		}
	}
	
	return Utils.GetDisplayTime( time );
}

function Notifications::OnRescueVehicleLeaving::StopTimer( survivorCount, params )
{
	foreach( survivor in Players.Survivors() )
		Timers.ManageTimer( survivor.GetSurvivorCharacter(), TIMER_STOP, 0 );
}

function Notifications::OnMapEnd::StopTimer()
{
	foreach( survivor in Players.Survivors() )
		Timers.ManageTimer( survivor.GetSurvivorCharacter(), TIMER_STOP, 0 );
}

function Notifications::OnSurvivorsDead::StopTimer()
{
	foreach( survivor in Players.Survivors() )
		Timers.ManageTimer( survivor.GetSurvivorCharacter(), TIMER_STOP, 0 );
}

function Notifications::OnIncapacitated::InfectSurvivor( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
	{
		victim.Revive();
		Timers.ManageTimer( victim.GetSurvivorCharacter(), TIMER_COUNTDOWN, 120 );
		Timers.AddTimerByName( victim.GetCharacterName() + "Timer", 120, false, KillSurvivor, victim );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS && !SessionState.VIPDefibStart )
	{
		EntFire( "survivor_death_model", "BecomeRagdoll" );
		Timers.ManageTimer( victim.GetSurvivorCharacter(), TIMER_SET, 0 );
		Timers.RemoveTimerByName ( victim.GetCharacterName() + "Timer" );
	}
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
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
	
	PlagueHUD <-
	{
		Fields =
		{
			name0 = 
			{
				slot = HUD_FAR_LEFT ,
				datafunc = @() SessionState.DisplayName(0) + "   " + GetInfectionTimer(0),
				name = "name0",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_BEEP | HUD_FLAG_NOBG,
			}
			name1 = 
			{
				slot = HUD_MID_TOP ,
				datafunc = @() SessionState.DisplayName(1) + "   " + GetInfectionTimer(1),
				name = "name1",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_BEEP | HUD_FLAG_NOBG,
			}
			name2 = 
			{
				slot = HUD_FAR_RIGHT ,
				datafunc = @() GetInfectionTimer(2) + "   " + SessionState.DisplayName(2),
				name = "name2",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_BEEP | HUD_FLAG_NOBG,
			}
			name3 = 
			{
				slot = HUD_MID_BOT ,
				datafunc = @() GetInfectionTimer(3) + "   " + SessionState.DisplayName(3),
				name = "name3",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_BEEP | HUD_FLAG_NOBG,
			}
			name9 =
			{
				slot = HUD_RIGHT_TOP ,
				datafunc = @() SessionState.DisplayName(9) + "   " + GetInfectionTimer(9),
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
	HUDSetLayout( PlagueHUD );
}
