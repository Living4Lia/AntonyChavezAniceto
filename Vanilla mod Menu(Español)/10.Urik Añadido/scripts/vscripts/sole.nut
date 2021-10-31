//-----------------------------------------------------
Msg("Activating Last Man Standing\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("pvp_base");

PVPOptions <-
{
	weaponsToRemove =
	{
		weapon_pistol = 0
		weapon_pistol_magnum = 0
		weapon_smg = 0
		weapon_pumpshotgun = 0
		weapon_autoshotgun = 0
		weapon_rifle = 0
		weapon_hunting_rifle = 0
		weapon_smg_silenced = 0
		weapon_shotgun_chrome = 0
		weapon_rifle_desert = 0
		weapon_sniper_military = 0
		weapon_shotgun_spas = 0
		weapon_grenade_launcher = 0
		weapon_rifle_ak47 = 0
		weapon_smg_mp5 = 0
		weapon_rifle_sg552 = 0
		weapon_sniper_awp = 0   
		weapon_sniper_scout = 0
		weapon_rifle_m60 = 0
		weapon_melee = 0
		weapon_chainsaw = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		upgrade_item = 0
		ammo = 0
	}

	DefaultItems =
	[
		"weapon_pistol_magnum",
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

::StatHUD <-
{
	Fields =
	{
		round = 
		{
			slot = HUD_SCORE_TITLE ,
			datafunc = @() SessionState.RoundInfo + RoundState.currentround,
			name = "round",
			flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
		}
		timer = 
		{
			slot = HUD_MID_BOX ,
			staticstring = "Everyone Will Be Visible In: ",
			name = "timer",
			flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			special = HUD_SPECIAL_TIMER0
		}
		name0 = 
		{
			slot = HUD_FAR_LEFT ,
			datafunc = @() SessionState.DisplayName(0) + SessionState.SpacerString + "(" + SessionState.DisplayScore(0) + ")",
			name = "name0",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		name1 = 
		{
			slot = HUD_MID_TOP ,
			datafunc = @() SessionState.DisplayName(1) + SessionState.SpacerString + "(" + SessionState.DisplayScore(1) + ")",
			name = "name1",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		name2 = 
		{
			slot = HUD_FAR_RIGHT ,
			datafunc = @() "(" + SessionState.DisplayScore(2) + ")" + SessionState.SpacerString + SessionState.DisplayName(2),
			name = "name2",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
		}
		name3 = 
		{
			slot = HUD_MID_BOT ,
			datafunc = @() "(" + SessionState.DisplayScore(3) + ")" + SessionState.SpacerString + SessionState.DisplayName(3),
			name = "name3",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
		}
		scorebackground = 
		{
			slot = HUD_RIGHT_BOT ,
			datafunc = @() SessionState.EmptyString,
			name = "scorebackground",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER,
		}
		score0 = 
		{
			slot = HUD_SCORE_1 ,
			datafunc = @() SessionState.FirstPlace + SessionState.FirstName + SessionState.SpacerString + "(" + SessionState.FirstScore + ")",
			name = "score0",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		score1 = 
		{
			slot = HUD_SCORE_2 ,
			datafunc = @() SessionState.SecondPlace + SessionState.SecondName + SessionState.SpacerString + "(" + SessionState.SecondScore + ")",
			name = "score1",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		score2 = 
		{
			slot = HUD_SCORE_3 ,
			datafunc = @() SessionState.ThirdPlace + SessionState.ThirdName + SessionState.SpacerString + "(" + SessionState.ThirdScore + ")",
			name = "score2",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
		score3 = 
		{
			slot = HUD_SCORE_4 ,
			datafunc = @() SessionState.FourthPlace + SessionState.FourthName + SessionState.SpacerString + "(" + SessionState.FourthScore + ")",
			name = "score3",
			flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
		}
	}
}

::BeginMatch <- function ()
{
	SessionState.RoundActive = true;
	SessionState.StartedMatch = true;
	Timers.AddTimer(0.1, false, GiveWeapons);
	Timers.AddTimer(10.0, true, GiveWeapons);
	HUDManageTimers( 0, TIMER_COUNTDOWN, 180 );
	Timers.AddTimer(180.0, false, EnableGlows);
	Say( null, "(Rules) Kill any and all of the other players, 1 point for each player killed. The final map will award an additional 2 bonus points to the Last Man Standing!", false );
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local DMG_PIPEBOMB = 134217792;
	
	if ( damageTable.DamageType == DMG_PIPEBOMB )
		ScriptedDamageInfo.DamageDone = 40;
	
	return true;
}

function Notifications::OnRoundStart::BeginHealthDecay()
{
	if ( RoundState.currentround == 5 )
		StatHUD.Fields.round.datafunc = StatHUD.Fields.round.datafunc = @() SessionState.FinalRound
	
	Timers.AddTimerByName("HealthRegenTimer", 1.0, true, HealthRegen);
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.IsSurvivor() )
	{
		if ( SessionState.SurvivorDied == false )
			SessionState.SurvivorDied = true;
		EntFire( "survivor_death_model", "BecomeRagdoll" );
		SessionState.AliveSurvivors--;
		
		if ( SessionState.AllowDeath )
			SurvivorStats.deaths[victim.GetCharacterName()]++;
		
		if ( SessionState.RoundActive )
		{
			if ( attacker.GetSurvivorCharacter() != victim.GetSurvivorCharacter() )
				SurvivorStats.kills[attacker.GetCharacterName()]++;
		}
		
		if ( Utils.GetNumberOfSurvivorsAlive() == 1 )
		{
			if ( Utils.IsFinale() )
			{
				local winner = Players.AnyAliveSurvivor();
				if ( winner )
				{
					SurvivorStats.kills[winner.GetCharacterName()] += 2;
					RemoveHUD();
					DisplayScores();
					Timers.AddTimer(15.0, false, EndGame);
				}
			}
			else
			{
				foreach(survivor in Players.AliveSurvivors())
					survivor.SetLocation( Utils.GetSaferoomLocation() );
				EntFire( "prop_door_rotating_checkpoint", "SetSpeed", "200" );
				EntFire( "prop_door_rotating_checkpoint", "Open" );
				EntFire( "prop_door_rotating_checkpoint", "Close" );
				SessionState.SaveTables = false;
			}
		}
	}
}

function SetupModeHUD()
{
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOX, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDSetLayout( StatHUD );
}
