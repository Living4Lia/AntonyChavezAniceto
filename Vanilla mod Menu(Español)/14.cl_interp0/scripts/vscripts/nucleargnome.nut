//-----------------------------------------------------
Msg("Activating Nuclear Gnome\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_VIPTarget = 1
	cm_ShouldHurry = 1
	//cm_CommonLimit = 0
	//cm_DominatorLimit = 14
	//cm_MaxSpecials = 3
	cm_SpecialRespawnInterval = 30
	SpecialInitialSpawnDelayMin = 20
	SpecialInitialSpawnDelayMax = 20
	
	/*SmokerLimit = 3
	BoomerLimit = 2
	HunterLimit = 3
	SpitterLimit = 2
	JockeyLimit = 2
	ChargerLimit = 2*/
}

MutationState <-
{
	IsGnomeHeld = true
	HasLeftSaferoom = false
	GnomeExploded = false
	GnomeCarrier = null
	GnomeTimer = 60
}

::KillEverything <- function ()
{
	local gnomenuke =
	{
		fireballsprite = "sprites/explosion_huge_h.spr" //zerogxplode
		//ignoredClass = "0"
		iMagnitude = "10000"
		iRadiusOverride = "512"
		rendermode = "5"
		spawnflags = 0, //1852
	};
	
	local gnome = Objects.AnyOfModel("models/props_junk/gnome.mdl");
	local nuke = Utils.CreateEntity("env_explosion", gnome.GetLocation(), QAngle( 0, 0, 0 ), gnomenuke);
	nuke.Input( "Explode" );
	Utils.PlaySound("weapons/hegrenade/explode3.wav");
	gnome.Kill();
	
	foreach( player in Players.All() )
		player.Kill();
	foreach( witch in Zombies.Witches() )
		witch.Kill();
	foreach( infected in Zombies.CommonInfected() )
		infected.Kill();
}

function Notifications::OnRoundStart::RemoveWorldGnomes()
{
	foreach ( gnome in Objects.OfModel("models/props_junk/gnome.mdl") )
	{
		if ( gnome.GetClassname() == "prop_physics" )
			gnome.Kill();
	}
}

function Notifications::OnSurvivorsSpawned::SetTimer( amount )
{
	if ( amount != 4 )
		return;
	
	/*local has_gnome = false;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.HasItem("gnome") )
			has_gnome = true;
	}
	
	if ( !has_gnome )
		Players.RandomAliveSurvivor().Give("gnome");*/
	
	if ( Utils.GetDifficulty() == EASY )
		SessionState.GnomeTimer = 60;
	else if ( Utils.GetDifficulty() == NORMAL )
		SessionState.GnomeTimer = 45;
	else if ( Utils.GetDifficulty() == ADVANCED )
		SessionState.GnomeTimer = 30;
	else if ( Utils.GetDifficulty() == EXPERT )
		SessionState.GnomeTimer = 15;
	
	HUDManageTimers( 0, TIMER_STOP, 0 );
	HUDManageTimers( 0, TIMER_SET, SessionState.GnomeTimer );
}

function Notifications::OnItemPickup::PickedUpGnome( player, classname, params )
{
	if ( classname == "weapon_gnome" )
	{
		SessionState.IsGnomeHeld = true;
		SessionState.GnomeCarrier = player;
		HUDManageTimers( 0, TIMER_STOP, 0 );
	}
}

function Notifications::OnSurvivorsLeftStartArea::NukeIsLive()
{
	SessionState.HasLeftSaferoom = true;
}

function SetupModeHUD()
{
	GnomeHUD <-
	{
		Fields =
		{
			timer =
			{
				slot = HUD_SCORE_TITLE ,
				staticstring = "Hold the Gnome or it detonates in: ",
				name = "timer",
				flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOBG,
				special = HUD_SPECIAL_TIMER0
			}
		}
	}
	HUDPlace( HUD_SCORE_TITLE, 0.0, 0.00, 1.0, 0.045 );
	HUDSetLayout( GnomeHUD );
}

function EasyLogic::Update::Think()
{
	if ( (SessionState.GnomeCarrier) && (SessionState.GnomeCarrier.HasItem("gnome")) )
	{
		SessionState.GnomeCarrier.SetNetProp( "m_iShovePenalty", 0 );
	}
	
	if ( SessionState.HasLeftSaferoom && !SessionState.GnomeExploded )
	{
		if ( SessionState.IsGnomeHeld )
		{
			local has_gnome = false;
			
			foreach ( survivor in Players.AliveSurvivors() )
			{
				if ( survivor.HasItem("gnome") )
					has_gnome = true;
			}
			
			if ( !has_gnome )
			{
				SessionState.IsGnomeHeld = false;
				HUDManageTimers( 0, TIMER_COUNTDOWN, HUDReadTimer(0) );
			}
		}
		
		if ( !SessionState.IsGnomeHeld && HUDReadTimer(0) <= 0 )
		{
			KillEverything();
			SessionState.GnomeExploded = true;
		}
	}
}
