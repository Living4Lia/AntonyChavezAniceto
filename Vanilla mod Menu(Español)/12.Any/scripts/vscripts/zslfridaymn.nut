//-----------------------------------------------------
Msg("Activating Friday Morning Gnome Patrol!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_CommonLimit = 15
	cm_MaxSpecials = 5
	cm_DominatorLimit = 5
	BoomerLimit = 2
	SmokerLimit = 0
	HunterLimit = 1
	ChargerLimit = 0
	SpitterLimit = 2
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	cm_SpecialRespawnInterval = 15
	cm_AggressiveSpecials = 1
	SpecialInitialSpawnDelayMin = 10
	SpecialInitialSpawnDelayMax = 10
	cm_WanderingZombieDensityModifier = 0.0
	PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
	cm_AllowSurvivorRescue = 0
	ProhibitBosses = false
	SurvivorMaxIncapacitatedCount = 0

	DefaultItems =
	[
		"weapon_gnome",
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

ZSLState <-
{
	IsRaceEvent = false
	SaferoomWeaponNeeded = "weapon_gnome"
	EventRules = "[RULES] Make it to the saferoom (with the Gnome) for 1 point. Finale (escape) map is now a survival round, last one standing gets the bonus point. Most points at the end wins!!"
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "weapon_pain_pills", "Kill" );
}

function Notifications::OnSurvivorsSpawned::DisableAttack( amount )
{
	if ( amount != 4 )
		return;
	
	foreach( survivor in Players.AliveSurvivors() )
	{
		survivor.DisableButton( BUTTON_ATTACK );
	}
}

::GetClosestGnome <- function ( survivor )
{
	local dist = null;
	local ent = null;
	
	foreach( entity in Objects.OfClassname("prop_physics") )
	{
		if ( entity.GetModel() == "models/props_junk/gnome.mdl" )
		{
			if ( !dist || Utils.CalculateDistance(survivor.GetLocation(), entity.GetLocation()) < dist )
			{
				dist = Utils.CalculateDistance(survivor.GetLocation(), entity.GetLocation());
				ent = entity;
			}
		}
	}
	
	return ent;
}

::PickupGnome <- function ( survivor )
{
	if ( survivor.IsHuman() )
		return;
	
	local gnome = GetClosestGnome( survivor );
	if ( gnome )
		survivor.Use(gnome);
}

function Notifications::OnHunterPouncedVictim::KillHunter( hunter, victim, params )
{
	hunter.Kill();
	
	if ( victim.IsBot() )
		Timers.AddTimer(2.5, false, PickupGnome, victim);
}

function Notifications::OnBotReplacedPlayer::DisableAttack( player, bot, params )
{
	bot.DisableButton( BUTTON_ATTACK );
}

function Notifications::OnPlayerReplacedBot::DisableAttack( player, bot, params )
{
	player.DisableButton( BUTTON_ATTACK );
}
