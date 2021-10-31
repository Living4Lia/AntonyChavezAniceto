//-----------------------------------------------------
Msg("Activating Uncommon Ambush\n");
Msg("Made by Rayman1103\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

MutationOptions <-
{
	cm_AggressiveSpecials = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 5
	cm_MaxSpecials = 5
	cm_SpecialRespawnInterval = 15
	cm_SpecialSlotCountdownTime = 0
	PreferredSpecialDirection = SPAWN_SPECIALS_IN_FRONT_OF_SURVIVORS
	//cm_ProhibitBosses = true
	SpecialInfectedAssault = 1
	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	//ShouldAllowSpecialsWithTank = true
	//ZombieTankHealth = 5000
	FarAcquireRange = 999999
	NearAcquireRange = 999999
	FarAcquireTime = 0.0
	NearAcquireTime = 0.0
	
	BoomerLimit = 2
	SmokerLimit = 2
	HunterLimit = 2
	ChargerLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
}

function Notifications::OnDeath::InfectedDeath( victim, attacker, params )
{
	if ( attacker && victim.GetType() != Z_COMMON && victim.GetType() != Z_SURVIVOR )
	{
		local RandomZombieModels =
		[
			"common_male_ceda"
			"common_male_mud"
			"common_male_roadcrew"
			"common_male_riot"
			"common_male_clown"
		]
		
		local randomType = false;
		local amount = 5;
		local vectorOverride = 10;
		if ( victim.GetType() == Z_BOOMER )
		{
			foreach( infected in Players.Infected() )
			{
				if ( infected.GetType() != Z_TANK )
					infected.Kill();
			}
			randomType = true;
			amount = 10;
		}
		if ( victim.GetType() == Z_SMOKER )
		{
			Convars.SetValue( "z_forcezombiemodelname", "common_male_roadcrew" );
		}
		if ( victim.GetType() == Z_HUNTER )
		{
			Convars.SetValue( "z_forcezombiemodelname", "common_male_mud" );
		}
		if ( victim.GetType() == Z_CHARGER )
		{
			Convars.SetValue( "z_forcezombiemodelname", "common_male_riot" );
		}
		if ( victim.GetType() == Z_SPITTER )
		{
			Convars.SetValue( "z_forcezombiemodelname", "common_male_ceda" );
		}
		if ( victim.GetType() == Z_JOCKEY )
		{
			Convars.SetValue( "z_forcezombiemodelname", "common_male_clown" );
		}
		if ( victim.GetType() == Z_TANK )
		{
			randomType = true;
			amount = 30;
		}
		if ( victim.GetType() == Z_WITCH )
		{
			randomType = true;
			amount = 20;
		}
		
		for ( local i = 0; i < amount; i++ )
		{
			if ( randomType )
				Convars.SetValue( "z_forcezombiemodelname", Utils.GetRandValueFromArray(RandomZombieModels) );
			
			Utils.SpawnZombie(Z_COMMON, victim.GetLocation() + Vector( vectorOverride, 0, 0 ));
			vectorOverride += 10;
		}
		foreach( infected in Zombies.CommonInfected() )
			infected.SetNetProp("m_mobRush", 1);
	}
}

function EasyLogic::Update::Think()
{
	foreach( infected in Zombies.CommonInfected() )
	{
		if ( !infected.IsUncommonInfected() )
			infected.Input( "Kill" );
	}
}
