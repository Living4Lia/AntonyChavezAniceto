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
	BoomerLimit = 14
}

AddDefaultsToTable( "ASSOptions", g_ModeScript, "MutationOptions", g_ModeScript );

function EasyLogic::OnTakeDamage::AllowDamage( damageTable )
{
	local attacker = Utils.GetEntityOrPlayer(damageTable.Attacker);
	local victim = Utils.GetEntityOrPlayer(damageTable.Victim);
	try
	{
		if ( attacker.GetType() == Z_BOOMER && victim.IsSurvivor() )
		{
			ScriptedDamageInfo.DamageDone = 24; //33
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
	
	EntFire( "spawn_church_zombie", "AddOutput", "population boomer" );
}
