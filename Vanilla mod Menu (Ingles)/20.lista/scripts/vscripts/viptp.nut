//-----------------------------------------------------
Msg("Activating VIP Escort: Three Throws\n");
Msg("Made by Rayman1103\n");

IncludeScript("tripleplay");
IncludeScript("vip_base");

VIPState <-
{
	HasPermaWipe = false
	SaveVIPData = false
	VIPRules = "You must protect the Survivor at all cost! If his heart stops beating, so will yours!"
}

AddDefaultsToTable( "VIPState", g_ModeScript, "MutationState", g_ModeScript );

::VIPData.givemedkits <- false;

function Notifications::OnSurvivorsSpawned::GiveThrowables( amount )
{
	if ( amount != 5 )
		return;
	
	printf("Changing Weapons") // printf will automatically add \n to the end
	
	// Sanitizing weapons usually takes 1 game frame (because EntFire
	// sends inputs which are processed the next game frame).
	Utils.SanitizeHeldItems();
	
	// Thus, we can't sanitize weapons AND give the players weapons on the same game frame.
	// So what we need to do is add a small delay before giving them new weapons.
	
	local function GiveRandomWeapon( args )
	{
		// Give each survivor a random weapon
		foreach (survivor in Players.AliveSurvivors())
		{
			local randWep = Utils.GetRandValueFromArray(ListOfThrowables);
			survivor.Give(randWep);
		}
	}
	
	// A 0.1 second delay is wayyy more than enough time after sanitizing weapons
	Timers.AddTimer(0.1, false, GiveRandomWeapon);
	Timers.AddTimer(20.0, true, GiveThrowable);
	Timers.AddTimerByName("HealthRegenTimer", SessionState.HPRegenTime, true, HealthRegen);
}

function Notifications::OnSurvivorsSpawned::SurvivorsSpawned( amount )
{
	if ( amount != 5 )
		return;
	
	foreach ( survivor in Players.AliveSurvivors() )
	{
		survivor.SetHealthBuffer( 0 );
		survivor.SetHealth( 100 );
		survivor.SetReviveCount( 0 );
		survivor.SetNetProp( "m_bIsOnThirdStrike", 0 );
		survivor.StopSound( "Player.HeartbeatLoop" );
		survivor.StopSound( "Player.Heartbeat" );
	}
}

function Notifications::OnDeath::SurvivorDeath( victim, attacker, params )
{
	if ( victim.GetTeam() == SURVIVORS && !SessionState.VIPDefibStart )
		EntFire( "survivor_death_model", "BecomeRagdoll" );
}
