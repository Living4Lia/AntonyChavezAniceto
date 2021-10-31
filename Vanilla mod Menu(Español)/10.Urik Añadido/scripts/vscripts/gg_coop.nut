//-----------------------------------------------------
Msg("Activating Gun Game\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	//cm_CommonLimit = 0
	//cm_DominatorLimit = 14
	cm_MaxSpecials = 3
	cm_SpecialRespawnInterval = 30
	SpecialInitialSpawnDelayMin = 20
	SpecialInitialSpawnDelayMax = 20
	
	/*SmokerLimit = 3
	BoomerLimit = 2
	HunterLimit = 3
	SpitterLimit = 2
	JockeyLimit = 2
	ChargerLimit = 2*/
	
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
		//weapon_first_aid_kit = 0
		//weapon_pain_pills = 0
		//weapon_adrenaline = 0
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
}

::GunState <-
{
	GunProgress = {}
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
	
	Timers.AddTimer(0.1, false, GiveGun, player);
}

function EasyLogic::OnShutdown::SaveGunProgress( reason, nextmap )
{
	if ( (reason == SCRIPT_SHUTDOWN_LEVEL_TRANSITION && nextmap == Utils.GetNextMap()) || (reason == SCRIPT_SHUTDOWN_ROUND_RESTART) )
		SaveTable( "gungame_progress", GunState.GunProgress );
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
			if ( Utils.GetDifficulty() == EASY || Utils.GetDifficulty() == NORMAL )
				damageTable.DamageDone = 5;
			else if ( Utils.GetDifficulty() == ADVANCED )
				damageTable.DamageDone = 10;
			else if ( Utils.GetDifficulty() == EXPERT )
				damageTable.DamageDone = 20;
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
	if ( attacker.IsSurvivor() && victim.GetType() != Z_COMMON && !victim.IsSurvivor() )
	{
		local weapon_progress = ListOfWeps[GunState.GunProgress[attacker.GetCharacterName()]];
		
		if ( weapon == "entityflame" || weapon == "inferno" )
			weapon = "molotov";
		else if ( weapon == "grenade_launcher_projectile" )
			weapon = "grenade_launcher";
		else if ( weapon == "melee" )
			weapon = "random_melee";
		
		if ( weapon == weapon_progress )
			AdvanceGun( attacker );
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
		
		Timers.AddTimer(0.1, false, GiveWeapons, survivor);
	}
}
