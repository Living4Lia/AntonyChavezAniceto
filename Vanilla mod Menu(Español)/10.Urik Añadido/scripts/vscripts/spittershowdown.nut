//-----------------------------------------------------
Msg("Activating Boomageddon\n");

// Include the VScript Library
IncludeScript("Mutation_Mod/VSLib");

IncludeScript("ass_base");

ASSOptions <-
{
	cm_MaxSpecials = 14
	cm_DominatorLimit = 14
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	SpitterLimit = 14
	
	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.334 // pain_pills_decay_rate default 0.27
		}
	}
}

AddDefaultsToTable( "ASSOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( attacker.GetType() == Z_SPITTER && damageTable.DamageType == DMG_CLUB && victim.IsSurvivor() )
		{
			ScriptedDamageInfo.DamageDone = 15;
			return true;
		}
	}
	catch( error )
	{
		
	}
	return true;
}

function Notifications::OnSurvivorsLeftStartArea::DoStuff()
{
	EntFire( "tankdoorout_button", "Unlock" );
	EntFire( "tank_sound_timer", "Kill" );
	
	EntFire( "spawn_church_zombie", "AddOutput", "population spitter" );
}

function EasyLogic::Update::Think()
{
	DirectorOptions.RecalculateHealthDecay();
}
