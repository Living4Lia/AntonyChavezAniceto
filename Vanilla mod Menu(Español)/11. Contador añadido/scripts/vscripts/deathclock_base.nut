//-----------------------------------------------------

Utils.PrecacheCSSWeapons();

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_AllowSurvivorRescue = false
	cm_CommonLimit = 0
	cm_ShouldHurry = 1
	cm_MaxSpecials = 14
	cm_DominatorLimit = 14
	cm_AutoReviveFromSpecialIncap = 1
	cm_SpecialRespawnInterval = 0
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SurvivorMaxIncapacitatedCount = 1
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	
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
		weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
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
}

MutationState <-
{
	SurvivorIsSafe = {}
	AllowDamage = false
	DeathClockTimer = 360
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

::GiveWeapons <- function( args )
{
	local function GiveRandomWeapon( args )
	{
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
			survivor.Give(randWep);
			survivor.Give("pistol_magnum");
		}
	}
	
	local function GiveLaserSight( args )
	{
		foreach (survivor in Players.AliveSurvivors())
		{
			survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
		}
	}
	
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(0.2, false, GiveLaserSight);
}

::KillSurvivors <- function ( args )
{
	SessionState.AllowDamage = true;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( !SessionState.SurvivorIsSafe[survivor.GetCharacterName()] )
			survivor.Kill();
	}
	
	EntFire( "prop_door_rotating_checkpoint", "Close" );
}

function EasyLogic::OnTakeDamage::DeathClockDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( !SessionState.AllowDamage && attacker.GetTeam() == SURVIVORS && victim.GetTeam() == SURVIVORS && damageTable.DamageType != DMG_BURN )
		{
			return false;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnDeath::RagdollSurvivor( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}

function Notifications::OnRescueVehicleLeaving::StopDeathClock( survivorCount, params )
{
	HUDManageTimers( 0, TIMER_STOP, 0 );
}

function Notifications::OnMapEnd::StopDeathClock()
{
	HUDManageTimers( 0, TIMER_STOP, 0 );
}

function Notifications::OnSurvivorsDead::StopDeathClock()
{
	HUDManageTimers( 0, TIMER_STOP, 0 );
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
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
}

function Notifications::OnSurvivorsSpawned::SetHudTimer( amount )
{
	if ( amount != 4 )
		return;
	
	if ( Utils.IsFinale() )
		SessionState.DeathClockTimer = 300;
	
	HUDManageTimers( 0, TIMER_STOP, 0 );
	HUDManageTimers( 0, TIMER_SET, SessionState.DeathClockTimer );
}

function Notifications::OnSurvivorsSpawned::DeathClockStarted( amount )
{
	if ( amount != 4 )
		return;
	
	Utils.SanitizeHeldWeapons();
	Utils.SanitizeHeldMeds();
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
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
}

function Notifications::OnSurvivorsLeftStartArea::StartDeathClock()
{
	HUDManageTimers( 0, TIMER_COUNTDOWN, SessionState.DeathClockTimer );
	Timers.AddTimer( SessionState.DeathClockTimer, false, KillSurvivors );
}

function Notifications::OnSurvivorsLeftStartArea::FinaleCheck()
{
	if ( Entities.FindByClassname( null, "trigger_finale" ) )
	{
		foreach ( trigger_finale in Objects.OfClassname( "trigger_finale" ) )
			trigger_finale.ConnectOutput( "FinaleStart", FinaleStarted );
	}
}

::FinaleStarted <- function ()
{
	Utils.TriggerRescue();
}

function Notifications::OnEnterSaferoom::SurvivorIsSafe( player, params )
{
	if ( player.IsSurvivor() )
		SessionState.SurvivorIsSafe[player.GetCharacterName()] <- true;
}

function Notifications::OnLeaveSaferoom::SurvivorIsNotSafe( player, params )
{
	if ( player.IsSurvivor() )
		SessionState.SurvivorIsSafe[player.GetCharacterName()] <- false;
}

function SetupModeHUD()
{
	DeathClockHUD <-
	{
		Fields =
		{
			timer = 
			{
				slot = HUD_MID_TOP ,
				staticstring = " To Reach The Saferoom Or You're DEAD!",
				name = "timer",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_POSTSTR | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
		}
	}
	HUDPlace( HUD_MID_TOP, 0.0, 0.00, 1.0, 0.045 );
	HUDSetLayout( DeathClockHUD );
}

function EasyLogic::Update::DeathClockThink()
{
	if ( SessionOptions.cm_CommonLimit == 0 && Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
