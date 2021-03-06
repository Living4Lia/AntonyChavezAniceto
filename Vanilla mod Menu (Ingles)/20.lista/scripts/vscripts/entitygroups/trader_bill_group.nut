//-------------------------------------------------------
// Autogenerated from 'trader_bill.vmf'
//-------------------------------------------------------
Bill <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.bill,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.bill,
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
			bill = 
			{
				SpawnInfo =
				{
					classname = "commentary_dummy"
					angles = Vector( 0, 180, 0 )
					EyeHeight = "64"
					HeadPitchPoseParam = "Head_Pitch"
					HeadYawPoseParam = "Head_Yaw"
					LookAtPlayers = "1"
					model = "models/survivors/survivor_namvet.mdl"
					StartingAnim = "Idle_Calm_Pistol"
					StartingWeapons = "weapon_pistol"
					targetname = "bill"
					origin = Vector( 0, 0, 0 )
				}
			}
			usetarget = 
			{
				SpawnInfo =
				{
					classname = "point_script_use_target"
					model = "bill"
					origin = Vector( 0, 0, 0 )
					targetname = "usetarget"
					vscripts = "usetargets/trader_bill"
				}
			}
		} // SpawnTables
	} // EntityGroup
} // Bill

RegisterEntityGroup( "Bill", Bill )
