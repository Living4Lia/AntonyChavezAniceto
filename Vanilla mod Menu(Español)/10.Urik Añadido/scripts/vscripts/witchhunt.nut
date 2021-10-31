//-----------------------------------------------------
Msg("Activating Witch Hunt\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	WitchLimit = 50
	cm_WitchLimit = 50

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb = 	"weapon_molotov_spawn"
		weapon_vomitjar = 	"weapon_molotov_spawn"
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

MutationState <-
{
	CreatedWitchTimer = false
}

::SpawnWitch <- function ( args )
{
	Msg("Spawning Witch!\n");
	/*local randomTime = RandomInt( 0, 1 );
	if ( randomTime == 1 )
		randomTime = 2;
	
	foreach( worldspawn in Objects.OfClassname( "worldspawn" ) )
		worldspawn.SetKeyValue( "timeofday", randomTime );*/
	
	if ( SessionState.MapName == "c6m1_riverbank" )
		Utils.SpawnZombie( Z_WITCH_BRIDE );
	else
		Utils.SpawnZombie( Z_WITCH );
}

function Notifications::OnRoundStart::RemoveCommonSpawns()
{
	if ( SessionState.MapName == "AirCrash" )
	{
		EntFire( "breakwall1", "Break" );
		EntFire( "breakwall2", "Break" );
		EntFire( "breakwall_stop", "Kill" );
	}
	Utils.RemoveZombieSpawns();
}

function Notifications::OnPostSpawn::CreateWitchTimer( player, params )
{
	if ( !SessionState.CreatedWitchTimer )
	{
		SpawnWitch(null);
		Timers.AddTimer( 5.0, true, SpawnWitch );
		SessionState.CreatedWitchTimer = true;
	}
}

function EasyLogic::Update::Think()
{
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		z <- null;
		while( ( z = Entities.FindByClassname( z, "infected" ) ) != null )
		{
			DoEntFire( "!self", "kill", "", 0, null, z );
		}
	}
}
