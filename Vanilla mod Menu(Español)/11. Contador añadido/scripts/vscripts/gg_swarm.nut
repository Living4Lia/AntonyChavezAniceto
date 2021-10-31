//-----------------------------------------------------
Msg("Activating Gun Game: Swarm\n");
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
		//weapon_melee = 0
		weapon_chainsaw = 0
		weapon_pipe_bomb = 0
		weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		//weapon_defibrillator = 0
		//weapon_upgradepack_incendiary = 0
		//weapon_upgradepack_explosive = 0
		//upgrade_item = 0
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

MutationState <-
{
	PlayerGun = {}
	PlayerKills = {}
	SpacerString = "  "
	KillsInfo = "Zombies Destroyed"
	
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
		if( (p) && (p.GetCharacterName() in g_ModeScript.SurvivorStats.score) )
		{
			return (g_ModeScript.SurvivorStats.score[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

::GunState <-
{
	GunProgress = {}
}

::SurvivorStats <-
{
	score = {}
}

::SurvivorStatsBackup <-
{
	score = {}
}

::ListOfWeps <-
[
	"random_melee"
	"chainsaw"
	"pistol"
	"dual_pistols"
	"pistol_magnum"
	"sniper_scout"
	"pumpshotgun"
	"sniper_awp"
	"shotgun_chrome"
	"smg"
	"smg_silenced"
	"sniper_military"
	"hunting_rifle"
	"rifle_desert"
	"smg_mp5"
	"rifle_sg552"
	"shotgun_spas"
	"rifle_ak47"
	"autoshotgun"
	"rifle"
	"pipe_bomb"
	"molotov"
	"rifle_m60"
	"grenade_launcher"
]

::GiveWeapons <- function( player )
{
	player.DropWeaponSlot(0);
	player.DropWeaponSlot(1);
	player.DropWeaponSlot(2);
	
	local function GiveWeapon( player )
	{
		local weapon = ListOfWeps[GunState.GunProgress[player.GetCharacterName()]];
		if ( weapon == "random_melee" )
			player.GiveRandomMelee();
		else if ( weapon == "dual_pistols" )
		{
			player.Give("pistol");
			player.Give("pistol");
		}
		else
		{
			player.Give(weapon);
		
			local items = player.GetHeldItems();
			if (items)
			{
				foreach (item in items)
				{
					if ( item.GetClassname() == "weapon_" + weapon )
						SessionState.PlayerGun[player.GetCharacterName()] <- item;
				}
			}
		}
	}
	
	Timers.AddTimer(0.1, false, GiveWeapon, player);
}

::AdvanceGun <- function ( player )
{
	local weapon = ListOfWeps[GunState.GunProgress[player.GetCharacterName()]];
	if ( weapon == "dual_pistols" )
	{
		player.Remove("pistol");
		player.Remove("pistol");
	}
	else if ( weapon == "random_melee" )
		player.DropWeaponSlot(1);
	else
		player.Remove(weapon);
	
	if ( weapon == "grenade_launcher" )
		GunState.GunProgress[player.GetCharacterName()] = 0;
	else
		GunState.GunProgress[player.GetCharacterName()]++;
	
	local function GiveGun( player )
	{
		local weapon = ListOfWeps[GunState.GunProgress[player.GetCharacterName()]];
		if ( weapon == "dual_pistols" )
		{
			player.Give("pistol");
			player.Give("pistol");
		}
		else if ( weapon == "random_melee" )
			player.GiveRandomMelee();
		else
		{
			player.Give(weapon);
			
			local items = player.GetHeldItems();
			if (items)
			{
				foreach (item in items)
				{
					if ( item.GetClassname() == "weapon_" + weapon )
						SessionState.PlayerGun[player.GetCharacterName()] <- item;
				}
			}
		}
	}
	
	SessionState.PlayerKills[player.GetCharacterName()] = 0;
	Timers.AddTimer(0.1, false, GiveGun, player);
}

::ForcePanic <- function ( args )
{
	Utils.ForcePanicEvent();
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

function GetTotalScore()
{
	local total = 0;
	
	for ( local i = 0; i < 4; i++ )
	{
		if ( SessionState.DisplayScore(i).tostring() != "" )
			total += SessionState.DisplayScore(i);
	}
	
	return total;
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		if ( Utils.IsFinale() )
		{
			SaveTable( "Stats", SurvivorStats );
			SaveTable( "StatsBackup", SurvivorStats );
		}
		else
		{
			RestoreTable( "StatsBackup", SurvivorStatsBackup );
			SaveTable( "StatsBackup", SurvivorStatsBackup );
			SaveTable( "Stats", SurvivorStatsBackup );
		}
	}
	else if ( reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION )
	{
		if ( nextmap != Utils.GetNextMap() )
			return;
		
		SaveTable( "Stats", SurvivorStats );
		SaveTable( "StatsBackup", SurvivorStats );
	}
}

function EasyLogic::OnShutdown::SaveGunProgress( reason, nextmap )
{
	if ( (reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION && nextmap == Utils.GetNextMap()) || (reason == SCRIPT_SHUTDOWN_ROUND_RESTART) )
		SaveTable( "gungame_progress", GunState.GunProgress );
}

function Notifications::OnRoundStart::LoadData()
{
	RestoreTable( "Stats", SurvivorStats );
	RestoreTable( "StatsBackup", SurvivorStatsBackup );
}

function EasyLogic::OnTakeDamage::GunGameDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( damageTable.DamageType == ( DMG_BLAST | DMG_BLAST_SURFACE ) && !victim.IsSurvivor() )
		{
			damageTable.DamageDone = 1000;
			return true;
		}
		if ( attacker.IsSurvivor() && attacker.IsBot() && victim.IsSurvivor() )
		{
			return false;
		}
		if ( victim.GetTeam() == SURVIVORS && attacker.GetClassname() == "infected" )
		{
			if ( victim.IsIncapacitated() )
			{
				damageTable.DamageDone = 2;
				return true;
			}
			else
			{
				damageTable.DamageDone = 15; //45
				return true;
			}
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnDeath::AdvanceGunProgress( victim, attacker, params )
{
	if ( !attacker )
		return;
	
	local weapon = ::VSLib.EasyLogic.GetEventString(params, "weapon");
	if ( attacker.IsSurvivor() && victim.GetType() == Z_COMMON )
	{
		local weapon_progress = ListOfWeps[GunState.GunProgress[attacker.GetCharacterName()]];
		
		if ( weapon == "entityflame" || weapon == "inferno" )
			weapon = "molotov";
		else if ( weapon == "grenade_launcher_projectile" )
			weapon = "grenade_launcher";
		else if ( weapon == "melee" )
			weapon = "random_melee";
		
		if ( weapon == weapon_progress )
			SessionState.PlayerKills[attacker.GetCharacterName()]++;
		
		if ( SessionState.PlayerKills[attacker.GetCharacterName()] >= 5 )
			AdvanceGun( attacker );
		
		g_ModeScript.SurvivorStats.score[attacker.GetCharacterName()]++;
	}
	if ( victim.IsSurvivor() )
	{
		local weapon = ListOfWeps[GunState.GunProgress[victim.GetCharacterName()]];
		if ( weapon != "pistol" && weapon != "dual_pistols" && weapon != "random_melee" && weapon != "chainsaw" )
			SessionState.PlayerGun[victim.GetCharacterName()].Kill();
	}
}

function Notifications::OnRoundStart::GunGameSetup()
{
	RestoreTable( "gungame_progress", GunState.GunProgress );
	EntFire( "weapon_spawn", "Kill" );
	foreach( melee_spawn in Objects.OfClassname("weapon_melee_spawn") )
		melee_spawn.Kill();
}

function Notifications::OnEnterSaferoom::KillInfected( player, params )
{
	if ( player.GetTeam() == INFECTED )
		player.Kill();
}

function Notifications::OnReviveSuccess::RevivedPlayer( player, reviver, params )
{
	local weapon = ListOfWeps[GunState.GunProgress[player.GetCharacterName()]];
	if ( weapon != "pistol" && weapon != "dual_pistols" )
		player.Remove("pistol");
}

function Notifications::OnDefibSuccess::RevivedPlayer( player, reviver, params )
{
	local weapon = ListOfWeps[GunState.GunProgress[player.GetCharacterName()]];
	if ( weapon != "random_melee" && weapon != "chainsaw" )
		GiveWeapons( player );
}

function Notifications::OnSurvivorRescued::RescuedPlayer( rescuer, victim, params )
{
	GiveWeapons( victim );
}

function Notifications::OnReviveSuccess::SetHealth( player, reviver, params )
{
	player.SetRawHealth(50);
	player.SetHealthBuffer(0);
}

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
	}
	Timers.AddTimerByName("HealthRegenTimer", 1.0, true, HealthRegen);
}

function Notifications::OnSurvivorsSpawned::GunGameStarted( amount )
{
	if ( amount != 4 )
		return;
	
	Utils.SanitizeHeldWeapons();
	EntFire( "weapon_pipe_bomb", "Kill" );
	EntFire( "weapon_molotov", "Kill" );
	EntFire( "weapon_vomitjar", "Kill" );
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		if ( !(survivor.GetCharacterName() in GunState.GunProgress) )
			GunState.GunProgress[survivor.GetCharacterName()] <- 0;
		
		SessionState.PlayerGun[survivor.GetCharacterName()] <- null;
		SessionState.PlayerKills[survivor.GetCharacterName()] <- 0;
		
		if ( !(survivor.GetCharacterName() in SurvivorStats.score) )
			SurvivorStats.score[survivor.GetCharacterName()] <- 0;
		
		Timers.AddTimer(0.1, false, GiveWeapons, survivor);
	}
}

function SetupModeHUD()
{
	StatHUD <-
	{
		Fields =
		{
			info = 
			{
				slot = HUD_SCORE_TITLE ,
				datafunc = @() SessionState.KillsInfo,
				name = "info",
				flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			total = 
			{
				slot = HUD_MID_BOX ,
				datafunc = @() g_ModeScript.GetTotalScore(),
				name = "total",
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
	HUDPlace( HUD_MID_BOX, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	HUDSetLayout( StatHUD );
}
