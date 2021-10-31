//-----------------------------------------------------
Msg("Activating Undead Assault\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_ShouldHurry = 1
	ProhibitBosses = 1
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0

	cm_BaseCommonAttackDamage = 6

	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
	SurvivorMaxIncapacitatedCount = 1

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
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_chainsaw = 0
		weapon_defibrillator = 0
		weapon_adrenaline = 0
		weapon_pain_pills = 0
		weapon_first_aid_kit = 0
		weapon_melee = 0
		weapon_upgradepack_explosive = 0
		weapon_upgradepack_incendiary = 0
		ammo = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}

	function ShouldAvoidItem( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return true;
		}
		return false;
	}

	DefaultItems =
	[
		"weapon_rifle_m60",
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
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.75 // pain_pills_decay_rate default 0.27
		}
	}
}

MutationState <-
{
	SpacerString = "  "
	KillsInfo = "Zombies Destroyed"
	PlayerKills = {}
	
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
	
	function DisplayScore(ind)
	{
		local p = Utils.GetPlayerFromCharacter(ind)
		if(p)
		{
			return (SessionState.PlayerKills[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

::ForcePanic <- function ( args )
{
	Utils.ForcePanicEvent();
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( victim.GetTeam() == SURVIVORS && attacker.GetClassname() == "infected" )
		{
			damageTable.DamageDone = 1000;
			return true;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker != null )
	{
		if ( attacker.IsSurvivor() && victim.GetType() == Z_COMMON )
		{
			SessionState.PlayerKills[attacker.GetCharacterName()]++;
		}
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnIncapacitated::ReviveSurvivor( victim, attacker, params )
{
	victim.Revive();
}

/*function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	player.SetRawHealth(50);
	player.SetHealthBuffer(0);
}*/

function Notifications::OnSurvivorsLeftStartArea::ForcePanicEvent()
{
	if ( !Entities.FindByClassname( null, "trigger_finale" ) )
	{
		Utils.ForcePanicEvent();
		Timers.AddTimer( 15.0, true, ForcePanic );
	}
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
		SessionState.PlayerKills[survivor.GetCharacterName()] <- 0;
	}
	Say( null, "Get hit and you will become infected, once your health reaches zero after being infected you will die.", false );
}

function SetupModeHUD()
{
	StatHUD <-
	{
		Fields =
		{
			info = 
			{
				slot = HUD_MID_BOX ,
				datafunc = @() SessionState.KillsInfo,
				name = "info",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			name0 = 
			{
				slot = HUD_FAR_LEFT ,
				datafunc = @() SessionState.DisplayName(0) + SessionState.SpacerString + "(" + SessionState.DisplayScore(0) + ")",
				name = "name0",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name1 = 
			{
				slot = HUD_MID_TOP ,
				datafunc = @() SessionState.DisplayName(1) + SessionState.SpacerString + "(" + SessionState.DisplayScore(1) + ")",
				name = "name1",
				flags = HUD_FLAG_ALIGN_LEFT | HUD_FLAG_NOBG,
			}
			name2 = 
			{
				slot = HUD_FAR_RIGHT ,
				datafunc = @() "(" + SessionState.DisplayScore(2) + ")" + SessionState.SpacerString + SessionState.DisplayName(2),
				name = "name2",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
			name3 = 
			{
				slot = HUD_MID_BOT ,
				datafunc = @() "(" + SessionState.DisplayScore(3) + ")" + SessionState.SpacerString + SessionState.DisplayName(3),
				name = "name3",
				flags = HUD_FLAG_ALIGN_RIGHT | HUD_FLAG_NOBG,
			}
		}
	}
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOX, 0.0, 0.00, 1.0, 0.045 );
	HUDSetLayout( StatHUD );
}

function EasyLogic::OnProcessResponse::RemoveReviveThanksResponses()
{
	local g_undeadassault =
	[
		{
			name = "PlayerReviveThanks",
			criteria =
			[
				[ "Concept", "RevivedByFriend" ],
			],
			responses =
			[
				{
					scenename = "",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "PlayerIncapacitated",
			criteria =
			[
				[ "Concept", "PlayerIncapacitated" ],
			],
			responses =
			[
				{
					scenename = "",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
	]
	ResponseRules.ProcessRules( g_undeadassault );
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetHealth() <= 1 && survivor.IsLastStrike() )
			survivor.Kill();
	}
}
