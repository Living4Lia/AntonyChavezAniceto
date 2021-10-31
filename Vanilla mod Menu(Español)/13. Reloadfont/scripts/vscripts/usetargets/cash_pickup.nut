Enabled <- false; // Variable to keep track of if the button is usable.

// Called when the entity spawns.
function Precache()
{
	self.SetProgressBarFinishTime( 0 );
	self.SetProgressBarCurrentProgress( 0.0 );
	self.CanShowBuildPanel( false );
	Enabled = true;
}

function Remove()
{
	EntFire( self.GetUseModelName(), "Kill" );
	EntFire( self.GetName(), "Kill" );
}

// Called when a player tries to use the button.
// Return false to disable the third-person use animation.
function OnUseStart()
{
	local UsingPlayer = Utils.GetEntityFromHandle( this.PlayerUsingMe );
	
	if ( Enabled )
	{
		SessionState.PlayerCash[UsingPlayer.GetCharacterName()] += 100;
		Enabled = false;
		Remove();
	}
}

// Called when the progress bar is full.
function OnUseFinished()
{
	Enabled = false;
	EntFire( self.GetUseModelName(), "Kill" )
	EntFire( self.GetName(), "Kill" )
}