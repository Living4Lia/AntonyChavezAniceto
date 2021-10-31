//-----------------------------------------------------
//Msg("Processing ZSL ResponseRules\n");

function EasyLogic::OnProcessResponse::ZSLResponseRules()
{
	local zslrules =
	[
		{
			name = "PlayerIncapacitatedInitial",
			criteria =
			[
				[ "Concept", "PlayerIncapacitated" ],
			],
			responses =
			[
				{
					scenename = "",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
		{
			name = "ReviveThanks",
			criteria =
			[
				[ "Concept", "RevivedByFriend" ],
			],
			responses =
			[
				{
					scenename = "",
				}
			],
			group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
		},
	]
	ResponseRules.ProcessRules( zslrules );
}
