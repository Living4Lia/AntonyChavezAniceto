//-----------------------------------------------------
Msg("Activating Friday Night Zombie Run!!\n");
Msg("Made by ANG3Lskye\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("zsl_base");

ZSLOptions <-
{
	cm_AllowSurvivorRescue = 0
	//cm_BaseCommonAttackDamage = 100
	cm_CommonLimit = 40
	//cm_HeadshotOnly = 1
	cm_MaxSpecials = 0
	cm_ShouldHurry = 1
	cm_DominatorLimit = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	AlwaysAllowWanderers = true
	NumReservedWanderers = 40
	PreferredMobDirection = SPAWN_ANYWHERE //SPAWN_IN_FRONT_OF_SURVIVORS
	SurvivorMaxIncapacitatedCount = 1

	DefaultItems =
	[
		//"weapon_pistol_magnum",
		//"weapon_pistol",
		//"weapon_pistol",
		"weapon_rifle_m60"
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

ZSLState <-
{
	IsRaceEvent = false
	TieBreaker = "kills"
	InfectedKillTimer = {}
}

AddDefaultsToTable( "ZSLOptions", g_ModeScript, "MutationOptions", g_ModeScript );
AddDefaultsToTable( "ZSLState", g_ModeScript, "MutationState", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	try
	{
		local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
		local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
		if ( attacker.GetTeam() == INFECTED && victim.IsSurvivor() )
		{
			ScriptedDamageInfo.DamageDone = 100;
			return true;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnRoundStart::DoStuff()
{
	EntFire( "weapon_spawn", "Kill" );
	EntFire( "weapon_molotov", "Kill" );
}

function Notifications::OnSurvivorsSpawned::GiveMolotov( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		//local SurvivorInv = survivor.GetHeldItems();
		//if ( "slot1" in SurvivorInv )
		//	SurvivorInv["slot1"].AddUpgrade( 4 );
		
		//survivor.DisableButton( BUTTON_RELOAD );
		survivor.Give( "molotov" );
		survivor.GiveUpgrade( UPGRADE_LASER_SIGHT );
	}
}

/*function Notifications::OnHurt::SurvivorHurt( entity, attacker, params )
{
	if ( !(entity) || !(entity.IsSurvivor()) )
		return;
	
	if ( entity.IsLastStrike() && !entity.GetNetPropBool( "m_bIsOnThirdStrike" ) )
	{
		if ( entity.GetHealth() <= 50 )
		{
			entity.SetNetProp( "m_bIsOnThirdStrike", 1 );
			entity.StopSound( "Player.HeartbeatLoop" );
			entity.PlaySound( "Player.HeartbeatLoop" );
			entity.SetHealthBuffer( entity.GetHealth() );
			entity.SetRawHealth( 1 );
		}
	}
}*/

function Notifications::OnReviveSuccess::RevivedSurvivor( player, reviver, params )
{
	if ( player.IsSurvivor() )
	{
		player.SetNetProp( "m_bIsOnThirdStrike", 0 );
		player.SetHealthBuffer( 100 );
		player.SetRawHealth( 1 );
		player.SetNetProp( "m_Glow.m_glowColorOverride", 255 );
	}
}

::KillCommonInfected <- function ( infected )
{
	if ( infected.IsEntityValid() )
		infected.Kill();
}

//Overrides zsl_base
::FinaleDelay <- function ( args )
{
	Utils.StartFinale();
	Timers.AddTimerByName("ZSLTankFinaleTimer", 60.0, true, FinaleTankSpawn);
}

/*function Notifications::OnSurvivorsLeftStartArea::ForcePanic()
{
	Utils.ForcePanicEvent();
}*/

/*function Notifications::OnWeaponFire::AddAmmo( player, weapon, params )
{
	local activeWeapon = player.GetActiveWeapon();
	
	if ( activeWeapon.GetNetPropInt( "m_iClip1" ) <= 29 )
		activeWeapon.SetNetProp( "m_iClip1", 31 );
}*/

function Notifications::OnIncapacitated::IncappedPlayer( player, attacker, params )
{
	player.Remove( "weapon_pistol" );
}

function Notifications::OnDeath::CommonInfectedDeath( victim, attacker, params )
{
	if ( victim.GetClassname() == "infected" )
	{
		local index = victim.GetIndex();
		if ( index in SessionState.InfectedKillTimer )
		{
			SessionState.InfectedKillTimer.rawdelete(index);
			Timers.RemoveTimerByName("KillCommon" + index);
		}
	}
}

function EasyLogic::Update::Think()
{
	if ( Director.HasAnySurvivorLeftSafeArea() )
	{
		foreach ( infected in Zombies.CommonInfected() )
		{
			local index = infected.GetIndex();
			if ( !(index in SessionState.InfectedKillTimer) && (infected.IsAlive()) )
			{
				SessionState.InfectedKillTimer[index] <- true;
				Timers.AddTimerByName("KillCommon" + index, 30.0, false, KillCommonInfected, infected);
			}
			
			if ( !infected.GetNetPropBool( "m_mobRush" ) )
				infected.SetNetProp( "m_mobRush", 1 );
		}
	}
}
