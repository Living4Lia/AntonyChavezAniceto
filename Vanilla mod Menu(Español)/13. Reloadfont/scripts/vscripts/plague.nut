//-----------------------------------------------------
Msg("Activating Plague of the Dead\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AllowSurvivorRescue = false
	cm_BaseCommonAttackDamage = 12
	cm_CommonLimit = 35
	cm_HeadshotOnly = 1
	cm_ShouldHurry = 1
	cm_MaxSpecials = 0
	cm_DominatorLimit = 0
	AlwaysAllowWanderers = true
	NumReservedWanderers = 40
	PreferredMobDirection = SPAWN_ANYWHERE
	SurvivorMaxIncapacitatedCount = 1
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		ammo =	"weapon_pistol_spawn"
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
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
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
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.834 // pain_pills_decay_rate default 0.27 //0.556
		}
	}
}

MutationState <-
{
	function DisplayName(ind)
	{
		local p = Utils.GetPlayerFromCharacter(ind)
		if(p)
		{
			return (p.GetName())
		}
		else
		{
			return ""
		}
	}
}

::GetInfectionTimer <- function ( ind )
{
	local player = Utils.GetPlayerFromCharacter(ind);
	
	if ( !player )
		return;
	
	if ( player.GetReviveCount() == 0 )
		return "--:--";
	
	local time = HUDReadTimer( player.GetSurvivorCharacter() );
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

::KillSurvivor <- function ( player )
{
	player.Kill();
}

function Notifications::OnRescueVehicleLeaving::StopTimer( survivorCount, params )
{
	foreach( survivor in Players.Survivors() )
	{
		HUDManageTimers( survivor.GetSurvivorCharacter(), TIMER_SET, 0 );
		HUDManageTimers( survivor.GetSurvivorCharacter(), TIMER_STOP, 0 );
	}
}

function Notifications::OnMapEnd::StopTimer()
{
	foreach( survivor in Players.Survivors() )
	{
		HUDManageTimers( survivor.GetSurvivorCharacter(), TIMER_SET, 0 );
		HUDManageTimers( survivor.GetSurvivorCharacter(), TIMER_STOP, 0 );
	}
}

function Notifications::OnSurvivorsDead::StopTimer()
{
	foreach( survivor in Players.Survivors() )
	{
		HUDManageTimers( survivor.GetSurvivorCharacter(), TIMER_SET, 0 );
		HUDManageTimers( survivor.GetSurvivorCharacter(), TIMER_STOP, 0 );
	}
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "addoutput", "count 1" );
	EntFire( "weapon_melee_spawn", "addoutput", "count 1" );
	EntFire( "weapon_pistol_spawn", "addoutput", "count 1" );
	EntFire( "weapon_pistol_magnum_spawn", "addoutput", "count 1" );
	EntFire( "weapon_pumpshotgun_spawn", "addoutput", "count 1" );
	EntFire( "weapon_shotgun_chrome_spawn", "addoutput", "count 1" );
	EntFire( "weapon_smg_spawn", "addoutput", "count 1" );
	EntFire( "weapon_smg_silenced_spawn", "addoutput", "count 1" );
	EntFire( "weapon_hunting_rifle_spawn", "addoutput", "count 1" );
	EntFire( "weapon_sniper_military_spawn", "addoutput", "count 1" );
	EntFire( "weapon_autoshotgun_spawn", "addoutput", "count 1" );
	EntFire( "weapon_shotgun_spas_spawn", "addoutput", "count 1" );
	EntFire( "weapon_rifle_spawn", "addoutput", "count 1" );
	EntFire( "weapon_rifle_ak47_spawn", "addoutput", "count 1" );
	EntFire( "weapon_rifle_desert_spawn", "addoutput", "count 1" );
	
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
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

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	Utils.RemoveFootLockers();
	
	EntFire( "info_director", "FireConceptToAny", "PlayerWarnCareful" );
}

function Notifications::OnIncapacitated::InfectSurvivor( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
	{
		victim.Revive();
		HUDManageTimers( victim.GetSurvivorCharacter(), TIMER_COUNTDOWN, 120 );
		Timers.AddTimerByName( victim.GetCharacterName() + "Timer", 120, false, KillSurvivor, victim );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
	{
		EntFire( "survivor_death_model", "BecomeRagdoll" );
		HUDManageTimers( victim.GetSurvivorCharacter(), TIMER_SET, 0 );
		HUDManageTimers( victim.GetSurvivorCharacter(), TIMER_STOP, 0 );
		Timers.RemoveTimerByName ( victim.GetCharacterName() + "Timer" );
	}
}

function SetupModeHUD()
{
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
			/*timer0 = 
			{
				slot = HUD_LEFT_TOP ,
				staticstring = " ",
				name = "timer0",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
			timer1 = 
			{
				slot = HUD_LEFT_BOT ,
				staticstring = " ",
				name = "timer1",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER1
			}
			timer2 = 
			{
				slot = HUD_RIGHT_TOP ,
				staticstring = " ",
				name = "timer2",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER2
			}
			timer3 = 
			{
				slot = HUD_RIGHT_BOT ,
				staticstring = " ",
				name = "timer3",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER3
			}*/
			/*timer0 =
			{
				slot = HUD_FAR_LEFT ,
				staticstring = Player("!nick").GetName() + " ",
				name = "timer0",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_PRESTR | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
			timer1 =
			{
				slot = HUD_MID_TOP ,
				staticstring = Player("!rochelle").GetName() + " ",
				name = "timer1",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_PRESTR | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER1
			}
			timer2 =
			{
				slot = HUD_FAR_RIGHT ,
				staticstring = " " + Player("!coach").GetName(),
				name = "timer2",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_POSTSTR | HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER2
			}
			timer3 =
			{
				slot = HUD_MID_BOT ,
				staticstring = " " + Player("!ellis").GetName(),
				name = "timer3",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_POSTSTR | HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER3
			}*/
		}
	}
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	/*HUDPlace( HUD_LEFT_TOP, -0.22, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_LEFT_BOT, -0.22, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_RIGHT_TOP, 0.22, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_RIGHT_BOT, 0.22, 0.06, 1.0, 0.045 );*/
	HUDSetLayout( PlagueHUD );
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
}
