//-----------------------------------------------------
Msg("Activating Real Zombusters\n");


MutationOptions <-
{
	ActiveChallenge = 1

	cm_AllowSurvivorRescue = false
	cm_BaseCommonAttackDamage = 100
	cm_CommonLimit = 35 //25
	cm_HeadshotOnly = 1
	cm_ShouldHurry = 1
	cm_MaxSpecials = 0
	cm_DominatorLimit = 0
	AlwaysAllowWanderers = true
	NumReservedWanderers = 40 //30
	PreferredMobDirection = SPAWN_ANYWHERE
	SurvivorMaxIncapacitatedCount = 4 //99
	//MegaMobSize = 15 //testing 15
	//MegaMobMinSize = 15 //testing 15
	//MegaMobMaxSize = 15 //testing 20
	//MobMinSize = 10 //15
	//MobMaxSize = 10 //15
	//MobSpawnMinTime = 999999
	//MobSpawnMaxTime = 999999
	//MobSpawnSize = 5 //15
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	TankLimit = 0
	cm_TankLimit = 0
	WitchLimit = 0
	cm_WitchLimit = 0
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		//weapon_sniper_military =	"weapon_hunting_rifle_spawn"
		ammo =	"weapon_adrenaline_spawn"
		//upgrade_item =	"weapon_pistol_magnum_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
	
	weaponsToRemove =
	{
		//weapon_pistol = 0
		//weapon_pistol_magnum = 0
		//weapon_smg = 0
		//weapon_pumpshotgun = 0
		//weapon_autoshotgun = 0
		//weapon_rifle = 0
		//weapon_hunting_rifle = 0
		//weapon_smg_silenced = 0
		//weapon_shotgun_chrome = 0
		//weapon_rifle_desert = 0
		//weapon_sniper_military = 0
		//weapon_shotgun_spas = 0
		//weapon_grenade_launcher = 0
		//weapon_rifle_ak47 = 0
		//weapon_smg_mp5 = 0		
		//weapon_rifle_sg552 = 0		
		//weapon_sniper_awp = 0	
		//weapon_sniper_scout = 0
		//weapon_rifle_m60 = 0
		//weapon_melee = 0
		//weapon_chainsaw = 0
		//weapon_pipe_bomb = 0
		//weapon_molotov = 0
		weapon_vomitjar = 0
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		//weapon_adrenaline = 0
		weapon_defibrillator = 0
		//weapon_upgradepack_incendiary = 0
		//weapon_upgradepack_explosive = 0
		//upgrade_item = 0
		//ammo = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}
	
	TempHealthDecayRate = 100
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.001 // pain_pills_decay_rate default 0.27
		}
	}
}

limited_weapon_spawns <- false;
removed_lockers <- false;
spoke_careful <- false;
timer_done <- false;
unlocked_train_door <- false;
function Update()
{
	DirectorOptions.RecalculateHealthDecay();
	if(Time() >= 10 && !timer_done)
	{
		EntFire( "!nick", "sethealth", "100" );
		EntFire( "!rochelle", "sethealth", "100" );
		EntFire( "!coach", "sethealth", "100" );
		EntFire( "!ellis", "sethealth", "100" );
		timer_done = true;
	}
	if(!limited_weapon_spawns)
	{
		EntFire( "weapon_spawn", "addoutput", "count 1" );
		EntFire( "weapon_melee_spawn", "addoutput", "count 1" );
		EntFire( "weapon_pistol_spawn", "addoutput", "count 1" );
		EntFire( "weapon_pistol_magnum_spawn", "addoutput", "count 1" );
		EntFire( "weapon_pumpshotgun_spawn", "addoutput", "count 1" );
		EntFire( "weapon_shotgun_chrome_spawn", "addoutput", "count 1" );
		EntFire( "weapon_smg_spawn", "addoutput", "count 1" );
		EntFire( "weapon_smg_silenced_spawn", "addoutput", "count 1" );
		EntFire( "weapon_hunting_rifle_spawn", "addoutput", "count 1" );
		EntFire( "weapon_sniper_military_spawn", "addoutput", "count 1" );
		EntFire( "weapon_autoshotgun_spawn", "addoutput", "count 1" );
		EntFire( "weapon_shotgun_spas_spawn", "addoutput", "count 1" );
		EntFire( "weapon_rifle_spawn", "addoutput", "count 1" );
		EntFire( "weapon_rifle_ak47_spawn", "addoutput", "count 1" );
		EntFire( "weapon_rifle_desert_spawn", "addoutput", "count 1" );
		limited_weapon_spawns = true;
	}
	if(!unlocked_train_door && Director.HasAnySurvivorLeftSafeArea())
	{
		EntFire( "tankdoorout_button", "unlock" );
		EntFire( "tank_sound_timer", "kill" );
		unlocked_train_door = true;
	}
	if(!removed_lockers && Director.HasAnySurvivorLeftSafeArea())
	{
		EntFire( "button_locker-1", "kill" );
		EntFire( "button_locker-2", "kill" );
		EntFire( "button_locker-3", "kill" );
		EntFire( "button_locker-4", "kill" );
		EntFire( "button_locker-5", "kill" );
		EntFire( "button_locker-6", "kill" );
		EntFire( "locker-1", "kill" );
		EntFire( "locker-2", "kill" );
		EntFire( "locker-3", "kill" );
		EntFire( "locker-4", "kill" );
		EntFire( "locker-5", "kill" );
		EntFire( "locker-6", "kill" );
		EntFire( "WorldFootLocker-1", "kill" );
		EntFire( "WorldFootLocker-2", "kill" );
		EntFire( "WorldFootLocker-3", "kill" );
		EntFire( "WorldFootLocker-4", "kill" );
		EntFire( "WorldFootLocker-5", "kill" );
		EntFire( "WorldFootLocker-6", "kill" );
		removed_lockers = true;
	}
	if(!spoke_careful && Director.HasAnySurvivorLeftSafeArea())
	{
		EntFire( "info_director", "FireConceptToAny", "PlayerWarnCareful" );
		spoke_careful = true;
	}
}
