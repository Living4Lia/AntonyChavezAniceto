//-----------------------------------------------------
Msg("Activating Random\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

Skyboxes <- [
   "0",
   "2"
]

worldspawn <- Entities.FindByClassname( null, "worldspawn" );
local i = RandomInt( 0, Skyboxes.len()-1 );
printl("Skyboxe is "+Skyboxes[i]);
printl( worldspawn.__KeyValueFromString( "timeofday", Skyboxes[i] ) );

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 0
	cm_ProhibitBosses = false
	cm_SpecialRespawnInterval = 5
	//cm_TempHealthOnly = RandomInt( 0, 1 )
	ShouldAllowMobsWithTank = true
	ShouldAllowSpecialsWithTank = true
	EscapeSpawnTanks = true
	
	TankLimit = 4
	cm_TankLimit = 4
	WitchLimit = 4
	cm_WitchLimit = 4
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_first_aid_kit = "weapon_pain_pills_spawn"
		weapon_pain_pills = "weapon_adrenaline_spawn"
		weapon_adrenaline = "weapon_first_aid_kit_spawn"
		weapon_smg = "weapon_pumpshotgun_spawn"
		weapon_smg_silenced = "weapon_shotgun_chrome_spawn"
		weapon_pumpshotgun = "weapon_smg_spawn"
		weapon_shotgun_chrome = "weapon_smg_silenced_spawn"
		weapon_pistol = "weapon_pistol_magnum_spawn"
		weapon_rifle = "weapon_rifle_ak47_spawn"
		weapon_rifle_ak47 = "weapon_desert_spawn"
		weapon_desert = "weapon_rifle_spawn"
		weapon_autoshotgun = "weapon_shotgun_spas_spawn"
		weapon_hunting_rifle = "weapon_sniper_military_spawn"
		weapon_pipe_bomb = "weapon_molotov_spawn"
		weapon_molotov = "weapon_vomitjar_spawn"
		weapon_vomitjar = "weapon_pipe_bomb_spawn"
		//weapon_melee = "weapon_upgradepack_explosive_spawn" //remove possible
	}
	
	weaponsToConvert2 =
	{
		weapon_first_aid_kit = "weapon_adrenaline_spawn"
		weapon_pain_pills = "weapon_first_aid_kit_spawn"
		weapon_adrenaline = "weapon_pain_pills_spawn"
		weapon_smg = "weapon_shotgun_chrome_spawn"
		weapon_smg_silenced = "weapon_pumpshotgun_spawn"
		weapon_pumpshotgun = "weapon_smg_silenced_spawn"
		weapon_shotgun_chrome = "weapon_smg_spawn"
		weapon_pistol_magnum = "weapon_pistol_spawn"
		weapon_rifle = "weapon_rifle_desert_spawn"
		weapon_rifle_ak47 = "weapon_rifle_spawn"
		weapon_desert = "weapon_rifle_ak47_spawn"
		weapon_shotgun_spas = "weapon_autoshotgun_spawn"
		weapon_sniper_military = "weapon_hunting_rifle_spawn"
		weapon_pipe_bomb = "weapon_vomitjar_spawn"
		weapon_molotov = "weapon_pipe_bomb_spawn"
		weapon_vomitjar = "weapon_molotov_spawn"
		//weapon_melee = "weapon_upgradepack_incendiary_spawn" //remove possible
	}
	
	allow_convert = 1

	function ConvertWeaponSpawn( classname )
	{
		local random_convert = RandomInt( 0, 2 )
		if ( classname in weaponsToConvert && random_convert == 0 && allow_convert == 1 )
		{
			Msg("Converting Table 1\n");
			return weaponsToConvert[classname];
			allow_convert = 0;
		}
		else if ( classname in weaponsToConvert2 && random_convert == 1 && allow_convert == 1 )
		{
			Msg("Converting Table 2\n");
			return weaponsToConvert2[classname];
			allow_convert = 0;
		}
		return 0;
	}
	
	RandomPistol =
	[
		"pistol",
		"pistol_magnum",
	]
	
	function GetDefaultItem(id)
	{
		local PRand = RandomInt(0,RandomPistol.len()-1);
		if(id == 0) return RandomPistol[PRand];
		return 0;
	}
}

::SpawnTank <- function ( args )
{
	Msg("Spawning Tank!\n");
	Utils.SpawnZombie( Z_TANK );
}

function Notifications::OnSurvivorsLeftStartArea::CreateTankTimer()
{
	if ( enable_tanks == 1 )
	{
		SpawnTank(null);
		Timers.AddTimer( 60.0, true, SpawnTank );
	}
}

function Notifications::OnTankSpawned::SetTankHealth( tank, params )
{
	if ( enable_tanks == 1 )
	{
		local Difficulty = Convars.GetStr( "z_difficulty" ).tolower();
		
		if ( Difficulty == "easy" )
		{
			Msg("Setting Tank Health to 1500\n");
			tank.SetHealth(1500);
		}
		else if ( Difficulty == "normal" || Difficulty == "hard" )
		{
			Msg("Setting Tank Health to 2000\n");
			tank.SetHealth(2000);
		}
		else if ( Difficulty == "impossible" )
		{
			Msg("Setting Tank Health to 4000\n");
			tank.SetHealth(4000);
		}
	}
}

allow_random_trigger <- 1;
enable_tanks <- 0;
finale_check <- 0;
MaxValue <- 16;
function Update()
{
	local random_chance = RandomInt( 0, MaxValue )
	if( random_chance == 0 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 1\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 3;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 3;
		allow_random_trigger = 0;
	}
	else if( random_chance == 1 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 2\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 3;
		DirectorOptions.SpitterLimit <- 3;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 2 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 3\n");
		DirectorOptions.cm_CommonLimit <- 10;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.WanderingZombieDensityModifier <- 0.0;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 3;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 3;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 3 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 4\n");
		DirectorOptions.cm_CommonLimit <- 30;
		DirectorOptions.cm_DominatorLimit <- 0;
		DirectorOptions.cm_HeadshotOnly <- 1;
		DirectorOptions.cm_MaxSpecials <- 0;
		//DirectorOptions.cm_ProhibitBosses <- true;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		//DirectorOptions.TankLimit <- 0;
		//DirectorOptions.cm_TankLimit <- 0;
		//DirectorOptions.WitchLimit <- 0;
		//DirectorOptions.cm_WitchLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 4 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 5\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 8;
		DirectorOptions.cm_MaxSpecials <- 8;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 2;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 2;
		DirectorOptions.SpitterLimit <- 2;
		DirectorOptions.JockeyLimit <- 1;
		DirectorOptions.ChargerLimit <- 1;
		allow_random_trigger = 0;
	}
	else if( random_chance == 5 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 6\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 3;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 3;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 6 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 7\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 3;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 3;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 7 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 8\n");
		DirectorOptions.cm_CommonLimit <- 10;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 3;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 3;
		allow_random_trigger = 0;
	}
	else if( random_chance == 8 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 9\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 3;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 3;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 9 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 10\n");
		DirectorOptions.cm_CommonLimit <- 10;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 3;
		DirectorOptions.HunterLimit <- 3;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 10 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 11\n");
		DirectorOptions.cm_CommonLimit <- 10;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 3;
		DirectorOptions.BoomerLimit <- 3;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 11 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 12\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 3;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 3;
		allow_random_trigger = 0;
	}
	else if( random_chance == 12 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 13\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 3;
		DirectorOptions.ChargerLimit <- 3;
		allow_random_trigger = 0;
	}
	else if( random_chance == 13 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 14\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 6;
		DirectorOptions.cm_MaxSpecials <- 6;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 3;
		DirectorOptions.JockeyLimit <- 3;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 14 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 15\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 8;
		DirectorOptions.cm_MaxSpecials <- 8;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 3;
		DirectorOptions.BoomerLimit <- 2;
		DirectorOptions.HunterLimit <- 3;
		DirectorOptions.SpitterLimit <- 0;
		DirectorOptions.JockeyLimit <- 0;
		DirectorOptions.ChargerLimit <- 0;
		allow_random_trigger = 0;
	}
	else if( random_chance == 15 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 16\n");
		DirectorOptions.cm_CommonLimit <- 0;
		DirectorOptions.cm_DominatorLimit <- 8;
		DirectorOptions.cm_MaxSpecials <- 8;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 0;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 5;
		DirectorOptions.SmokerLimit <- 0;
		DirectorOptions.BoomerLimit <- 0;
		DirectorOptions.HunterLimit <- 0;
		DirectorOptions.SpitterLimit <- 3;
		DirectorOptions.JockeyLimit <- 2;
		DirectorOptions.ChargerLimit <- 3;
		allow_random_trigger = 0;
	}
	else if( random_chance == 16 && allow_random_trigger == 1 )
	{
		Msg("Activating Random Game 17\n");
		DirectorOptions.cm_CommonLimit <- 15;
		DirectorOptions.cm_DominatorLimit <- 4;
		DirectorOptions.cm_MaxSpecials <- 4;
		DirectorOptions.cm_SpecialRespawnInterval <- 30;
		DirectorOptions.SpecialInitialSpawnDelayMin <- 5;
		DirectorOptions.SpecialInitialSpawnDelayMax <- 10;
		DirectorOptions.SmokerLimit <- 1;
		DirectorOptions.BoomerLimit <- 1;
		DirectorOptions.HunterLimit <- 1;
		DirectorOptions.SpitterLimit <- 1;
		DirectorOptions.JockeyLimit <- 1;
		DirectorOptions.ChargerLimit <- 1;
		DirectorOptions.WitchLimit <- 0;
		DirectorOptions.cm_WitchLimit <- 0;
		enable_tanks = 1;
		finale_check = 1;
		allow_random_trigger = 0;
	}
	
	if( finale_check == 1 && Entities.FindByClassname( null, "trigger_finale" ) )
	{
		Msg("Finale found, preventing Tank spawns...\n");
		//DirectorOptions.cm_CommonLimit <- 15;
		//DirectorOptions.cm_DominatorLimit <- 4;
		//DirectorOptions.cm_MaxSpecials <- 4;
		//DirectorOptions.cm_SpecialRespawnInterval <- 30;
		//DirectorOptions.SpecialInitialSpawnDelayMin <- 5;
		//DirectorOptions.SpecialInitialSpawnDelayMax <- 10;
		//DirectorOptions.SmokerLimit <- 1;
		//DirectorOptions.BoomerLimit <- 1;
		//DirectorOptions.HunterLimit <- 1;
		//DirectorOptions.SpitterLimit <- 1;
		//DirectorOptions.JockeyLimit <- 1;
		//DirectorOptions.ChargerLimit <- 1;
		//DirectorOptions.WitchLimit <- 0;
		//DirectorOptions.cm_WitchLimit <- 0;
		enable_tanks = 0;
		finale_check = 0;
		allow_random_trigger = 1;
	}
	else if( finale_check == 1 && Entities.FindByClassname( null, "trigger_finale_dlc3" ) )
	{
		Msg("Finale found, preventing Tank spawns...\n");
		//DirectorOptions.cm_CommonLimit <- 15;
		//DirectorOptions.cm_DominatorLimit <- 4;
		//DirectorOptions.cm_MaxSpecials <- 4;
		//DirectorOptions.cm_SpecialRespawnInterval <- 30;
		//DirectorOptions.SpecialInitialSpawnDelayMin <- 5;
		//DirectorOptions.SpecialInitialSpawnDelayMax <- 10;
		//DirectorOptions.SmokerLimit <- 1;
		//DirectorOptions.BoomerLimit <- 1;
		//DirectorOptions.HunterLimit <- 1;
		//DirectorOptions.SpitterLimit <- 1;
		//DirectorOptions.JockeyLimit <- 1;
		//DirectorOptions.ChargerLimit <- 1;
		//DirectorOptions.WitchLimit <- 0;
		//DirectorOptions.cm_WitchLimit <- 0;
		enable_tanks = 0;
		finale_check = 0;
		allow_random_trigger = 1;
	}
}
