//-------------------------------------------------------
// Autogenerated from 'trader_zoey.vmf'
//-------------------------------------------------------
Zoey <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.zoey,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.zoey,
			EntityGroup.SpawnTables.usetarget,
		]
		return spawnEnts
	}

	//-------------------------------------------------------
	function GetEntityGroup()
	{
		return EntityGroup
	}

	//-------------------------------------------------------
	// Table of entities that make up this group
	//-------------------------------------------------------
	EntityGroup =
	{
		SpawnTables =
		{
			zoey = 
			{
				SpawnInfo =
				{
					classname = "commentary_dummy"
					angles = Vector( 0, 180, 0 )
					EyeHeight = "64"
					HeadPitchPoseParam = "Head_Pitch"
					HeadYawPoseParam = "Head_Yaw"
					LookAtPlayers = "1"
					model = "models/survivors/survivor_teenangst.mdl"
					StartingAnim = "Idle_Calm_Pistol"
					StartingWeapons = "weapon_pistol"
					targetname = "zoey"
					origin = Vector( 0, 0, 0 )
				}
			}
			usetarget = 
			{
				SpawnInfo =
				{
					classname = "point_script_use_target"
					model = "zoey"
					origin = Vector( 0, 0, 0 )
					targetname = "usetarget"
					vscripts = "usetargets/trader_zoey"
				}
			}
		} // SpawnTables
	} // EntityGroup
} // Zoey

RegisterEntityGroup( "Zoey", Zoey )