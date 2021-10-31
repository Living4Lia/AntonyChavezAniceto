//-----------------------------------------------------
Msg("Activating Special Surprise\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Utils.PrecacheCSSWeapons();

MutationOptions <-
{
	cm_DominatorLimit = 14
	cm_MaxSpecials = 14
	cm_ProhibitBosses = true
	SpecialInitialSpawnDelayMin = 999999
	SpecialInitialSpawnDelayMax = 999999
	//ZombieTankHealth = 5000
	
	BoomerLimit = 14
	SmokerLimit = 14
	HunterLimit = 14
	ChargerLimit = 14
	SpitterLimit = 14
	JockeyLimit = 14
	
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
		//weapon_chainsaw = 0
		//weapon_pipe_bomb = 0
		//weapon_molotov = 0
		//weapon_vomitjar = 0
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
			return false;
		
		return true;
	}
	
	DefaultItems =
	[
		"weapon_pistol_magnum",
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

function Notifications::OnSurvivorsSpawned::ModeStarted( amount )
{
	if ( amount != 4 )
		return;
	
	Timers.AddTimer(0.1, false, GiveWeapons);
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker )
	{
		if ( victim.GetType() == Z_COMMON )
		{
			local boss_chance = RandomInt( 0, 99 );
			if ( boss_chance == 1 )
			{
				local random_boss = RandomInt( 7, 8 );
				Utils.SpawnZombie( random_boss, victim.GetLocation() );
			}
			else
			{
				local random_chance = RandomInt( 0, 9 );
				if ( random_chance == 1 )
				{
					local random_si = RandomInt( 1, 6 );
					Utils.SpawnZombie( random_si, victim.GetLocation() );
				}
			}
		}
	}
}
