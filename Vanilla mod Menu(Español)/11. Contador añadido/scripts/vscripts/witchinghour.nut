//-----------------------------------------------------
Msg("Activating The Witching Hour\n");
Msg("Made by Rayman1103 and ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheCSSWeapons();

MutationOptions <-
{
	cm_AllowSurvivorRescue = 0
	CommonLimit = 0
	MaxSpecials = 0
	SmokerLimit = 0
	BoomerLimit = 0
	HunterLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0
	TankLimit = 0
	WitchLimit = 10
	
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
		weapon_pipe_bomb = 0
		//weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
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
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_upgradepack_explosive =	"weapon_upgradepack_incendiary"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
	DefaultItems =
	[
		"weapon_pistol_magnum"
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
}

MutationState <-
{
	CurrentStage = -1
	TriggerRescue = false
}

::ListOfRandomWeps <-
[
	"smg"
	"smg_silenced"
	"pumpshotgun"
	"shotgun_chrome"
	"autoshotgun"
	"shotgun_spas"
	"rifle"
	"rifle_ak47"
	"rifle_desert"
	"hunting_rifle"
	"sniper_military"
	"smg_mp5"
	"rifle_sg552"
	//"sniper_scout"
	//"sniper_awp"
]

function GetNextStage()
{
	if ( SessionState.TriggerRescue )
	{
		Msg("Activated STAGE_ESCAPE\n");
		SessionOptions.ScriptedStageType = STAGE_ESCAPE
		SessionOptions.ScriptedStageValue = 0
		SessionState.TriggerRescue = false;
	}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( attacker.GetClassname() == "witch" && victim.GetTeam() == SURVIVORS )
		{
			if ( Utils.GetDifficulty() == EASY )
			{
				ScriptedDamageInfo.DamageDone = 3;
				return true;
			}
			else if ( Utils.GetDifficulty() == NORMAL )
			{
				ScriptedDamageInfo.DamageDone = 4;
				return true;
			}
			else if ( Utils.GetDifficulty() == ADVANCED )
			{
				ScriptedDamageInfo.DamageDone = 5;
				return true;
			}
			else if ( Utils.GetDifficulty() == EXPERT )
			{
				ScriptedDamageInfo.DamageDone = 10;
				return true;
			}
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function SetupModeHUD()
{
	if ( !Utils.IsScavengeFinale() )
	{
		WitchingHourHUD <-
		{
			Fields =
			{
				timer = 
				{
					slot = HUD_MID_TOP ,
					staticstring = "Witches recalled to the Netherworld in: ",
					name = "timer",
					flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
					special = HUD_SPECIAL_TIMER0
				}
			}
		}
		HUDPlace( HUD_MID_TOP, 0.0, 0.00, 1.0, 0.045 );
		HUDSetLayout( WitchingHourHUD );
	}
}

::GiveWeapons <- function( args )
{
	Utils.SanitizeHeldWeapons();
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
			survivor.Give(randWep);
			survivor.Give("pistol_magnum");
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
	Timers.AddTimer(0.2, false, GiveLaserSight);
}

::RespawnWitches <- function ( args )
{
	if ( !Utils.IsScavengeFinale() )
		HUDManageTimers( 0, TIMER_COUNTDOWN, 120 );
	Utils.SayToAll( "The Witching Hour Has Begun..." );
	SessionOptions.WitchLimit = 10;
	
	// This will kill the witches in 120 seconds
	if ( !Utils.IsScavengeFinale() )
		Timers.AddTimer(120.0, false, KillWitches);
	
	// By adding a timer by name, any timer that previously existed with the specified name will be overwritten.
	// The benefit is that you won't need to mess with timer indexes.
	Timers.AddTimerByName("SpawnWitchTimer", 1.0, true, SpawnWitch );
}

::KillWitches <- function ( args )
{
	EntFire( "witch", "Kill" );
	SessionOptions.WitchLimit = 0;
	Timers.AddTimer( 30.0, false, RespawnWitches );
	Timers.RemoveTimerByName ( "SpawnWitchTimer" );
}

::SpawnWitch <- function ( args )
{
	local player = Players.SurvivorWithHighestFlow();
	local MaxDist = RandomInt( 800, 1200 );
	local MinDist = RandomInt( 400, 800 );
	
	if ( SessionState.MapName == "c6m1_riverbank" )
		Utils.SpawnZombieNearPlayer( player, Z_WITCH_BRIDE, MaxDist, MinDist, false );
	else
		Utils.SpawnZombieNearPlayer( player, Z_WITCH, MaxDist, MinDist, false );
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
}

function Notifications::OnRoundStart::SetHudTimer()
{
	if ( !Utils.IsScavengeFinale() )
	{
		HUDManageTimers( 0, TIMER_COUNTDOWN, 120 );
		HUDManageTimers( 0, TIMER_STOP, 120 );
	}
}

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 4 )
		return;
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		//survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
}

// Start the timer when the player leaves the saferoom!
function Notifications::OnSurvivorsLeftStartArea::StartTheTimer()
{
	// Begin the witch hour
	RespawnWitches(null);
	
	// spawn witches initially
	SpawnWitch( Players.RandomAliveSurvivor() );
}

/*function Notifications::OnRoundStart::ManageRagdolls()
{
	Utils.CreateEntity( "game_ragdoll_manager", Vector( 0, 0, 0 ), QAngle( 0, 0, 0 ), { MaxRagdollCountDX8 = 0, MaxRagdollCount = 0 } );
}*/

::KillWitch <- function ( witch )
{
	if ( !witch.IsEntityValid() )
		return;
	
	witch.Input( "Kill" );
}

function Notifications::OnWitchSpawned::WitchSpawn( witch, params )
{
	Timers.AddTimer(30.0, false, KillWitch, witch);
}

function Notifications::OnRescueVehicleLeaving::RescueLeaving( survivorCount, params )
{
	HUDManageTimers( 0, TIMER_STOP, 0 );
	Timers.RemoveTimerByName ( "SpawnWitchTimer" );
}

function Notifications::OnMapEnd::MapEnded()
{
	HUDManageTimers( 0, TIMER_STOP, 0 );
	Timers.RemoveTimerByName ( "SpawnWitchTimer" );
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	foreach (trigger_finale in Objects.OfClassname("trigger_finale"))
	{
		trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
	}
}

::TriggerRescue <- function ( args )
{
	SessionState.TriggerRescue = true;
	Director.ForceNextStage();
}

::FinaleStarted <- function ()
{
	if ( Utils.IsScavengeFinale() )
		Utils.TriggerRescue();
	else
		Timers.AddTimer( 260.0, false, TriggerRescue );
}

function EasyLogic::OnProcessResponse::RemoveWitchResponses()
{
	local g_witchinghour =
	[
		{
			name = "PlayerWitchStartAttack",
			criteria =
			[
				[ "Concept", "WitchStartAttack" ],
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
			name = "PlayerWarnWitchAngry",
			criteria =
			[
				[ "Concept", "WitchGettingAngry" ],
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
	ResponseRules.ProcessRules( g_witchinghour );
}

function EasyLogic::Update::Think()
{
	if( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
	foreach( witch in Zombies.Witches() )
	{
		local sequence = witch.GetNetPropInt( "m_nSequence" );
		if ( sequence == 5 || sequence == 8 )
			witch.Kill();
	}
}
