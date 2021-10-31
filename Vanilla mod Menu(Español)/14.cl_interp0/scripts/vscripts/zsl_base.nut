//-----------------------------------------------------

IncludeScript("zsl_responserules");

Utils.PrecacheModel( "models/infected/smoker.mdl" );
Utils.PrecacheModel( "models/infected/smoker_l4d1.mdl" );
Utils.PrecacheModel( "models/infected/boomer.mdl" );
Utils.PrecacheModel( "models/infected/boomer_l4d1.mdl" );
Utils.PrecacheModel( "models/infected/boomette.mdl" );
Utils.PrecacheModel( "models/infected/hunter.mdl" );
Utils.PrecacheModel( "models/infected/hunter_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/limbs/exploded_boomette.mdl" ) )
{
	Utils.PrecacheModel( "models/infected/limbs/exploded_boomette.mdl" );
	::zsl_no_female_boomers <- true;
}
Utils.PrecacheModel( "models/infected/spitter.mdl" );
Utils.PrecacheModel( "models/infected/jockey.mdl" );
Utils.PrecacheModel( "models/infected/charger.mdl" );

MutationOptions <-
{
	cm_AllowSurvivorRescue = 0
	cm_AutoReviveFromSpecialIncap = 1
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 0
	cm_MaxSpecials = 12
	cm_DominatorLimit = 12
	BoomerLimit = 6
	SmokerLimit = 3
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 3
	SurvivorMaxIncapacitatedCount = 2

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
		weapon_chainsaw = 0
		weapon_defibrillator = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_first_aid_kit = 0
		weapon_molotov = 0
		weapon_pipe_bomb = 0
		weapon_vomitjar = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		weapon_melee = 0
		upgrade_item = 0
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
		"weapon_pistol",
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
	
	function EndScriptedMode()
	{
		if ( Utils.GetMapRestarts() == 2 && SessionState.HasSurvivalFinale )
		{
			SessionState.EndRound = true;
			
			HUDPlace( HUD_MID_BOX, 0.30, 0.32, 0.44, 0.06 );
			SessionState.FinalScores = "Final Attempt Failed: 0 Points Awarded.\n             Moving To Next Round";
			g_ModeScript.StatHUD.Fields.scores.flags = g_ModeScript.StatHUD.Fields.scores.flags & ~HUD_FLAG_NOTVISIBLE
			
			foreach( survivor in Players.DeadSurvivors() )
			{
				local deathModel = Utils.SpawnEntity( "survivor_death_model", "", survivor.GetLocation() );
				deathModel.SetNetPropInt( "m_nCharacterType", survivor.GetNetPropInt( "m_survivorCharacter" ) );
				survivor.Defib();
				Director.WarpAllSurvivorsToCheckpoint();
			}
			return 2;
		}
		else
			return 1; // SCENARIO_SURVIVORS_DEAD
	}
}

MutationState <-
{
	Score1 = ""
	Score2 = ""
	Score3 = ""
	Score4 = ""
	Attempts = ""
	GameEnded = false
	EndRound = false
	HasSurvivalFinale = true
	TimerString = "Race Begins in: "
	EventRules = "[RULES] Make it to the saferoom for 1 point. Finale (escape) map is now a survival round, last one standing gets the bonus point. Most points at the end wins!!"
	IsRaceEvent = false
	AutoStartFinale = true
	AutoTriggerEvents = true
	VehicleAward = 1
	SaferoomAward = 1
	SaferoomAwardsScore = true
	SaferoomWeaponNeeded = ""
	SaferoomKillLastSurvivor = true
	SurvivorsSafe = false
	KillTimerDecreasesScore = false
	TieBreaker = "damage"
	AllowRevive = true
	NeededSurvivors = 4
	ScoredSurvivors = 0
	SaferoomCheck = false
	FirstInSaferoom = ""
	SecondInSaferoom = ""
	ThirdInSaferoom = ""
	FourthInSaferoom = ""
	Scored = {}
	SurvivorIsSafe = {}
	SurvivorInStart = {}
	FirstSurvivor = null
	SecondSurvivor = null
	ThirdSurvivor = null
	FourthSurvivor = null
	SpacerString = "  "
	EmptyString = ""
	FinalScores = "FINAL SCORES"
	FirstPlace = "1st Place: "
	SecondPlace = "2nd Place: "
	ThirdPlace = "3rd Place: "
	FourthPlace = "4th Place: "
	FirstName = null
	SecondName = null
	ThirdName = null
	FourthName = null
	FirstScore = 0
	SecondScore = 0
	ThirdScore = 0
	FourthScore = 0
	CoachPosition = ""
	EllisPosition = ""
	NickPosition = ""
	RochellePosition = ""
	RescueReady = false
	AwardedRescueScore = false
	SpittersSpawned = false
	SIModelsBase = [ [ "models/infected/smoker.mdl", "models/infected/smoker_l4d1.mdl" ],
					[ "models/infected/boomer.mdl", "models/infected/boomer_l4d1.mdl", "models/infected/boomette.mdl" ],
						[ "models/infected/hunter.mdl", "models/infected/hunter_l4d1.mdl" ],
							[ "models/infected/spitter.mdl" ],
								[ "models/infected/jockey.mdl" ],
									[ "models/infected/charger.mdl" ] ]
	SIModels = [ [ "models/infected/smoker.mdl", "models/infected/smoker_l4d1.mdl" ],
				[ "models/infected/boomer.mdl", "models/infected/boomer_l4d1.mdl", "models/infected/boomette.mdl" ],
					[ "models/infected/hunter.mdl", "models/infected/hunter_l4d1.mdl" ],
						[ "models/infected/spitter.mdl" ],
							[ "models/infected/jockey.mdl" ],
								[ "models/infected/charger.mdl" ] ]
	ModelCheck = [ false, false, false, false, false, false ]
	LastBoomerModel = ""
	BoomersChecked = 0
	
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
			return (g_ModeScript.SurvivorStats.score[p.GetCharacterName()])
		}
		else
		{
			return ""
		}
	}
}

::testonce <- false;

::SurvivorStats <-
{
	score = {}
	tiedscore = false
	tiedsurvivors = {}
}
::SurvivorStatsBackup <- DuplicateTable(SurvivorStats);

function EasyLogic::OnTakeDamage::ZSLDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	
	if ( victim.IsSurvivor() )
	{
		if ( (victim.IsInCheckpoint()) || (attacker.IsSurvivor()) )
		{
			return false;
		}
		if ( SessionState.HasSurvivalFinale && damageTable.DamageType == (damageTable.DamageType | DMG_BURN) )
		{
			if ( !Director.HasAnySurvivorLeftSafeArea() )
				return true;
			if ( !SessionState.SurvivorInStart[victim.GetCharacterName()] )
				return false;
		}
	}
	return true;
}

function EasyLogic::OnShutdown::SaveTables( reason, nextmap )
{
	if ( reason == SCRIPT_SHUTDOWN_ROUND_RESTART )
	{
		if ( SessionState.HasSurvivalFinale && Utils.IsFinale() )
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

::SaferoomInferno <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( SessionState.SurvivorInStart[survivor.GetCharacterName()] || !Director.HasAnySurvivorLeftSafeArea() )
		{
			local origin = survivor.GetLocation();
			origin.z += 16;
			DropFire( origin );
			survivor.ShowHint("LEAVE IMMEDIATELY OR DIE!", 5, "icon_alert_red", "", "255 0 0");
		}
	}
	Timers.AddTimer(5.0, false, SaferoomInferno);
}

::HealthDecay <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() > 1 )
		{
			survivor.SetRawHealth( survivor.GetRawHealth() - 1 );
			
			if ( Utils.GetMaxIncapCount() == 0 )
			{
				if ( survivor.GetHealth() > 25 && survivor.GetHealth() <= 50 )
					survivor.SetNetProp("m_Glow.m_glowColorOverride", 33023);
				else if ( survivor.GetHealth() <= 25 )
					survivor.SetNetProp("m_Glow.m_glowColorOverride", 255);
			}
		}
	}
}

::FinaleTankSpawn <- function ( args )
{
	if ( ("cm_TankLimit" in SessionOptions) && (SessionOptions.cm_TankLimit == 0) )
		SessionOptions.cm_TankLimit <- 4;
	Utils.SpawnZombie(Z_TANK);
}

::FinaleDelay <- function ( args )
{
	Utils.StartFinale();
	Timers.AddTimerByName("HealthDecayTimer", 2.0, true, HealthDecay);
	
	if ( SessionState.ModeName != "zsltuesday" && SessionState.ModeName != "zslsaturday" )
		Timers.AddTimerByName("ZSLTankFinaleTimer", 60.0, true, FinaleTankSpawn);
}

::OpenDoor <- function ( args )
{
	if ( SessionState.HasSurvivalFinale )
	{
		Say( null, "You have 10 seconds to leave the saferoom or it will become your tomb!", false );
		Timers.AddTimer(10.0, false, SaferoomInferno);
	}
	
	g_ModeScript.StatHUD.Fields.timer.flags = g_ModeScript.StatHUD.Fields.timer.flags | HUD_FLAG_NOTVISIBLE
	
	local dist = null;
	local ent = null;
	
	foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
	{
		if ( !door.GetNetPropBool( "m_hasUnlockSequence" ) )
			continue;
		
		local distTo = Utils.CalculateDistance( Players.AnySurvivor().GetLocation(), door.GetLocation() );
		
		if ( !dist || distTo < dist )
		{
			dist = distTo;
			ent = door;
		}
	}
	
	if ( ent )
	{
		ent.Input( "DisableShadow" );
		ent.Input( "DisableCollision" );
		ent.SetNetPropInt( "m_nRenderMode", 1 );
		ent.Input( "Alpha", 70 );
	}
}

::KillSurvivors <- function ( args )
{
	SessionState.AllowRevive = false;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		if ( !SessionState.SurvivorIsSafe[survivor.GetCharacterName()] )
		{
			if ( SessionState.KillTimerDecreasesScore )
			{
				if ( g_ModeScript.SurvivorStats.score[survivor.GetCharacterName()] >= 2 )
					g_ModeScript.SurvivorStats.score[survivor.GetCharacterName()] -= 2;
				else if ( g_ModeScript.SurvivorStats.score[survivor.GetCharacterName()] == 1 )
					g_ModeScript.SurvivorStats.score[survivor.GetCharacterName()]--;
			}
			survivor.Kill();
		}
	}
	
	foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
	{
		if ( door.GetNetPropBool( "m_hasUnlockSequence" ) || door.GetName() == "checkpoint_exit" )
			continue;
		
		door.RemoveSpawnFlags( 32768 );
		door.Input( "Alpha", 255 );
		door.Input( "EnableShadow" );
		door.Input( "EnableCollision" );
		door.Input( "Close" );
		door.EmitSound( "bridge.gate_slam" );
	}
}

::CheckNeededSurvivors <- function ()
{
	if ( SessionState.ScoredSurvivors >= SessionState.NeededSurvivors )
	{
		if ( SessionState.IsRaceEvent )
		{
			SessionState.AllowRevive = false;
			Timers.AddTimer(0.1, false, KillSurvivors);
		}
		else
		{
			foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
			{
				if ( door.GetNetPropBool( "m_hasUnlockSequence" ) || door.GetName() == "checkpoint_exit" )
					continue;
				
				door.RemoveSpawnFlags( 32768 );
				door.Input( "Alpha", 255 );
				door.Input( "EnableShadow" );
				door.Input( "EnableCollision" );
				door.Input( "Close" );
				door.EmitSound( "bridge.gate_slam" );
			}
		}
		SessionState.SurvivorsSafe = true;
	}
}

::ListOfRandomWeps <-
[
	"autoshotgun"
	"shotgun_spas"
	"rifle"
	"rifle_ak47"
	"rifle_desert"
	//"hunting_rifle"
	//"sniper_military"
	"smg_silenced"
]

::ListOfWepSkins <-
{
	autoshotgun = 1
	rifle = 2
	rifle_ak47 = 2
	smg_silenced = 1
}

::GiveWeapons <- function( args )
{
	Utils.SanitizeHeldPrimary();
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach (survivor in Players.AliveSurvivors())
		{
			local wepSkin = 0;
			local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
			if ( randWep in ListOfWepSkins )
				wepSkin = RandomInt(0, ListOfWepSkins[randWep]);
			survivor.Give(randWep, wepSkin);
		}
	}
	
	local function GiveLaserSight( args )
	{
		// Give each survivor a laser sight
		foreach (survivor in Players.AliveSurvivors())
		{
			survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
		}
	}
	
	// A 0.1 second delay is wayyy more than enough time after sanitizing weapons
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(0.5, false, GiveLaserSight);
}

::StopSurvivorScene <- function ( survivor )
{
	survivor.Input( "CancelCurrentScene" );
}

function Notifications::OnReviveSuccess::RevivedSurvivor( player, reviver, params )
{
	if ( player.IsSurvivor() )
	{
		player.SetRawHealth(100);
		player.SetHealthBuffer(0);
		Timers.AddTimer(0.3, false, StopSurvivorScene, player);
		
		if ( player.IsLastStrike() )
		{
			player.SetNetProp("m_Glow.m_glowColorOverride", 255);
			return;
		}
		
		if ( player.GetReviveCount() == 0 )
			player.SetGlowColor(255, 61, 122);
		else if ( player.GetReviveCount() == 1 )
			player.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		else if ( player.GetReviveCount() == 2 )
			player.SetNetProp("m_Glow.m_glowColorOverride", 255);
	}
}

function Notifications::OnIncapacitated::ReviveSurvivor( victim, attacker, params )
{
	if ( SessionState.AllowRevive && victim.GetType() == Z_SURVIVOR )
		victim.Revive();
}

::EndGame <- function ( args )
{
	SessionState.GameEnded = true;
	Utils.RollStatsCrawl();
	Say( null, SessionState.Score1, false );
	Say( null, SessionState.Score2, false );
	Say( null, SessionState.Score3, false );
	Say( null, SessionState.Score4, false );
}

function Notifications::OnSpawn::ZSLSpecialSpawned( player, params )
{
	if ( player.GetTeam() == INFECTED )
	{
		player.InputColor(RandomInt( 0, 255 ), RandomInt( 0, 255 ), RandomInt( 0, 255 ));
		
		if ( SessionOptions.BoomerLimit == 0 && player.GetType() == Z_BOOMER )
			player.KillEntity();
		else if ( SessionOptions.SmokerLimit == 0 && player.GetType() == Z_SMOKER )
			player.KillEntity();
		else if ( SessionOptions.HunterLimit == 0 && player.GetType() == Z_HUNTER )
			player.KillEntity();
		else if ( SessionOptions.ChargerLimit == 0 && player.GetType() == Z_CHARGER )
			player.KillEntity();
		else if ( SessionOptions.SpitterLimit == 0 && player.GetType() == Z_SPITTER )
			player.KillEntity();
		else if ( SessionOptions.JockeyLimit == 0 && player.GetType() == Z_JOCKEY )
			player.KillEntity();
		else
		{
			local zombieType = player.GetType();
			if ( zombieType < 7 )
			{
				local modelName = player.GetModel();
				
				if ( !SessionState.ModelCheck[ zombieType - 1 ] )
				{
					if ( (zombieType == 2) && !("zsl_no_female_boomers" in getroottable()) )
					{
						if ( SessionState.LastBoomerModel != modelName )
						{
							SessionState.LastBoomerModel = modelName;
							SessionState.BoomersChecked++;
						}
						if ( SessionState.BoomersChecked > 1 )
							SessionState.ModelCheck[ zombieType - 1 ] = true;
					}
					else
						SessionState.ModelCheck[ zombieType - 1 ] = true;
					
					if ( SessionState.SIModelsBase[zombieType - 1].find( modelName ) == null )
					{
						SessionState.SIModelsBase[zombieType - 1].append( modelName );
						SessionState.SIModels[zombieType - 1].append( modelName );
					}
				}
				
				if ( SessionState.SIModelsBase[zombieType - 1].len() == 1 )
					return;
				
				local zombieModels = SessionState.SIModels[zombieType - 1];
				if ( zombieModels.len() == 0 )
					SessionState.SIModels[zombieType - 1].extend( SessionState.SIModelsBase[zombieType - 1] );
				local foundModel = zombieModels.find( modelName );
				if ( foundModel != null )
				{
					zombieModels.remove( foundModel );
					return;
				}
				
				local randomElement = RandomInt( 0, zombieModels.len() - 1 );
				local randomModel = zombieModels[ randomElement ];
				zombieModels.remove( randomElement );
				player.SetModel( randomModel );
			}
		}
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.IsSurvivor() )
	{
		victim.SetNetProp("m_Glow.m_glowColorOverride", 0);
		victim.SetNetProp("m_Glow.m_iGlowType", 0);
		EntFire( "survivor_death_model", "BecomeRagdoll" );
		SessionState.NeededSurvivors--;
		
		if ( Utils.IsFinale() && SessionState.HasSurvivalFinale )
		{
			if ( SessionState.NeededSurvivors == 1 )
			{
				local winner = Players.AnyAliveSurvivor();
				if ( winner )
				{
					winner.SetNetProp( "m_takedamage", 0 );
					g_ModeScript.SurvivorStats.score[winner.GetCharacterName()] += SessionState.VehicleAward;
					foreach( zombie in Zombies.All() )
						zombie.Input("Kill");
					Utils.StopDirector();
					g_ModeScript.RemoveHUD();
					g_ModeScript.DisplayScores();
				}
			}
		}
	}
}

function Notifications::OnEnterSaferoom::KillInfected( player, params )
{
	if ( player.GetTeam() == INFECTED )
		player.Kill();
}

::EnterSaferoom <- function ( player )
{
	if ( SessionState.EndRound )
		return;
	
	if ( (!player.IsEntityValid()) || (!player.IsInCheckpoint() && !player.IsInStartArea()) )
		return;
	
	if ( player.IsInCheckpoint() )
	{
		SessionState.SurvivorIsSafe[player.GetCharacterName()] <- true;
		
		if ( SessionState.SaferoomAwardsScore && SessionState.SaferoomCheck && !SessionState.Scored[player.GetCharacterName()] )
		{
			if ( SessionState.IsRaceEvent )
			{
				if ( SessionState.FirstInSaferoom == "" )
				{
					SessionState.FirstInSaferoom = player.GetCharacterName();
					SurvivorStats.score[player.GetCharacterName()] += 3;
				}
				else
				{
					if ( SessionState.SecondInSaferoom == "" )
					{
						SessionState.SecondInSaferoom = player.GetCharacterName();
						SurvivorStats.score[player.GetCharacterName()] += 2;
					}
					else
					{
						if ( SessionState.ThirdInSaferoom == "" )
						{
							SessionState.ThirdInSaferoom = player.GetCharacterName();
							SurvivorStats.score[player.GetCharacterName()] += 1;
						}
					}
				}
				SessionState.Scored[player.GetCharacterName()] <- true;
			}
			else
			{
				if ( SessionState.SaferoomWeaponNeeded != "" )
				{
					if ( player.GetActiveWeapon().GetClassname() == SessionState.SaferoomWeaponNeeded )
					{
						SurvivorStats.score[player.GetCharacterName()]++;
						SessionState.Scored[player.GetCharacterName()] <- true;
					}
				}
				else
				{
					SurvivorStats.score[player.GetCharacterName()] += SessionState.SaferoomAward;
					SessionState.Scored[player.GetCharacterName()] <- true;
				}
			}
			SessionState.ScoredSurvivors++;
			
			if ( !SessionState.SurvivorsSafe && !Utils.IsFinale() )
			{
				CheckNeededSurvivors();
			}
		}
	}
	else if ( player.IsInStartArea() )
	{
		SessionState.SurvivorInStart[player.GetCharacterName()] <- true;
	}
}

function Notifications::OnEnterSaferoom::SurvivorIsSafe( player, params )
{
	if ( SessionState.EndRound )
		return;
	
	if ( player.IsSurvivor() )
	{
		Timers.AddTimer(0.1, false, EnterSaferoom, player);
	}
}

::LeaveSaferoom <- function ( player )
{
	if ( SessionState.EndRound )
		return;
	
	if ( (!player.IsEntityValid()) || (player.IsInCheckpoint() && player.IsInStartArea()) )
		return;
	
	SessionState.SurvivorIsSafe[player.GetCharacterName()] <- false;
	SessionState.SurvivorInStart[player.GetCharacterName()] <- false;
}

function Notifications::OnLeaveSaferoom::SurvivorIsNotSafe( player, params )
{
	if ( SessionState.EndRound )
		return;
	
	if ( player.IsSurvivor() )
	{
		Timers.AddTimer(0.1, false, LeaveSaferoom, player);
	}
}

function Notifications::OnEnterRescueVehicle::SurvivorEscaped( player )
{
	if ( !SessionState.AwardedRescueScore )
	{
		g_ModeScript.SurvivorStats.score[player.GetCharacterName()] += SessionState.VehicleAward;
		SessionState.AwardedRescueScore = true;
	}
	SessionState.AllowRevive = false;
	foreach( survivor in Players.AliveSurvivors() )
		if ( survivor.GetEntityHandle() != player.GetEntityHandle() )
			survivor.Kill();
}

function Notifications::OnRescueVehicleLeaving::ShowScores( survivorCount, params )
{
	if ( SessionState.GameEnded )
		return;
	
	g_ModeScript.RemoveHUD();
	g_ModeScript.DisplayScores();
}

function Notifications::OnRoundStart::LoadData()
{
	RestoreTable( "Stats", SurvivorStats );
	RestoreTable( "StatsBackup", SurvivorStatsBackup );
}

function Notifications::OnRoundStart::RemoveZombieSpawns()
{
	if ( SessionOptions.cm_CommonLimit == 0 )
	{
		if ( SessionState.MapName == "AirCrash" )
		{
			EntFire( "breakwall1", "Break" );
			EntFire( "breakwall2", "Break" );
			EntFire( "breakwall_stop", "Kill" );
		}
		Utils.RemoveZombieSpawns();
	}
	if ( SessionOptions.cm_MaxSpecials == 0 )
		Utils.RemoveSpecialSpawns();
}

function Notifications::OnRoundStart::ZSLRemoveStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "prop_minigun", "Kill" );
	EntFire( "prop_minigun_l4d1", "Kill" );
	EntFire( "prop_mounted_machine_gun", "Kill" );
	foreach( wep, val in SessionOptions.weaponsToRemove )
		EntFire( wep + "_spawn", "Kill" );
}

function Notifications::OnRoundStart::UpdateHUD()
{
	if ( SessionState.HasSurvivalFinale )
	{
		if ( Utils.IsFinale() )
		{
			if ( Utils.GetMapRestarts() == 1 )
				SessionState.Attempts = "OVERTIME!!";
			SessionOptions.SpecialInitialSpawnDelayMin <- 20;
			SessionOptions.SpecialInitialSpawnDelayMax <- 20;
			SessionOptions.A_CustomFinale1 <- STAGE_PANIC;
			SessionOptions.A_CustomFinaleValue1 <- 999999;
		}
		else
		{
			if ( Utils.GetMapRestarts() == 0 )
				SessionState.Attempts = "First Attempt";
			else if ( Utils.GetMapRestarts() == 1 )
				SessionState.Attempts = "Second Attempt";
			else if ( Utils.GetMapRestarts() == 2 )
				SessionState.Attempts = "Final Attempt";
		}
	}
	
	if ( SessionState.IsRaceEvent )
		SessionState.NeededSurvivors = 3;
}

function Notifications::OnHurt::ZSLSurvivorHurt( entity, attacker, params )
{
	if ( !(entity) || !(entity.IsSurvivor()) )
		return;
	
	if ( Utils.GetMaxIncapCount() == 0 )
	{
		if ( entity.GetHealth() > 25 && entity.GetHealth() <= 50 )
		{
			entity.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		}
		else if ( entity.GetHealth() <= 25 )
		{
			entity.SetNetProp("m_Glow.m_glowColorOverride", 255);
		}
	}
}

function Notifications::OnSurvivorsSpawned::GameStarted( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		SessionState.Scored[survivor.GetCharacterName()] <- false;
		SessionState.SurvivorIsSafe[survivor.GetCharacterName()] <- false;
		SessionState.SurvivorInStart[survivor.GetCharacterName()] <- false;
		
		if ( !(survivor.GetCharacterName() in SurvivorStats.score) )
			SurvivorStats.score[survivor.GetCharacterName()] <- 0;
		
		if ( SurvivorStats.tiedscore )
		{
			if ( !(survivor.GetCharacterName() in SurvivorStats.tiedsurvivors) )
			{
				survivor.Kill();
				continue;
			}
		}
		
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
		survivor.SetGlowColor( 255, 61, 122 );
		survivor.SetNetProp( "m_Glow.m_iGlowType", 3 );
	}
	
	if ( SessionState.IsRaceEvent && !Utils.IsIntro() )
	{
		g_ModeScript.StatHUD.Fields.timer.flags = g_ModeScript.StatHUD.Fields.timer.flags & ~HUD_FLAG_NOTVISIBLE
		HUDManageTimers( 0, TIMER_COUNTDOWN, 30 );
		Timers.AddTimer(30.0, false, OpenDoor);
		foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
		{
			door.AddSpawnFlags( 32768 );
			
			if ( !door.GetNetPropBool( "m_hasUnlockSequence" ) )
			{
				door.Input( "Close" );
				door.Input( "DisableShadow" );
				door.Input( "DisableCollision" );
				door.SetNetPropInt( "m_nRenderMode", 1 );
				door.Input( "Alpha", 70 );
			}
		}
	}
	else
	{
		if ( Utils.IsFinale() && SessionState.AutoStartFinale )
		{
			g_ModeScript.StatHUD.Fields.timer.flags = g_ModeScript.StatHUD.Fields.timer.flags & ~HUD_FLAG_NOTVISIBLE
			HUDManageTimers( 0, TIMER_COUNTDOWN, 30 );
			Timers.AddTimer(30.0, false, OpenDoor);
			foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
			{
				door.AddSpawnFlags( 32768 );
			}
		}
		else
		{
			foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
			{
				if ( door.GetNetPropBool( "m_hasUnlockSequence" ) || door.GetName() == "checkpoint_exit" )
					continue;
				
				door.AddSpawnFlags( 32768 );
				door.Input( "Close" );
				door.Input( "DisableShadow" );
				door.Input( "DisableCollision" );
				door.SetNetPropInt( "m_nRenderMode", 1 );
				door.Input( "Alpha", 70 );
			}
		}
	}
	
	if ( SessionState.HasSurvivalFinale )
	{
		if ( !Utils.IsFinale() )
		{
			if ( Utils.GetMapRestarts() == 3 )
			{
				foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
				{
					if ( door.GetNetPropBool( "m_hasUnlockSequence" ) || door.GetName() == "checkpoint_exit" )
						continue;
					
					door.RemoveSpawnFlags( 32768 );
					door.Input( "Close" );
				}
			}
			g_ModeScript.StatHUD.Fields.attempts.flags = g_ModeScript.StatHUD.Fields.attempts.flags & ~HUD_FLAG_NOTVISIBLE
		}
		else
		{
			if ( Utils.GetMapRestarts() == 1 )
				g_ModeScript.StatHUD.Fields.attempts.flags = g_ModeScript.StatHUD.Fields.attempts.flags & ~HUD_FLAG_NOTVISIBLE
			g_ModeScript.StatHUD.Fields.timer.staticstring = "Survival Round Begins in: ";
			SessionOptions.SurvivorMaxIncapacitatedCount = 1;
		}
	}
	
	HUDSetLayout( g_ModeScript.StatHUD );
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	if ( Utils.IsFinale() )
	{
		if ( SessionState.HasSurvivalFinale )
		{
			Timers.AddTimer(20.0, false, FinaleDelay);
		}
		else
		{
			if ( SessionState.AutoStartFinale )
				Utils.TriggerRescue();
		}
	}
}

function Notifications::OnSurvivorsLeftStartArea::ZSLStuff()
{
	foreach( survivor in Players.AliveSurvivors() )
		survivor.Input( "DisableLedgeHang" );
	
	if ( SessionState.AutoTriggerEvents )
	{
		EntFire( "spawn_church_zombie", "Kill" );
		
		EntFire( "gunshop_door_button", "kill" );
		EntFire( "gunshop_door_01", "unlock" );
		EntFire( "gunshop_door_01", "open" );
		EntFire( "gunshop_door_01", "setbreakable" );
		EntFire( "tanker_destroy_relay", "trigger" );
		EntFire( "whitaker_relay", "trigger" );
		EntFire( "carousel_start_relay", "trigger" );
		EntFire( "carousel_gate_relay", "trigger" );
		EntFire( "carousel_game_event", "kill" );
		EntFire( "carousel_gate_button_model", "setanimation", "on" );
		EntFire( "carousel_gate_button_model", "stopglowing" );
		EntFire( "carousel_gate_button_sound", "playsound" );
		EntFire( "carousel_instruct_timer", "kill" );
		EntFire( "carousel_gate_button", "kill" );
		EntFire( "carousel_button2_relay", "trigger" );
		EntFire( "relay_start_onslaught", "trigger" );
		EntFire( "minifinale_gates_slide_door", "open" );
		EntFire( "ticketbooth_hint", "kill" );
		EntFire( "minifinale_gates_sound", "playsound" );
		EntFire( "ferry_button_stick_relay", "trigger" );
		EntFire( "bridge_button", "press" );
		EntFire( "button_callelevator", "press" );
		EntFire( "relay_car_ready", "trigger" );
		EntFire( "finale_cleanse_entrance_door", "lock" );
		EntFire( "finale_cleanse_exit_door", "unlock" );
		EntFire( "ceda_trailer_canopen_frontdoor_listener", "kill" );
		EntFire( "finale_cleanse_backdoors_blocker", "kill" );
		EntFire( "finale_end_doors_left", "open" );
		EntFire( "finale_end_doors_right", "open" );
		EntFire( "tractor_start_relay", "trigger" );
		EntFire( "filter_generator", "testactivator" );
		EntFire( "elevator","movetofloor", "bottom" );
		EntFire( "elevator_pulley", "start" );
		EntFire( "elevator_pulley2", "start" );
		EntFire( "elevbuttonoutsidefront", "skin", "1" );
		EntFire( "sound_elevator_startup", "playsound" );
		EntFire( "elevator_start_shake", "startshake" );
		EntFire( "elevator_number_relay", "trigger" );
		EntFire( "elevator_breakwalls*", "kill" );
		EntFire( "elevator_game_event", "kill" );
		EntFire( "button_minifinale", "press" );
		EntFire( "relay_enable_chuch_zombie_loop", "trigger" );
		EntFire( "train_engine_button", "press" );
		EntFire( "tankdoorin", "unlock" );
		EntFire( "tankdoorin", "open" );
		EntFire( "tankdoorin_button", "kill" );
		EntFire( "tankdoorout", "unlock" );
		EntFire( "tankdoorout", "open" );
		EntFire( "tankdoorout_button", "kill" );
		EntFire( "tank_sound_timer", "kill" );
		EntFire( "radio_fake_button", "press" );
		EntFire( "drawbridge", "movetofloor", "bottom" );
		EntFire( "drawbridge_start_sound", "playsound" );
		EntFire( "startbldg_door_button", "press" );
		EntFire( "startbldg_door", "open" );
		EntFire( "stage_lights_button", "press" );
		EntFire( "fire_howitzer", "press" );
		if ( SessionState.MapName == "c9m2_lots" )
		{
			EntFire( "finaleswitch_initial", "Kill" );
			EntFire( "finale_lever", "Enable", "", 5 );
			EntFire( "radio_game_event_pre", "Kill" );
			EntFire( "radio_game_event", "GenerateGameEvent" );
			EntFire( "sound_generator_start", "StopSound" );
			EntFire( "generator_start_particles", "Start" );
			EntFire( "generator_light_switchable", "TurnOn" );
			EntFire( "generator_lights", "LightOn" );
			EntFire( "sound_generator_run", "PlaySound", "", 0.8 );
			EntFire( "lift_switch_spark", "SparkOnce", "", 1 );
			EntFire( "lift_lever", "SetDefaultAnimation", "IDLE_DOWN", 0.1 );
			EntFire( "lift_lever", "SetAnimation", "DOWN" );
			EntFire( "lift_spark02", "SparkOnce" );
			EntFire( "lift_spark01", "SparkOnce" );
			EntFire( "radio_game_event", "Kill" );
			EntFire( "survivalmode_exempt", "Trigger" );
			EntFire( "generator_break_timer", "Enable" );
			EntFire( "generator_hint", "EndHint" );
			EntFire( "survival_start_relay", "Trigger" );
		}
		EntFire( "button", "press" );
		EntFire( "crane button", "press" );
		EntFire( "barricade_gas_can", "ignite" );
		
		NavMesh.UnblockRescueVehicleNav();
	}
	
	if ( SessionState.HasSurvivalFinale )
		EntFire( "trigger_heli", "kill" );
	
	if ( !SessionState.EndRound && !Utils.IsFinale() )
	{
		local dist = null;
		local ent = null;
		
		foreach ( door in Objects.OfClassname("prop_door_rotating_checkpoint") )
		{
			if ( door.GetNetPropBool( "m_hasUnlockSequence" ) || door.GetName() == "checkpoint_exit" )
				continue;
			
			if ( door.GetNetPropInt( "m_eDoorState" ) != 2 )
			{
				local distTo = Utils.CalculateDistance( Players.AnySurvivor().GetLocation(), door.GetLocation() );
				
				if ( !dist || distTo > dist )
				{
					dist = distTo;
					ent = door;
				}
			}
		}
		
		if ( ent && dist > 999.9 )
		{
			ent.Input( "Close" );
			ent.Input( "DisableShadow" );
			ent.Input( "DisableCollision" );
			ent.SetNetPropInt( "m_nRenderMode", 1 );
			ent.Input( "Alpha", 70 );
		}
	}
	
	SessionState.SaferoomCheck = true;
	if ( SessionState.EventRules != "" )
		ClientPrint( null, 5, "ZSL: " + SessionState.EventRules );
}

function Notifications::OnBotReplacedPlayer::IdleStart( player, bot, params )
{
	player.SetNetProp( "m_Glow.m_iGlowType", 0 );
	
	if ( Utils.GetMaxIncapCount() == 0 )
	{
		if ( bot.GetHealth() > 50 )
			bot.SetGlowColor( 255, 61, 122 );
		else if ( bot.GetHealth() > 25 && bot.GetHealth() <= 50 )
			bot.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		else if ( bot.GetHealth() <= 25 )
			bot.SetNetProp("m_Glow.m_glowColorOverride", 255);
	}
	else
	{
		if ( bot.GetReviveCount() == 0 )
			bot.SetGlowColor( 255, 61, 122 );
		else if ( bot.GetReviveCount() == 1 )
			bot.SetNetProp( "m_Glow.m_glowColorOverride", 33023 );
		else if ( bot.GetReviveCount() == 2 )
			bot.SetNetProp( "m_Glow.m_glowColorOverride", 255 );
	}
	
	if ( bot.IsAlive() )
		bot.SetNetProp( "m_Glow.m_iGlowType", 3 );
}

function Notifications::OnPlayerReplacedBot::IdleEnd( player, bot, params )
{
	bot.SetNetProp( "m_Glow.m_iGlowType", 0 );
	
	if ( Utils.GetMaxIncapCount() == 0 )
	{
		if ( player.GetHealth() > 50 )
			player.SetGlowColor( 255, 61, 122 );
		else if ( player.GetHealth() > 25 && player.GetHealth() <= 50 )
			player.SetNetProp("m_Glow.m_glowColorOverride", 33023);
		else if ( player.GetHealth() <= 25 )
			player.SetNetProp("m_Glow.m_glowColorOverride", 255);
	}
	else
	{
		if ( player.GetReviveCount() == 0 )
			player.SetGlowColor( 255, 61, 122 );
		else if ( player.GetReviveCount() == 1 )
			player.SetNetProp( "m_Glow.m_glowColorOverride", 33023 );
		else if ( player.GetReviveCount() == 2 )
			player.SetNetProp( "m_Glow.m_glowColorOverride", 255 );
	}
	
	if ( player.IsAlive() )
		player.SetNetProp( "m_Glow.m_iGlowType", 3 );
	if ( player.GetReviveCount() < 2 )
	{
		player.StopSound( "Player.HeartbeatLoop" );
		player.StopSound( "Player.Heartbeat" );
	}
}

function RemoveHUD()
{
	//Remove unneeded HUD elements for score display
	StatHUD.Fields.timer.flags = StatHUD.Fields.timer.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name0.flags = StatHUD.Fields.name0.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name1.flags = StatHUD.Fields.name1.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name2.flags = StatHUD.Fields.name2.flags | HUD_FLAG_NOTVISIBLE
	StatHUD.Fields.name3.flags = StatHUD.Fields.name3.flags | HUD_FLAG_NOTVISIBLE
}

function DisplayScores()
{
	local Scores = {};
	foreach ( survivor in Players.Survivors() )
		Scores.rawset( survivor, SurvivorStats.score[survivor.GetCharacterName()] );
	
	local HiScores = [];
	local slot = 0;
	
	while ( Scores.len() > 0 )
	{
		local highestScore = 0;
		local player = null;
		
		foreach( survivor, score in Scores )
		{
			if ( score >= highestScore )
			{
				highestScore = score;
				player = survivor;
			}
		}
		
		HiScores.insert(slot, player);
		Scores.rawdelete(player);
		slot++;
	}
	
	SessionState.FirstScore = SurvivorStats.score[HiScores[0].GetCharacterName()];
	SessionState.FirstName = HiScores[0].GetName();
	SessionState.FirstSurvivor = HiScores[0];
	SessionState.SecondScore = SurvivorStats.score[HiScores[1].GetCharacterName()];
	SessionState.SecondName = HiScores[1].GetName();
	SessionState.SecondSurvivor = HiScores[1];
	SessionState.ThirdScore = SurvivorStats.score[HiScores[2].GetCharacterName()];
	SessionState.ThirdName = HiScores[2].GetName();
	SessionState.ThirdSurvivor = HiScores[2];
	SessionState.FourthScore = SurvivorStats.score[HiScores[3].GetCharacterName()];
	SessionState.FourthName = HiScores[3].GetName();
	SessionState.FourthSurvivor = HiScores[3];
	
	SessionState.Score1 = SessionState.FirstPlace + SessionState.FirstName + " (" + SessionState.FirstScore + ")";
	SessionState.Score2 = SessionState.SecondPlace + SessionState.SecondName + " (" + SessionState.SecondScore + ")";
	SessionState.Score3 = SessionState.ThirdPlace + SessionState.ThirdName + " (" + SessionState.ThirdScore + ")";
	SessionState.Score4 = SessionState.FourthPlace + SessionState.FourthName + " (" + SessionState.FourthScore + ")";
	
	if ( SessionState.HasSurvivalFinale && SessionState.FirstScore == SessionState.SecondScore )
	{
		SurvivorStats.tiedsurvivors.rawset( SessionState.FirstSurvivor.GetCharacterName(), true );
		SurvivorStats.tiedsurvivors.rawset( SessionState.SecondSurvivor.GetCharacterName(), true );
		
		if ( SessionState.SecondScore == SessionState.ThirdScore )
			SurvivorStats.tiedsurvivors.rawset( SessionState.ThirdSurvivor.GetCharacterName(), true );
		if ( SessionState.SecondScore == SessionState.FourthScore )
			SurvivorStats.tiedsurvivors.rawset( SessionState.FourthSurvivor.GetCharacterName(), true );
		
		SurvivorStats.tiedscore = true;
		
		foreach( survivor in Players.AliveSurvivors() )
		{
			survivor.SetNetProp( "m_takedamage", 2 );
			survivor.Kill();
		}
		
		HUDPlace( HUD_MID_BOX, 0.30, 0.32, 0.44, 0.06 );
		SessionState.FinalScores = "Survivors are tied, going to Sudden Death!!";
		g_ModeScript.StatHUD.Fields.scores.flags = g_ModeScript.StatHUD.Fields.scores.flags & ~HUD_FLAG_NOTVISIBLE
	}
	else
	{
		HUDPlace( HUD_MID_BOX, 0.30, 0.32, 0.44, 0.06 );
		HUDPlace( HUD_RIGHT_BOT, 0.30, 0.32, 0.44, 0.40 );
		HUDPlace( HUD_SCORE_1, 0.38, 0.40, 0.44, 0.06 ); //HUDPlace( HUD_SCORE_1, 0.28, 0.50, 0.44, 0.06 )
		HUDPlace( HUD_SCORE_2, 0.38, 0.48, 0.44, 0.06 ); //HUDPlace( HUD_SCORE_2, 0.28, 0.58, 0.44, 0.06 )
		HUDPlace( HUD_SCORE_3, 0.38, 0.56, 0.44, 0.06 ); //HUDPlace( HUD_SCORE_3, 0.28, 0.66, 0.44, 0.06 )
		HUDPlace( HUD_SCORE_4, 0.38, 0.64, 0.44, 0.06 ); //HUDPlace( HUD_SCORE_4, 0.28, 0.74, 0.44, 0.06 )
		StatHUD.Fields.scores.flags = StatHUD.Fields.scores.flags & ~HUD_FLAG_NOTVISIBLE
		StatHUD.Fields.scorebackground.flags = StatHUD.Fields.scorebackground.flags & ~HUD_FLAG_NOTVISIBLE
		StatHUD.Fields.score0.flags = StatHUD.Fields.score0.flags & ~HUD_FLAG_NOTVISIBLE
		StatHUD.Fields.score1.flags = StatHUD.Fields.score1.flags & ~HUD_FLAG_NOTVISIBLE
		StatHUD.Fields.score2.flags = StatHUD.Fields.score2.flags & ~HUD_FLAG_NOTVISIBLE
		StatHUD.Fields.score3.flags = StatHUD.Fields.score3.flags & ~HUD_FLAG_NOTVISIBLE
		Timers.AddTimer(10.0, false, EndGame);
	}
}

function SetupModeHUD()
{
	StatHUD <-
	{
		Fields =
		{
			scores = 
			{
				slot = HUD_MID_BOX ,
				datafunc = @() SessionState.FinalScores,
				name = "scores",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
			}
			timer = 
			{
				slot = HUD_SCORE_TITLE ,
				staticstring = SessionState.TimerString,
				name = "timer",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
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
			scorebackground = 
			{
				slot = HUD_RIGHT_BOT ,
				datafunc = @() SessionState.EmptyString,
				name = "scorebackground",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER,
			}
			attempts = 
			{
				slot = HUD_LEFT_BOT ,
				datafunc = @() SessionState.Attempts,
				name = "attempts",
				flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
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
	HUDPlace( HUD_FAR_LEFT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_TOP, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_FAR_RIGHT, 0.0, 0.02, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOT, 0.0, 0.06, 1.0, 0.045 );
	HUDPlace( HUD_MID_BOX, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_LEFT_BOT, 0.0, 0.04, 1.0, 0.045 );
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	//HUDSetLayout( StatHUD );
}

function EasyLogic::Update::ZSLThink()
{
	if ( SessionOptions.cm_CommonLimit == 0 && Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
	if ( !SessionState.SurvivorsSafe && !Utils.IsFinale() && SessionState.SaferoomAwardsScore && SessionState.SaferoomCheck )
	{
		CheckNeededSurvivors();
	}
}
