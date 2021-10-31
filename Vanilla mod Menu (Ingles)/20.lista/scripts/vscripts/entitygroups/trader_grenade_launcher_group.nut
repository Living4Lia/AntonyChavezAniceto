//-------------------------------------------------------
// Autogenerated from 'trader_grenade_launcher.vmf'
//-------------------------------------------------------
GrenadeLauncher <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.grenade_launcher,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.grenade_launcher,
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
			grenade_launcher = 
			{
				SpawnInfo =
				{
					classname = "prop_dynamic_override"
					angles = Vector( 0, 0, 90 )
					fademindist = "-1"
					fadescale = "1"
					glowbackfacemult = "1.0"
					glowcolor = "0 0 0"
					health = "0"
					LagCompensate = "0"
					MaxAnimTime = "10"
					MinAnimTime = "5"
					model = "models/w_models/weapons/w_grenade_launcher.mdl"
					RandomAnimation = "0"
					renderamt = "255"
					rendercolor = "255 255 255"
					SetBodyGroup = "0"
					skin = "0"
					solid = "6"
					spawnflags = "0"
					targetname = "grenade_launcher"
					updatechildren = "0"
					origin = Vector( 0, 0, 0 )
				}
			}
			usetarget = 
			{
				SpawnInfo =
				{
					classname = "point_script_use_target"
					model = "grenade_launcher"
					origin = Vector( 0, 0, 0 )
					targetname = "usetarget"
					vscripts = "usetargets/trader_grenade_launcher"
				}
			}
		} // SpawnTables
	} // EntityGroup
} // GrenadeLauncher

RegisterEntityGroup( "GrenadeLauncher", GrenadeLauncher )
