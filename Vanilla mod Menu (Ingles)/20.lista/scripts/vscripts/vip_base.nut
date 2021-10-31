//-----------------------------------------------------

Utils.PrecacheModel("models/survivors/survivor_namvet.mdl");
Utils.PrecacheModel("models/survivors/survivor_ceda.mdl");

VIPBaseState <-
{
	SpawnedSurvivor = false
	VIPSpawned = false
	Nick = null
	VIP = null
	GaveVIPItems = false
	HasPermaWipe = false
	SaveVIPData = true
	SaveVIPHealth = true
	VIPRules = ""
}

AddDefaultsToTable( "VIPBaseState", g_ModeScript, "MutationState", g_ModeScript );

::VIPData <-
{
	Weapons =
	{
		slot0 = ""
		slot1 = ""
		slot2 = ""
		slot3 = ""
		slot4 = ""
	}
	Misc = {}
	Stats = {}
	UpgradeAmmo = 0
	UpgradeType = 0
	givemedkits = true
}

function EasyLogic::OnTakeDamage::VIPDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( (victim.IsSurvivor()) && (victim.GetSurvivorCharacter() == 9) )
	{
		if ( damageTable.DamageType == (damageTable.DamageType | DMG_BURN) )
		{
			return false;
		}
		else if ( damageTable.DamageType == (damageTable.DamageType | DMG_RADIATION) && damageTable.DamageType == (damageTable.DamageType | DMG_ENERGYBEAM) )
		{
			damageTable.DamageDone = damageTable.DamageDone / 2;
		}
	}
	return true;
}

function EasyLogic::OnProcessResponse::VIPResponses()
{
	local viprules =
	[
		{
			name = "SurvivorSpottedSurvivorMechanic",
			criteria =
			[
				[ @(query) query.Concept == "PlayerLook" || query.Concept == "PlayerLookHere" ],
				Criterion.IsNotCoughing,
				Criterion.IsMechanic,
				Criterion.IsNotSmartLookAuto,
				[ "Subject", "Unknown" ],
			],
			responses =
			[
				{	scenename = "scenes/Mechanic/NameGamblerC101.vcd",	},
				{	scenename = "scenes/Mechanic/NameGamblerC103.vcd",	}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "SurvivorCriticalHurtUnknown",
			criteria =
			[
				[ "Concept", "Pain" ],
				[ "Who", "Unknown" ],
				[ "PainLevel", "Critical" ],
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/HurtCritical02.vcd",
				},
				{
					scenename = "scenes/NamVet/HurtCritical09.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "SurvivorIncapacitatedHurtUnknown",
			criteria =
			[
				[ "Concept", "Pain" ],
				[ "Who", "Unknown" ],
				[ "PainLevel", "Incapacitated" ],
				Criterion.IsNotSpeaking,
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/IncapacitatedInjury01.vcd",
				},
				{
					scenename = "scenes/NamVet/IncapacitatedInjury05.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "SurvivorMajorHurtUnknown",
			criteria =
			[
				[ "Concept", "Pain" ],
				[ "Who", "Unknown" ],
				[ "PainLevel", "Major" ],
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/HurtMajor06.vcd",
				},
				{
					scenename = "scenes/NamVet/HurtMajor07.vcd",
				},
				{
					scenename = "scenes/NamVet/HurtMajor08.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "SurvivorMinorHurtUnknown",
			criteria =
			[
				[ "Concept", "Pain" ],
				[ "Who", "Unknown" ],
				[ "PainLevel", "Minor" ],
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/HurtMinor02.vcd",
				},
				{
					scenename = "scenes/NamVet/HurtMinor10.vcd",
				},
				{
					scenename = "scenes/NamVet/HurtMinor11.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "SurvivorDeathUnknown",
			criteria =
			[
				[ "Concept", "PlayerDeath" ],
				[ "Who", "Unknown" ],
				Criterion.IsNotCoughing,
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/DeathScream06.vcd",
				},
				{
					scenename = "scenes/NamVet/DeathScream07.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "PlayerRelaxedSighUnknown",
			criteria =
			[
				[ "Concept", "RelaxedSigh" ],
				[ "Who", "Unknown" ],
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/PainReliefSigh01.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "PlayerChokeResponseUnknown",
			criteria =
			[
				[ "Concept", "PlayerChoke" ],
				[ "Who", "Unknown" ],
			],
			responses =
			[
				{
					scenename = "scenes/NamVet/Choke01.vcd",
				},
				{
					scenename = "scenes/NamVet/Choke03.vcd",
				},
				{
					scenename = "scenes/NamVet/Choke11.vcd",
				},
				{
					scenename = "scenes/NamVet/Choke12.vcd",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
	]
	ResponseRules.ProcessRules( viprules );
}

function EasyLogic::OnShutdown::SaveVIPData( reason, nextmap )
{
	if ( SessionState.SaveVIPData )
	{
		if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
		{
			RestoreTable( "VIPData", VIPData );
			SaveTable( "VIPData", VIPData );
			local survivor = Utils.GetPlayerFromName("survivor");
			if ( survivor )
				survivor.SetNetProp("m_ModelName", "models/survivors/survivor_namvet.mdl");
		}
		else if ( reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION )
		{
			if ( nextmap != Utils.GetNextMap() )
				return;
			
			VIPData.givemedkits = false;
			SaveTable( "VIPData", VIPData );
		}
	}
}

function Notifications::OnRoundStart::RestoreVIPData()
{
	if ( SessionState.SaveVIPData )
		RestoreTable( "VIPData", VIPData );
}

::ConvertVIPDelay <- function ( args )
{
	if ( args.nick.GetSurvivorCharacter() == 4 )
		args.nick.SetNetProp("m_survivorCharacter", 0);
	SessionState.VIP = args.player;
	args.player.SetNetProp("m_iTeamNum", 2);
	args.player.SetNetProp("m_survivorCharacter", 9);
	args.player.SetModel("models/survivors/survivor_ceda.mdl");
	args.player.SetNetProp("m_ModelName", "models/survivors/survivor_namvet.mdl");
	args.player.SetFakeClientConvarValue("name", "Survivor");
	
	local glowColor = 65280;
	if ( args.player.IsLastStrike() )
		glowColor = 255;
	args.player.SetNetProp("m_Glow.m_glowColorOverride", glowColor);
	args.player.SetNetProp("m_Glow.m_iGlowType", 3);
	Say( null, SessionState.VIPRules, false );
	if ( SessionState.HasPermaWipe )
		Convars.SetValue( "sv_permawipe", "0" );
	
	if ( SessionState.SaveVIPData && !SessionState.GaveVIPItems )
	{
		Timers.AddTimer(0.1, false, VIPGiveItems, args.player);
	}
}

::VIPSpawn <- function ( player )
{
	if ( player.GetSurvivorCharacter() != NICK )
		return;
	
	SessionState.SpawnedSurvivor = true;
	SessionState.Nick = Player("!nick");
	
	if ( Utils.GetSurvivorSet() == 1 )
		player.SetNetProp("m_survivorCharacter", 4);
	
	Utils.SpawnL4D1Survivor( BILL, player.GetLocation() );
}

::VIPGiveItems <- function ( player )
{
	if ( VIPData.givemedkits )
		player.Give("first_aid_kit");
	
	foreach( weapon in VIPData.Weapons )
		player.Give(weapon);
	
	if ( SessionState.SaveVIPHealth )
	{
		foreach( netprop, value in VIPData.Misc )
			player.SetNetProp(netprop, value);
	}
	
	foreach( stat, value in VIPData.Stats )
	{
		if ( stat.find("m_checkpoint") != null )
		{
			local Stat = Utils.StringReplace(stat, "m_checkpoint", "");
			player.SetNetProp("m_mission" + Stat, value);
		}
	}
	
	local PlayerInv = player.GetHeldItems();
	
	if ( "slot0" in PlayerInv )
	{
		PlayerInv["slot0"].SetNetProp("m_upgradeBitVec", VIPData.UpgradeType);
		PlayerInv["slot0"].SetNetProp("m_nUpgradedPrimaryAmmoLoaded", VIPData.UpgradeAmmo);
	}
	
	SessionState.GaveVIPItems = true;
}

function Notifications::OnSpawn::ConvertVIP( player, params )
{
	if ( player.GetTeam() == 4 && player.GetSurvivorCharacter() == 4 && !Utils.HasMapRestarted() )
	{
		Timers.AddTimer(0.1, false, ConvertVIPDelay, { player = player, nick = SessionState.Nick });
	}
	else if ( player.GetSurvivorCharacter() == 9 && !SessionState.VIPSpawned )
	{
		local glowColor = 65280;
		if ( player.IsLastStrike() )
			glowColor = 255;
		
		SessionState.VIP = player;
		SessionState.VIPSpawned = true;
		player.SetNetProp("m_ModelName", "models/survivors/survivor_ceda.mdl");
		player.SetFakeClientConvarValue("name", "Survivor");
		player.SetNetProp("m_Glow.m_glowColorOverride", glowColor);
		player.SetNetProp("m_Glow.m_iGlowType", 3);
		Say( null, SessionState.VIPRules, false );
		if ( SessionState.HasPermaWipe )
			Convars.SetValue( "sv_permawipe", "1" );
	}
	
	if ( player.GetTeam() == 2 && !SessionState.SpawnedSurvivor && !Utils.HasMapRestarted() )
	{
		if ( player.GetSurvivorCharacter() == NICK )
		{
			Timers.AddTimer(0.1, false, VIPSpawn, player);
		}
	}
	else if ( SessionState.SaveVIPData && !SessionState.GaveVIPItems && player.GetSurvivorCharacter() == 9 )
	{
		Timers.AddTimer(0.1, false, VIPGiveItems, player);
	}
}

function Notifications::OnUpgradeDeployed::SetUpgradeCount( deployer, upgrade, params )
{
	upgrade.SetKeyValue( "count", 5 );
}

::StoreVIPData <- function ( args )
{
	local SurvivorInv = SessionState.VIP.GetHeldItems();
	
	if ( "slot0" in SurvivorInv )
	{
		VIPData.Weapons.slot0 = SurvivorInv["slot0"].GetClassname();
		VIPData.UpgradeType = SurvivorInv["slot0"].GetNetPropInt("m_upgradeBitVec");
		VIPData.UpgradeAmmo = SurvivorInv["slot0"].GetNetPropInt("m_nUpgradedPrimaryAmmoLoaded");
	}
	if ( "slot1" in SurvivorInv )
		VIPData.Weapons.slot1 = SurvivorInv["slot1"].GetClassname();
	if ( "slot2" in SurvivorInv )
		VIPData.Weapons.slot2 = SurvivorInv["slot2"].GetClassname();
	if ( "slot3" in SurvivorInv )
		VIPData.Weapons.slot3 = SurvivorInv["slot3"].GetClassname();
	if ( "slot4" in SurvivorInv )
		VIPData.Weapons.slot4 = SurvivorInv["slot4"].GetClassname();
	
	VIPData.Stats <- SessionState.VIP.GetStats();
	if ( SessionState.SaveVIPHealth )
	{
		VIPData.Misc["m_iHealth"] <- SessionState.VIP.GetNetPropInt("m_iHealth");
		VIPData.Misc["m_iMaxHealth"] <- SessionState.VIP.GetNetPropInt("m_iMaxHealth");
		VIPData.Misc["m_healthBuffer"] <- SessionState.VIP.GetNetPropFloat("m_healthBuffer");
		VIPData.Misc["m_currentReviveCount"] <- SessionState.VIP.GetNetPropInt("m_currentReviveCount");
		VIPData.Misc["m_bIsOnThirdStrike"] <- SessionState.VIP.GetNetPropInt("m_bIsOnThirdStrike");
		VIPData.Misc["m_isGoingToDie"] <- SessionState.VIP.GetNetPropInt("m_isGoingToDie");
	}
}

function Notifications::OnMapEnd::SaveVIPStats()
{
	if ( SessionState.SaveVIPData )
		Timers.AddTimer(0.1, false, StoreVIPData);
	
	SessionState.VIP.SetNetProp("m_iTeamNum", 4);
}

function Notifications::OnHealSuccess::VIPHealed( player, healer, health, params )
{
	if ( player.IsSurvivor() )
	{
		if ( player.GetSurvivorCharacter() == 9 )
		{
			local glowColor = 65280;
			if ( player.IsLastStrike() )
				glowColor = 255;
			
			player.SetNetProp("m_Glow.m_glowColorOverride", glowColor);
		}
	}
}

function Notifications::OnIncapacitated::VIPIncapped( victim, attacker, params )
{
	if ( victim.GetSurvivorCharacter() == 9 && victim.IsIncapacitated() )
	{
		victim.SetNetProp("m_Glow.m_iGlowType", 0);
		Timers.AddTimerByName("VIPInitialFlash", 1.0, false, VIPGlowOn, victim);
		Timers.AddTimerByName("VIPFlashEffect", 2.0, true, VIPGlowOff, victim);
	}
}

function Notifications::OnReviveSuccess::VIPRevived( player, reviver, params )
{
	if ( player.IsSurvivor() )
	{
		if ( player.GetSurvivorCharacter() == 9 )
		{
			if ( player.IsLastStrike() )
				player.SetNetProp("m_Glow.m_glowColorOverride", 255);
			else
				player.SetNetProp("m_Glow.m_glowColorOverride", 33023);
			
			if ( !player.IsBiled() )
			{
				player.SetNetProp("m_Glow.m_iGlowType", 3);
				Timers.RemoveTimerByName("VIPInitialFlash");
				Timers.RemoveTimerByName("VIPFlashEffect");
			}
		}
	}
}

::VIPDefibTimer <- function ( VIP )
{
	VIP.SetNetProp("m_Glow.m_glowColorOverride", 0);
	VIP.GetSurvivorDeathModel().Input("BecomeRagdoll");
	foreach( survivor in Players.AliveSurvivors() )
		survivor.Kill();
	Say( null, "Mission Failed: You did not revive the Survivor in time!", false );
}

function Notifications::OnDeath::VIPDied( victim, attacker, params )
{
	if ( victim.IsSurvivor() )
	{
		if ( victim.GetSurvivorCharacter() == 9 )
		{
			if ( Entities.FindByClassname( null, "weapon_defibrillator" ) || Entities.FindByClassname( null, "weapon_defibrillator_spawn" ) )
			{
				EntFire( "info_changelevel", "Disable" );
				EntFire( "trigger_changelevel", "Disable" );
				victim.SetNetProp("m_ModelName", "models/survivors/survivor_namvet.mdl");
				victim.SetNetProp("m_Glow.m_iGlowType", 0);
				Timers.RemoveTimerByName("VIPInitialFlash");
				Timers.RemoveTimerByName("VIPFlashEffect");
				Timers.AddTimerByName( "VIPDefibTimer", 30.0, false, VIPDefibTimer, victim );
				Say( null, "You have 30 seconds to revive the Survivor!", false );
				
				foreach( defib in Objects.OfClassname("weapon_defibrillato*") )
					defib.SetNetProp("m_Glow.m_iGlowType", 3);
			}
			else
			{
				victim.SetNetProp("m_ModelName", "models/survivors/survivor_namvet.mdl");
				victim.SetNetProp("m_Glow.m_glowColorOverride", 0);
				victim.SetNetProp("m_Glow.m_iGlowType", 0);
				Timers.RemoveTimerByName("VIPInitialFlash");
				Timers.RemoveTimerByName("VIPFlashEffect");
				victim.GetSurvivorDeathModel().Input("BecomeRagdoll");
				foreach( survivor in Players.AliveSurvivors() )
					survivor.Kill();
				Say( null, "Mission Failed: The Survivor has died!", false );
			}
		}
	}
}

function Notifications::OnDefibSuccess::VIPDefibbed( player, reviver, params )
{
	EntFire( "info_changelevel", "Enable" );
	EntFire( "trigger_changelevel", "Enable" );
	player.SetNetProp("m_ModelName", "models/survivors/survivor_ceda.mdl");
	player.SetNetProp( "m_Glow.m_iGlowType", 3 );
	Timers.RemoveTimerByName( "VIPDefibTimer" );
	
	if ( Entities.FindByClassname( null, "weapon_defibrillator" ) || Entities.FindByClassname( null, "weapon_defibrillator_spawn" ) )
	{
		foreach( defib in Objects.OfClassname("weapon_defibrillato*") )
			defib.SetNetProp("m_Glow.m_iGlowType", 0);
	}
}

::VIPGlowOn <- function ( player )
{
	player.SetNetProp("m_Glow.m_iGlowType", 3);
}

::VIPGlowOff <- function ( player )
{
	player.SetNetProp("m_Glow.m_iGlowType", 0);
	Timers.AddTimer(1.0, false, VIPGlowOn, player);
}

function Notifications::OnPlayerVomited::VIPVomited( player, attacker, params )
{
	if ( player.GetSurvivorCharacter() == 9 )
	{
		player.SetNetProp("m_Glow.m_iGlowType", 0);
		Timers.AddTimerByName("VIPInitialFlash", 1.0, false, VIPGlowOn, player);
		Timers.AddTimerByName("VIPFlashEffect", 2.0, true, VIPGlowOff, player);
	}
}

function Notifications::OnPlayerVomitEnd::VIPVomitEnd( player, params )
{
	if ( player.GetSurvivorCharacter() == 9 && !player.IsIncapacitated() )
	{
		if ( player.IsAlive() )
			player.SetNetProp("m_Glow.m_iGlowType", 3);
		
		Timers.RemoveTimerByName("VIPInitialFlash");
		Timers.RemoveTimerByName("VIPFlashEffect");
	}
}

function Notifications::OnRescueVehicleLeaving::TeleportVIP( survivorCount, params )
{
	local spawnPos = SessionState.VIP.GetSpawnLocation();
	if (spawnPos)
		SessionState.VIP.SetLocation(spawnPos);
}

::DoNotSpectateExtraSurvivor <- function ( player )
{
	if ( ( !SessionState.VIP.IsHumanSpectating() ) || ( SessionState.VIP.GetHumanSpectator().GetUserID() != player.GetUserID() ) )
		return;
	
	SessionState.VIP.SetNetPropInt("m_humanSpectatorEntIndex", 0);
	SessionState.VIP.SetNetPropInt("m_humanSpectatorUserID", 0);
	local selectedBot = null;
	
	foreach( bot in Players.SurvivorBots() )
	{
		if ( !bot.IsHumanSpectating() && bot.GetSurvivorCharacter() < 4 )
		{
			selectedBot = bot;
			break;
		}
	}
	
	if ( !selectedBot )
		return;
	
	selectedBot.SetNetPropInt("m_humanSpectatorEntIndex", player.GetIndex());
	selectedBot.SetNetPropInt("m_humanSpectatorUserID", player.GetUserID());
}

function Notifications::OnTeamChanged::ExtraSurvivorSpectateFix( player, oldTeam, newTeam, params )
{
	if ( !player )
		return;
	
	if ( player.IsHuman() && SessionState.VIP != null )
		Timers.AddTimer(0.1, false, DoNotSpectateExtraSurvivor, player );
}
