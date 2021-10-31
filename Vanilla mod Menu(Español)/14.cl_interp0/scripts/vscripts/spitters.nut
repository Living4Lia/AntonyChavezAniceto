Msg("Activating: Spitters!") 
Msg("Made by Karma Jockey\n");

MutationOptions <-
{
	ActiveChallenge = 1
	RelaxMinInterval = 15
	RelaxMaxInterval = 15
	SpecialRespawnInterval = 8
	CommonLimit = 0
	cm_MaxSpecials = 20
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	JockeyLimit = 0
	SpitterLimit = 20
	ProhibitBosses = 1

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb = 	"weapon_molotov_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
}

removed_common_spawns <- false;
function Update()
{
	if(!removed_common_spawns)
    {
		EntFire( "intro_zombie_spawn", "kill" );
		EntFire( "zspawn_lobby_fall_1", "kill" );
		EntFire( "zspawn_lobby_fall_2", "kill" );
		EntFire( "zspawn_lobby_fall_3", "kill" );
		EntFire( "zspawn_lobby_fall_4", "kill" );
		EntFire( "zspawn_lobby_fall_5", "kill" );
		EntFire( "zspawn_fall_1", "kill" );
		EntFire( "zspawn_fall_2", "kill" );
		EntFire( "zombie_outro", "kill" );
		EntFire( "escape_zombie", "kill" );
		EntFire( "zspawn_zombie_safe", "kill" );
		EntFire( "zspawn_zombie_safe2", "kill" );
		EntFire( "spawn_zombie_van", "kill" );
		EntFire( "spawn_zombie_alarm", "kill" );
		EntFire( "spawn_zombie_alarm2", "kill" );
		EntFire( "zombie_spawn1", "kill" );
		EntFire( "spawn_zombie_run", "kill" );
		EntFire( "spawn_zombie_end", "kill" );
		EntFire( "infected_spawner", "kill" );
		EntFire( "infected_spawner2", "kill" );
		EntFire( "spawn_zombie_location1", "kill" );
		EntFire( "spawn_zombie_location2", "kill" );
		EntFire( "spawn_zombie_location3", "kill" );
		EntFire( "spawn_zombie_location4", "kill" );
		EntFire( "spawn_zombie_location5", "kill" );
		EntFire( "spawn_zombie_location6", "kill" );
		removed_common_spawns = true;
    }
	if(Director.GetCommonInfectedCount() >= 1)
	{
		z <- null;
		while((z = Entities.FindByClassname(z,"infected")) != null)
		{
			DoEntFire("!self", "kill", "", 0, null, z);
		}
	}
}
