//-----------------------------------------------------
Msg("Activating Virus Free\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AllowSurvivorRescue = 0
	SurvivorMaxIncapacitatedCount = 1
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.50 // pain_pills_decay_rate default 0.27
		}
	}
}

MutationState <-
{
	PlayerInfected = {}
	InfectedState = {}
	SetBlackWhite = {}
}

::GetInfectedInfo <- function ( ind )
{
	local player = Utils.GetPlayerFromCharacter(ind);
	
	if ( (!player) || !(player.GetCharacterName() in SessionState.InfectedState) )
		return;
	
	if ( player.GetReviveCount() > 0 && player.IsAlive() )
		return player.GetName() + " is " + (101 - player.GetHealth()).tointeger() + "% INFECTED!";
	else
		return player.GetName() + " is " + SessionState.InfectedState[player.GetCharacterName()];
}

function Notifications::OnIncapacitated::InfectSurvivor( victim, attacker, params )
{
	SessionState.PlayerInfected[victim.GetCharacterName()] <- true;
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		SessionState.InfectedState[victim.GetCharacterName()] <- "DEAD :(";
}

function Notifications::OnHealSuccess::Healed( player, healer, health, params )
{
	if ( (player.GetCharacterName() in SessionState.PlayerInfected) && (SessionState.PlayerInfected[player.GetCharacterName()]) )
	{
		player.SetHealthBuffer(player.GetRawHealth());
		player.SetRawHealth(1);
		player.SetReviveCount(1);
		player.SetNetProp("m_bIsOnThirdStrike", 0);
		player.StopSound( "Player.HeartbeatLoop" );
		player.StopSound( "Player.Heartbeat" );
	}
}

function Notifications::OnDefibSuccess::Defibbed( player, reviver, params )
{
	player.SetHealthBuffer(70);
	player.SetRawHealth(1);
	player.SetReviveCount(1);
	player.SetNetProp("m_bIsOnThirdStrike", 0);
	player.StopSound( "Player.HeartbeatLoop" );
	player.StopSound( "Player.Heartbeat" );
}

function Notifications::OnPlayerReplacedBot::StopHeartbeat( player, bot, params )
{
	if ( player.GetHealth() > 40 )
	{
		player.StopSound( "Player.HeartbeatLoop" );
		player.StopSound( "Player.Heartbeat" );
	}
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
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

function SetupModeHUD()
{
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
		}
	}
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDSetLayout( InfectedHUD );
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetReviveCount() > 0 )
		{
			if ( survivor.GetHealth() <= 1 && !survivor.IsInCheckpoint() )
				survivor.Incapacitate();
		
			if ( !SessionState.SetBlackWhite[survivor.GetCharacterName()] && survivor.GetHealth() < 40 )
			{
				survivor.SetNetProp("m_bIsOnThirdStrike", 1);
				survivor.StopSound( "Player.HeartbeatLoop" );
				survivor.PlaySound( "Player.HeartbeatLoop" );
				SessionState.SetBlackWhite[survivor.GetCharacterName()] = true;
			}
			else if ( SessionState.SetBlackWhite[survivor.GetCharacterName()] && survivor.GetHealth() > 40 )
			{
				survivor.SetNetProp("m_bIsOnThirdStrike", 0);
				survivor.StopSound( "Player.HeartbeatLoop" );
				survivor.StopSound( "Player.Heartbeat" );
				SessionState.SetBlackWhite[survivor.GetCharacterName()] = false;
			}
		}
	}
}
