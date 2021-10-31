//-----------------------------------------------------

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("united_responserules");

MutationState <-
{
	L4D1Zoey = null
}

::L4D1Data <-
{
	givemedkits = true
}

SurvivorDefaults <-
{
	weapons = { slot0 = "", slot1 = "", slot2 = "", slot3 = "", slot4 = "", slot5 = "" }
	misc = {}
	stats = {}
	hasdualpistols = false
	isdead = false
	primaryammo = 0
	primaryclip = -1
	secondaryclip = -1
	upgradeammo = 0
	upgradetype = 0
}

if ( Utils.GetSurvivorSet() == 1 )
{
	::L4D1Data.Nick <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Rochelle <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Ellis <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Coach <- DuplicateTable(SurvivorDefaults);
}
else
{
	::L4D1Data.Bill <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Francis <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Louis <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Zoey <- DuplicateTable(SurvivorDefaults);
	::L4D1Data.Survivor <- ::L4D1Data.Zoey;
}

if ( Convars.GetFloat("sb_l4d1_survivor_behavior") != 0 )
	Convars.SetValue("sb_l4d1_survivor_behavior", 0);

::GetSurvivorName <- function ( survivor )
{
	if ( Utils.GetSurvivorSet() == 1 )
	{
		local model = survivor.GetModel();
		
		if ( model == "models/survivors/survivor_gambler.mdl" )
			return "Nick";
		else if ( model == "models/survivors/survivor_producer.mdl" )
			return "Rochelle";
		else if ( model == "models/survivors/survivor_mechanic.mdl" )
			return "Ellis";
		else if ( model == "models/survivors/survivor_coach.mdl" )
			return "Coach";
		else
			return survivor.GetCharacterName();
	}
	else
		return survivor.GetCharacterName();
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		RestoreTable( "L4D1Data", L4D1Data );
		SaveTable( "L4D1Data", L4D1Data );
	}
	else if ( reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION )
	{
		if ( nextmap != Utils.GetNextMap() )
			return;
		
		L4D1Data.givemedkits = false;
		SaveTable( "L4D1Data", L4D1Data );
	}
}

function Notifications::OnRoundStart::RestoreL4D1Weapons()
{
	RestoreTable( "L4D1Data", L4D1Data );
}

function Notifications::OnRoundStart::DoStuff()
{
	local map = SessionState.MapName;
	
	if ( map == "c6m1_riverbank" )
	{
		EntFire( "branch_zoey", "Kill" );
		EntFire( "trigger_multiple", "Kill" );
	}
	else if ( map == "c6m3_port" )
	{
		EntFire( "francis_outro", "Kill" );
		EntFire( "louis_outro", "Kill" );
		EntFire( "zoey_outro", "Kill" );
	}
	
	EntFire( "info_l4d1_survivor_spawn", "Kill" );
	EntFire( "l4d1_survivors_relay", "Kill" );
	EntFire( "l4d1_teleport_relay", "Kill" );
	EntFire( "l4d1_script_relay", "Kill" );
}

function Notifications::OnSurvivorsSpawned::SpawnL4D1Survivors( amount )
{
	if ( amount != 4 )
		return;
	
	if ( Utils.GetSurvivorSet() == 1 )
	{
		if ( !Utils.HasMapRestarted() )
		{
			SessionState.L4D1Zoey = Player("!rochelle");
			SessionState.L4D1Zoey.SetNetProp("m_survivorCharacter", 9);
			
			for ( local i = 0; i < 4; i++ )
			{
				Utils.SpawnL4D1Survivor( ZOEY, SessionState.L4D1Zoey.GetLocation(), SessionState.L4D1Zoey.GetAngles() );
			}
		}
	}
	else
	{
		if ( !Utils.HasMapRestarted() )
		{
			Utils.SpawnL4D1Survivor( BILL, Player("!nick").GetLocation(), Player("!nick").GetAngles() );
			Utils.SpawnL4D1Survivor( ZOEY, Player("!rochelle").GetLocation(), Player("!rochelle").GetAngles() );
			Utils.SpawnL4D1Survivor( FRANCIS, Player("!ellis").GetLocation(), Player("!ellis").GetAngles() );
			Utils.SpawnL4D1Survivor( LOUIS, Player("!coach").GetLocation(), Player("!coach").GetAngles() );
		}
	}
}

::GiveL4D1Items <- function ( player )
{
	foreach( weapon in L4D1Data[GetSurvivorName(player)].weapons )
	{
		if ( ( weapon == "weapon_pistol" ) && ( !L4D1Data[GetSurvivorName(player)].hasdualpistols ) )
			continue;
		player.Give(weapon);
	}
	
	if ( L4D1Data[GetSurvivorName(player)].isdead )
	{
		L4D1Data[GetSurvivorName(player)].isdead = false;
		player.SetNetProp("m_iHealth", Convars.GetFloat("z_survivor_respawn_health").tointeger());
	}
	else
	{
		foreach( netprop, value in L4D1Data[GetSurvivorName(player)].misc )
			player.SetNetProp(netprop, value);
	}
	
	foreach( stat, value in L4D1Data[GetSurvivorName(player)].stats )
	{
		if ( stat.find("m_checkpoint") != null )
		{
			local Stat = Utils.StringReplace(stat, "m_checkpoint", "");
			player.SetNetProp("m_mission" + Stat, value);
		}
	}
	
	local PlayerInv = player.GetHeldItems();
	
	if ( ( "slot0" in PlayerInv ) && ( L4D1Data[GetSurvivorName(player)].primaryclip != -1 ) )
	{
		player.SetPrimaryAmmo(L4D1Data[GetSurvivorName(player)].primaryammo);
		PlayerInv["slot0"].SetNetProp("m_iClip1", L4D1Data[GetSurvivorName(player)].primaryclip);
		PlayerInv["slot0"].SetNetProp("m_upgradeBitVec", L4D1Data[GetSurvivorName(player)].upgradetype);
		PlayerInv["slot0"].SetNetProp("m_nUpgradedPrimaryAmmoLoaded", L4D1Data[GetSurvivorName(player)].upgradeammo);
	}
	if ( ( "slot1" in PlayerInv ) && ( PlayerInv["slot1"].GetClassname() != "weapon_melee" ) && ( L4D1Data[GetSurvivorName(player)].secondaryclip != -1 ) )
		PlayerInv["slot1"].SetNetProp("m_iClip1", L4D1Data[GetSurvivorName(player)].secondaryclip);
	
	player.Input( "CancelCurrentScene" );
}

::L4D2SurvivorReEquipWeapons <- function ( player )
{
	local function GiveWeapons( args )
	{
		if ( args.dual )
			args.player.Give( "weapon_pistol" );
		foreach( weapon in args.weapons )
			args.player.Give( weapon );
		args.player.SwitchTo( args.active );
		
		if ( Utils.GetBaseMode() != "survival" )
		{
			if ( L4D1Data.givemedkits )
				args.player.Give("first_aid_kit");
			GiveL4D1Items(args.player);
		}
	}
	
	local activeWeapon = player.GetActiveWeapon().GetClassname();
	local PlayerInv = player.GetHeldItems();
	local weaponNames = [];
	local hasDualPistols = false;
	if ( ("slot1" in PlayerInv) && (PlayerInv["slot1"].GetClassname() == "weapon_pistol") )
		hasDualPistols = PlayerInv["slot1"].GetNetPropBool("m_hasDualWeapons");
	foreach( wep in PlayerInv )
	{
		weaponNames.append( wep.GetClassname() );
		wep.KillEntity();
	}
	Timers.AddTimer( 0.1, false, GiveWeapons, { player = player, weapons = weaponNames, dual = hasDualPistols, active = activeWeapon } );
}

function Notifications::OnPostSpawn::L4D1SurvivorSpawned( player, params )
{
	if ( player.GetTeam() == L4D1_SURVIVORS )
	{
		if ( SessionState.L4D1Zoey )
		{
			if ( SessionState.L4D1Zoey.GetNetPropInt("m_survivorCharacter") == 9 )
				SessionState.L4D1Zoey.SetNetProp("m_survivorCharacter", 1);
		}
		
		if ( Utils.GetSurvivorSet() == 1 )
		{
			if ( player.GetNetPropInt("m_survivorCharacter") == 4 )
			{
				player.SetNetProp("m_survivorCharacter", 19);
				player.SetContext("who", "Gambler", -1);
				player.SetContext("DistToClosestSurvivor", "-1", -1);
				player.SetFakeClientConvarValue("name", "Nick");
				player.SetModel("models/survivors/survivor_gambler.mdl");
				L4D2SurvivorReEquipWeapons(player);
			}
			else if ( player.GetNetPropInt("m_survivorCharacter") == 5 )
			{
				player.SetNetProp("m_survivorCharacter", 20);
				player.SetContext("who", "Mechanic", -1);
				player.SetContext("DistToClosestSurvivor", "-1", -1);
				player.SetFakeClientConvarValue("name", "Ellis");
				player.SetModel("models/survivors/survivor_mechanic.mdl");
				L4D2SurvivorReEquipWeapons(player);
			}
			else if ( player.GetNetPropInt("m_survivorCharacter") == 6 )
			{
				player.SetNetProp("m_survivorCharacter", 21);
				player.SetContext("who", "Coach", -1);
				player.SetContext("DistToClosestSurvivor", "-1", -1);
				player.SetFakeClientConvarValue("name", "Coach");
				player.SetModel("models/survivors/survivor_coach.mdl");
				L4D2SurvivorReEquipWeapons(player);
			}
			else if ( player.GetNetPropInt("m_survivorCharacter") == 7 )
			{
				player.SetNetProp("m_survivorCharacter", 22);
				player.SetContext("who", "Producer", -1);
				player.SetContext("DistToClosestSurvivor", "-1", -1);
				player.SetFakeClientConvarValue("name", "Rochelle");
				player.SetModel("models/survivors/survivor_producer.mdl");
				L4D2SurvivorReEquipWeapons(player);
			}
		}
		else
		{
			if ( player.GetNetPropInt("m_survivorCharacter") == 5 )
			{
				player.SetNetProp("m_survivorCharacter", 9);
				player.SetContext("who", "TeenGirl", -1);
			}
			
			if ( Utils.GetBaseMode() != "survival" )
			{
				if ( L4D1Data.givemedkits )
					player.Give("first_aid_kit");
				GiveL4D1Items(player);
			}
		}
		
		player.SetNetProp("m_iTeamNum", 2);
	}
	else if ( player.GetTeam() == SURVIVORS )
	{
		if ( player.GetNetPropInt("m_survivorCharacter") >= 9 )
		{
			if ( Utils.GetSurvivorSet() == 2 )
			{
				player.SetFakeClientConvarValue("name", "Zoey");
				player.SetContext("who", "TeenGirl", -1);
			}
			else
			{
				switch ( player.GetModel() )
				{
					case "models/survivors/survivor_gambler.mdl":
					{
						player.SetContext("who", "Gambler", -1);
						player.SetContext("DistToClosestSurvivor", "-1", -1);
						player.SetFakeClientConvarValue("name", "Nick");
						break;
					}
					case "models/survivors/survivor_producer.mdl":
					{
						player.SetContext("who", "Producer", -1);
						player.SetContext("DistToClosestSurvivor", "-1", -1);
						player.SetFakeClientConvarValue("name", "Rochelle");
						break;
					}
					case "models/survivors/survivor_mechanic.mdl":
					{
						player.SetContext("who", "Mechanic", -1);
						player.SetContext("DistToClosestSurvivor", "-1", -1);
						player.SetFakeClientConvarValue("name", "Ellis");
						break;
					}
					case "models/survivors/survivor_coach.mdl":
					{
						player.SetContext("who", "Coach", -1);
						player.SetContext("DistToClosestSurvivor", "-1", -1);
						player.SetFakeClientConvarValue("name", "Coach");
						break;
					}
					default:
						break;
				}
			}
		}
		if ( Utils.HasMapRestarted() && Utils.GetBaseMode() != "survival" && player.GetNetPropInt("m_survivorCharacter") > 3 )
		{
			local PlayerInv = player.GetHeldItems();
			if ( "slot0" in PlayerInv )
				PlayerInv["slot0"].Kill();
			if ( L4D1Data.givemedkits )
				player.Give("first_aid_kit");
			GiveL4D1Items(player);
		}
	}
}

function Notifications::OnMapEnd::GetL4D1Weapons()
{
	foreach ( survivor in Players.AllSurvivors() )
	{
		if ( survivor.GetNetPropInt("m_survivorCharacter") > 3 )
		{
			local SurvivorInv = survivor.GetHeldItems();
			
			if ( "slot0" in SurvivorInv )
			{
				L4D1Data[GetSurvivorName(survivor)].weapons.slot0 = SurvivorInv["slot0"].GetClassname();
				L4D1Data[GetSurvivorName(survivor)].upgradetype = SurvivorInv["slot0"].GetNetPropInt("m_upgradeBitVec");
				L4D1Data[GetSurvivorName(survivor)].upgradeammo = SurvivorInv["slot0"].GetNetPropInt("m_nUpgradedPrimaryAmmoLoaded");
				L4D1Data[GetSurvivorName(survivor)].primaryammo = survivor.GetPrimaryAmmo();
				L4D1Data[GetSurvivorName(survivor)].primaryclip = SurvivorInv["slot0"].GetNetPropInt("m_iClip1");
			}
			if ( "slot1" in SurvivorInv )
			{
				L4D1Data[GetSurvivorName(survivor)].weapons.slot1 = SurvivorInv["slot1"].GetClassname();
				if ( SurvivorInv["slot1"].GetClassname() != "weapon_melee" )
					L4D1Data[GetSurvivorName(survivor)].secondaryclip = SurvivorInv["slot1"].GetNetPropInt("m_iClip1");
				L4D1Data[GetSurvivorName(survivor)].hasdualpistols = SurvivorInv["slot1"].GetNetPropBool("m_hasDualWeapons");
			}
			if ( "slot2" in SurvivorInv )
				L4D1Data[GetSurvivorName(survivor)].weapons.slot2 = SurvivorInv["slot2"].GetClassname();
			if ( "slot3" in SurvivorInv )
				L4D1Data[GetSurvivorName(survivor)].weapons.slot3 = SurvivorInv["slot3"].GetClassname();
			if ( "slot4" in SurvivorInv )
				L4D1Data[GetSurvivorName(survivor)].weapons.slot4 = SurvivorInv["slot4"].GetClassname();
			if ( "slot5" in SurvivorInv )
				L4D1Data[GetSurvivorName(survivor)].weapons.slot5 = SurvivorInv["slot5"].GetClassname();
			
			if ( !survivor.IsAlive() )
				L4D1Data[GetSurvivorName(survivor)].isdead = true;
			
			L4D1Data[GetSurvivorName(survivor)].stats <- survivor.GetStats();
			L4D1Data[GetSurvivorName(survivor)].misc["m_iHealth"] <- survivor.GetNetPropInt("m_iHealth");
			L4D1Data[GetSurvivorName(survivor)].misc["m_iMaxHealth"] <- survivor.GetNetPropInt("m_iMaxHealth");
			L4D1Data[GetSurvivorName(survivor)].misc["m_healthBuffer"] <- survivor.GetNetPropFloat("m_healthBuffer");
			L4D1Data[GetSurvivorName(survivor)].misc["m_currentReviveCount"] <- survivor.GetNetPropInt("m_currentReviveCount");
			L4D1Data[GetSurvivorName(survivor)].misc["m_bIsOnThirdStrike"] <- survivor.GetNetPropInt("m_bIsOnThirdStrike");
			L4D1Data[GetSurvivorName(survivor)].misc["m_isGoingToDie"] <- survivor.GetNetPropInt("m_isGoingToDie");
			survivor.SetTeam( 4 ); //Needed to prevent missing survivors during map transition
		}
	}
}

function Notifications::OnUpgradeDeployed::SetUpgradeCount( deployer, upgrade, params )
{
	upgrade.SetKeyValue( "count", 8 );
}

function Notifications::OnHurt::L4D1FriendlyFireScene( player, attacker, params )
{
	if ( (!player) || (!player.IsSurvivor()) || (!attacker) || (!attacker.IsSurvivor()) )
		return;
	
	if ( (player.GetSurvivorCharacter() < 4) || (player.GetSurvivorCharacter() == attacker.GetSurvivorCharacter()) )
		return;
	
	local dmgType = EasyLogic.GetEventInt(params, "type");
	local attackerName = attacker.GetActorName();
	local criteria = "subject:" + attackerName;
	
	if ( dmgType == (dmgType | DMG_BURN) )
		return;
	
	if ( attackerName == "Unknown" )
		attackerName = "TeenGirl";
	
	if ( dmgType == (dmgType | DMG_BULLET) )
		criteria = criteria + ",damagetype:DMG_BULLET";
	
	QueueSpeak( player.GetBaseEntity(), "PlayerFriendlyFire", 0.5, criteria );
}

function Notifications::OnRescueVehicleLeaving::TeleportL4D1Survivors( survivorCount, params )
{
	foreach(survivor in Players.Survivors())
	{
		if ( survivor.GetSurvivorCharacter() > 3 )
		{
			local spawnPos = survivor.GetSpawnLocation();
			if (spawnPos)
				survivor.SetLocation(spawnPos);
			survivor.SetTeam( 4 );
		}
	}
}

::DoNotSpectateL4D1Survivors <- function ( player )
{
	foreach(survivor in Players.Survivors())
	{
		if ( survivor.GetSurvivorCharacter() > 3 )
		{
			if ( ( !survivor.IsHumanSpectating() ) || ( survivor.GetHumanSpectator().GetUserID() != player.GetUserID() ) )
				continue;
			
			survivor.SetNetPropInt("m_humanSpectatorEntIndex", 0);
			survivor.SetNetPropInt("m_humanSpectatorUserID", 0);
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
				continue;
			
			selectedBot.SetNetPropInt("m_humanSpectatorEntIndex", player.GetIndex());
			selectedBot.SetNetPropInt("m_humanSpectatorUserID", player.GetUserID());
		}
	}
}

function Notifications::OnTeamChanged::L4D1SurvivorSpectateFix( player, oldTeam, newTeam, params )
{
	if ( !player )
		return;
	
	if ( player.IsHuman() )
		Timers.AddTimer(0.1, false, DoNotSpectateL4D1Survivors, player );
}
