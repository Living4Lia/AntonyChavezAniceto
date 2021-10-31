//-----------------------------------------------------
Msg("Activating Double Trouble\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_CommonLimit = 0
	cm_DominatorLimit = 12
	cm_MaxSpecials = 12
	cm_SpecialRespawnInterval = 0
	//cm_ProhibitBosses = true
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	//ZombieTankHealth = 5000
	
	BoomerLimit = 1
	SmokerLimit = 1
	HunterLimit = 1
	ChargerLimit = 1
	SpitterLimit = 1
	JockeyLimit = 1
	//TankLimit = 10
}

MutationState <-
{
	AllowBoomerSplit = false
	AllowSmokerSplit = false
	AllowHunterSplit = false
	AllowChargerSplit = false
	AllowSpitterSplit = false
	AllowJockeySplit = false
	AllowTankSplit = false
	AllowWitchSplit = false
	BoomersSplit = 0
	SmokersSplit = 0
	HuntersSplit = 0
	ChargersSplit = 0
	SpittersSplit = 0
	JockeysSplit = 0
	TanksSplit = 0
	WitchesSplit = 0
	SpecialCloned = {}
}

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
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
		/*if ( attacker.GetTeam() == SURVIVORS && victim.GetTeam() == SURVIVORS )
		{
			return false;
		}*/
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnWitchSpawned::WitchSpawn( witch, params )
{
	if ( SessionState.AllowWitchSplit )
	{
		if ( SessionState.WitchesSplit < 2 )
		{
			witch.SetHealth(witch.GetHealth() / 2);
			SessionState.SpecialCloned[witch.GetBaseIndex()] <- true;
			SessionState.WitchesSplit++;
			
			if ( SessionState.WitchesSplit == 2 )
			{
				SessionState.AllowWitchSplit = false;
				SessionState.WitchesSplit = 0;
			}
		}
	}
}

function Notifications::OnSpawn::InfectedSpawn( player, params )
{
	if ( player.GetType() == Z_BOOMER && SessionState.AllowBoomerSplit )
	{
		if ( SessionState.BoomersSplit < 2 )
		{
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.BoomersSplit++;
			
			if ( SessionState.BoomersSplit == 2 )
			{
				SessionState.AllowBoomerSplit = false;
				SessionState.BoomersSplit = 0;
			}
		}
	}
	if ( player.GetType() == Z_SMOKER && SessionState.AllowSmokerSplit )
	{
		if ( SessionState.SmokersSplit < 2 )
		{
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.SmokersSplit++;
			
			if ( SessionState.SmokersSplit == 2 )
			{
				SessionState.AllowSmokerSplit = false;
				SessionState.SmokersSplit = 0;
			}
		}
	}
	if ( player.GetType() == Z_HUNTER && SessionState.AllowHunterSplit )
	{
		if ( SessionState.HuntersSplit < 2 )
		{
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.HuntersSplit++;
			
			if ( SessionState.HuntersSplit == 2 )
			{
				SessionState.AllowHunterSplit = false;
				SessionState.HuntersSplit = 0;
			}
		}
	}
	if ( player.GetType() == Z_CHARGER && SessionState.AllowChargerSplit )
	{
		if ( SessionState.ChargersSplit < 2 )
		{
			player.SetHealth(player.GetHealth() / 2);
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.ChargersSplit++;
			
			if ( SessionState.ChargersSplit == 2 )
			{
				SessionState.AllowChargerSplit = false;
				SessionState.ChargersSplit = 0;
			}
		}
	}
	if ( player.GetType() == Z_SPITTER && SessionState.AllowSpitterSplit )
	{
		if ( SessionState.SpittersSplit < 2 )
		{
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.SpittersSplit++;
			
			if ( SessionState.SpittersSplit == 2 )
			{
				SessionState.AllowSpitterSplit = false;
				SessionState.SpittersSplit = 0;
			}
		}
	}
	if ( player.GetType() == Z_JOCKEY && SessionState.AllowJockeySplit )
	{
		if ( SessionState.JockeysSplit < 2 )
		{
			player.SetHealth(player.GetHealth() / 2);
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.JockeysSplit++;
			
			if ( SessionState.JockeysSplit == 2 )
			{
				SessionState.AllowJockeySplit = false;
				SessionState.JockeysSplit = 0;
			}
		}
	}
	if ( player.GetType() == Z_TANK && SessionState.AllowTankSplit )
	{
		if ( SessionState.TanksSplit < 2 )
		{
			player.SetHealth(player.GetHealth() / 2);
			SessionState.SpecialCloned[player.GetBaseIndex()] <- true;
			SessionState.TanksSplit++;
			
			if ( SessionState.TanksSplit == 2 )
			{
				SessionState.AllowTankSplit = false;
				SessionState.TanksSplit = 0;
			}
		}
	}
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker )
	{
		if ( (victim.GetBaseIndex() in SessionState.SpecialCloned) && (SessionState.SpecialCloned[victim.GetBaseIndex()]) )
		{
			SessionState.SpecialCloned[victim.GetBaseIndex()] <- false;
			return;
		}
		if ( victim.GetType() != Z_SURVIVOR )
		{
			if ( victim.GetType() == Z_BOOMER )
			{
				SessionOptions.BoomerLimit = 2;
				SessionState.AllowBoomerSplit = true;
			}
			if ( victim.GetType() == Z_SMOKER )
			{
				SessionOptions.SmokerLimit = 2;
				SessionState.AllowSmokerSplit = true;
			}
			if ( victim.GetType() == Z_HUNTER )
			{
				SessionOptions.HunterLimit = 2;
				SessionState.AllowHunterSplit = true;
			}
			if ( victim.GetType() == Z_CHARGER )
			{
				SessionOptions.ChargerLimit = 2;
				SessionState.AllowChargerSplit = true;
			}
			if ( victim.GetType() == Z_SPITTER )
			{
				SessionOptions.SpitterLimit = 2;
				SessionState.AllowSpitterSplit = true;
			}
			if ( victim.GetType() == Z_JOCKEY )
			{
				SessionOptions.JockeyLimit = 2;
				SessionState.AllowJockeySplit = true;
			}
			if ( victim.GetType() == Z_TANK )
			{
				SessionState.AllowTankSplit = true;
			}
			if ( victim.GetType() == Z_WITCH )
			{
				SessionState.AllowWitchSplit = true;
			}
			
			Utils.SpawnZombie( victim.GetType(), victim.GetLocation() );
			Utils.SpawnZombie( victim.GetType(), victim.GetLocation() );
			
			if ( victim.GetType() == Z_BOOMER )
				SessionOptions.BoomerLimit = 1;
			if ( victim.GetType() == Z_SMOKER )
				SessionOptions.SmokerLimit = 1;
			if ( victim.GetType() == Z_HUNTER )
				SessionOptions.HunterLimit = 1;
			if ( victim.GetType() == Z_CHARGER )
				SessionOptions.ChargerLimit = 1;
			if ( victim.GetType() == Z_SPITTER )
				SessionOptions.SpitterLimit = 1;
			if ( victim.GetType() == Z_JOCKEY )
				SessionOptions.JockeyLimit = 1;
		}
	}
}

function EasyLogic::Update::Think()
{
	if ( Director.GetCommonInfectedCount() >= 1 )
	{
		foreach ( infected in Zombies.CommonInfected() )
			infected.Input( "Kill" );
	}
}
