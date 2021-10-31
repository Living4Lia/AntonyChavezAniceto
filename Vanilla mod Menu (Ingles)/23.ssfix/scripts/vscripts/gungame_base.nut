//-----------------------------------------------------

MutationOptions <-
{
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
	AvailableSurvivor = {}
	GiveWeaponSurvivor = {}
	BeingHealed = {}
	HPRegenTime = 4.0
	AllowDamage = false
}

::ListOfRandomWeps <-
[
	"pistol"
	"pistol_magnum"
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
	"pipe_bomb"
	"molotov"
	"vomitjar"
	"grenade_launcher"
	"rifle_m60"
	"chainsaw"
	"random_melee" //baseball_bat
	"smg_mp5"
	"rifle_sg552"
	"random_css_sniper"	//"sniper_scout" //"sniper_awp"
]

::ListOfRandomSnipers <-
[
	"sniper_scout"
	"sniper_awp"
]

::ListOfWepSkins <-
{
	pistol_magnum = 2
	smg = 1
	smg_silenced = 1
	pumpshotgun = 1
	shotgun_chrome = 1
	autoshotgun = 1
	rifle = 2
	rifle_ak47 = 2
	hunting_rifle = 1
}

::GiveLaserSight <- function ( survivor )
{
	local SurvivorInv = survivor.GetHeldItems();
	if ( "slot0" in SurvivorInv )
		SurvivorInv["slot0"].AddUpgrade( 4 );
	else if ( ("slot1" in SurvivorInv) && (SurvivorInv["slot1"].GetClassname().find("weapon_pistol") != null ) )
		SurvivorInv["slot1"].AddUpgrade( 4 );
}

::GiveWeapons <- function( args )
{
	Utils.SanitizeHeldWeapons();
	Utils.SanitizeHeldItems();
	
	local function GiveRandomWeapon( args )
	{
		local function GiveMedkit( player )
		{
			player.Give("first_aid_kit");
		}
		
		foreach (survivor in Players.AliveSurvivors())
		{
			if ( SessionState.AvailableSurvivor[survivor.GetCharacterName()] )
			{
				if ( SessionState.BeingHealed[survivor.GetCharacterName()] && survivor.HasItem("first_aid_kit") )
				{
					survivor.Remove("first_aid_kit");
					Timers.AddTimer(0.1, false, GiveMedkit, survivor);
				}
				
				local wepSkin = 0;
				local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
				if ( randWep == "random_melee" )
					survivor.GiveRandomMelee();
				else if ( randWep == "random_css_sniper" )
					survivor.Give(Utils.GetRandValueFromArray(ListOfRandomSnipers));
				else
				{
					if ( randWep in ListOfWepSkins )
						wepSkin = RandomInt(0, ListOfWepSkins[randWep]);
					survivor.Give(randWep, wepSkin);
				}
				
				Timers.AddTimer(0.1, false, GiveLaserSight, survivor);
			}
			else
			{
				SessionState.GiveWeaponSurvivor[survivor.GetCharacterName()] <- true;
			}
		}
	}
	
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
}

::GiveWeapon <- function( player )
{
	player.DropWeaponSlot(0);
	player.DropWeaponSlot(1);
	player.DropWeaponSlot(2);
	
	local function GiveRandomWeapon( player )
	{
		local wepSkin = 0;
		local randWep = Utils.GetRandValueFromArray(ListOfRandomWeps);
		if ( randWep == "random_melee" )
			player.GiveRandomMelee();
		else if ( randWep == "random_css_sniper" )
			player.Give(Utils.GetRandValueFromArray(ListOfRandomSnipers));
		else
		{
			if ( randWep in ListOfWepSkins )
				wepSkin = RandomInt(0, ListOfWepSkins[randWep]);
			player.Give(randWep, wepSkin);
		}
		
		Timers.AddTimer(0.1, false, GiveLaserSight, player);
	}
	
	Timers.AddTimer(0.1, false, GiveRandomWeapon, player);
}

::HealthRegen <- function ( args )
{
	foreach( survivor in Players.AliveSurvivors() )
	{
		if ( survivor.GetRawHealth() < 100 )
			survivor.SetRawHealth( survivor.GetRawHealth() + 1 );
	}
}

::KillInfected <- function ( args )
{
	if ( !args.infected.IsEntityValid() )
		return;
	
	args.infected.Kill( DMG_GENERIC, args.attacker );
	
	if ( args.infected.IsAlive() )
		Timers.AddTimer(0.1, false, KillInfected, { infected = args.infected, attacker = args.attacker });
}

function Notifications::OnPlayerVomited::InfectedVomited( victim, attacker, params )
{
	if ( victim.GetTeam() == INFECTED )
	{
		local KillTimer = 3.0;
		
		if ( victim.GetType() == Z_TANK )
			KillTimer = 20.0;
		
		Timers.AddTimer(KillTimer, false, KillInfected, { infected = victim, attacker = attacker });
	}
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
		if ( !SessionState.AllowDamage && attacker.GetTeam() == SURVIVORS && victim.GetTeam() == SURVIVORS )
		{
			return false;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnRoundStart::GunGameSetup()
{
	EntFire( "weapon_spawn", "Kill" );
	foreach( melee_spawn in Objects.OfClassname("weapon_melee_spawn") )
		melee_spawn.Kill();
	foreach( wep, val in SessionOptions.weaponsToRemove )
		EntFire( wep + "_spawn", "Kill" );
}

function Notifications::OnItemPickup::PickedUpItem( player, classname, params )
{
	if ( classname == "weapon_gascan" || classname == "weapon_cola_bottles" )
	{
		SessionState.AvailableSurvivor[player.GetCharacterName()] <- false;
	}
}

function Notifications::OnWeaponDropped::DroppedItem( player, weapon, params )
{
	if ( (weapon) && (weapon.GetWeaponSlot() == SLOT_CARRIED) )
	{
		SessionState.AvailableSurvivor[player.GetCharacterName()] <- true;
		if ( SessionState.GiveWeaponSurvivor[player.GetCharacterName()] )
		{
			GiveWeapon(player);
			SessionState.GiveWeaponSurvivor[player.GetCharacterName()] <- false;
		}
	}
}

function Notifications::OnHealStart::Healing( player, healer, params )
{
	SessionState.AvailableSurvivor[healer.GetCharacterName()] <- false;
	SessionState.BeingHealed[player.GetCharacterName()] <- true;
}

function Notifications::OnHealEnd::Healing( player, healer, params )
{
	SessionState.AvailableSurvivor[healer.GetCharacterName()] <- true;
	SessionState.BeingHealed[player.GetCharacterName()] <- false;
	if ( SessionState.GiveWeaponSurvivor[healer.GetCharacterName()] )
	{
		GiveWeapon(healer);
		SessionState.GiveWeaponSurvivor[healer.GetCharacterName()] <- false;
	}
}

function Notifications::OnSurvivorsSpawned::GunGameStarted( amount )
{
	if ( amount != 4 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		SessionState.AvailableSurvivor[survivor.GetCharacterName()] <- true;
		SessionState.GiveWeaponSurvivor[survivor.GetCharacterName()] <- false;
		SessionState.BeingHealed[survivor.GetCharacterName()] <- false;
	}
	
	Timers.AddTimer(0.1, false, GiveWeapons);
	Timers.AddTimer(10.0, true, GiveWeapons);
	if ( SessionState.HPRegenTime )
		Timers.AddTimerByName("HealthRegenTimer", SessionState.HPRegenTime, true, HealthRegen);
}

function Notifications::OnSurvivorsSpawned::GunGameSurvivorsSpawned( amount )
{
	if ( amount != 4 )
		return;
	
	if ( SessionState.HPRegenTime )
	{
		foreach ( survivor in Players.AliveSurvivors() )
		{
			survivor.SetHealthBuffer( 0 );
			survivor.SetHealth( 100 );
			if ( Utils.GetMaxIncapCount() > 0 )
			{
				survivor.SetReviveCount( 0 );
				survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
				survivor.StopSound( "Player.HeartbeatLoop" );
				survivor.StopSound( "Player.Heartbeat" );
			}
		}
	}
}
