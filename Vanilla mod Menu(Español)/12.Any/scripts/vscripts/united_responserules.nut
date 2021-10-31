//-----------------------------------------------------
//Msg("Processing United We Stand ResponseRules\n");

::UnitedCheckL4D2SurvivorResponse <- function ( speaker, query )
{
	local survivor = ::VSLib.Entity(speaker).GetNetPropEntity( "m_survivor" ).GetResponseCriterion( "who" );
	local responses =
	{
		Coach = [ "Coach_CallForRescue01", "Coach_CallForRescue02", "Coach_CallForRescue03", "Coach_CallForRescue04", "Coach_CallForRescue05",
					"Coach_CallForRescue06", "Coach_CallForRescue07", "Coach_CallForRescue08", "Coach_CallForRescue09", "Coach_CallForRescue10",
					"Coach_CallForRescue11", "Coach_CallForRescue12", "Coach_CallForRescue13", "Coach_CallForRescue14", "Coach_CallForRescue15",
					"Coach_CallForRescue16" ]
		Gambler = [ "Gambler_CallForRescue01", "Gambler_CallForRescue02", "Gambler_CallForRescue03", "Gambler_CallForRescue04",
					"Gambler_CallForRescue05", "Gambler_CallForRescue06", "Gambler_CallForRescue07", "Gambler_CallForRescue08",
					"Gambler_CallForRescue09", "Gambler_CallForRescue10", "Gambler_CallForRescue11", "Gambler_CallForRescue12" ]
		Mechanic = [ "Mechanic_CallForRescue01", "Mechanic_CallForRescue02", "Mechanic_CallForRescue03", "Mechanic_CallForRescue04",
						"Mechanic_CallForRescue05", "Mechanic_CallForRescue06", "Mechanic_CallForRescue07", "Mechanic_CallForRescue08",
						"Mechanic_CallForRescue09", "Mechanic_CallForRescue10", "Mechanic_CallForRescue11", "Mechanic_CallForRescue12",
						"Mechanic_CallForRescue13", "Mechanic_CallForRescue14", "Mechanic_CallForRescue15", "Mechanic_CallForRescue16",
						"Mechanic_CallForRescue17", "Mechanic_CallForRescue18", "Mechanic_CallForRescue19" ]
		Producer = [ "Producer_CallForRescue01", "Producer_CallForRescue02", "Producer_CallForRescue03", "Producer_CallForRescue04",
						"Producer_CallForRescue05", "Producer_CallForRescue06", "Producer_CallForRescue07", "Producer_CallForRescue08",
						"Producer_CallForRescue09", "Producer_CallForRescue10", "Producer_CallForRescue11", "Producer_CallForRescue12" ]
	}
	
	if ( !(survivor in responses) )
		return;
	
	::VSLib.Entity(speaker).EmitSound( Utils.GetRandValueFromArray( responses[survivor] ) );
}

function EasyLogic::OnProcessResponse::UnitedResponseRules()
{
	if ( Utils.GetSurvivorSet() == 2 )
	{
		local unitedrules =
		[
			{
				name = "L4D1PlayerCallForRescueUnknown",
				criteria =
				[
					[ "concept", "CallForRescue" ],
					Criterion.IsUnknown,
				],
				responses =
				[
					{
						soundname = "Player.TeenGirl_CallForRescue01",
					},
					{
						soundname = "Player.TeenGirl_CallForRescue02",
					},
					{
						soundname = "Player.TeenGirl_CallForRescue06",
					},
					{
						soundname = "Player.TeenGirl_CallForRescue07",
					},
					{
						soundname = "Player.TeenGirl_CallForRescue14",
					},
					{
						soundname = "Player.TeenGirl_CallForRescue16",
					},
					{
						soundname = "Player.TeenGirl_LostCall01",
					},
					{
						soundname = "Player.TeenGirl_LostCall010",
					},
					{
						soundname = "Player.TeenGirl_LostCall04",
					},
					{
						soundname = "Player.TeenGirl_LostCall06",
					},
					{
						soundname = "Player.TeenGirl_LostCall07",
					},
					{
						soundname = "Player.TeenGirl_LostCall09",
					},
					{
						soundname = "Player.TeenGirl_LostCall13",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerNiceShotUnknownCoach",
				criteria =
				[
					[ "concept", "L4D1PlayerNiceShot" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotSpeaking,
					Criterion.IsSubjectDistNear1500,
					Criterion.ChanceToFire70Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsCoach,
				],
				responses =
				[
					{
						scenename = "scenes/Coach/DLC1_C6M3_FinaleL4D1Killing03.vcd",
					},
					{
						scenename = "scenes/Coach/DLC1_C6M3_FinaleL4D1Killing04.vcd",
					},
					{
						scenename = "scenes/Coach/NiceShotFemale01.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerNiceShotUnknownGambler",
				criteria =
				[
					[ "concept", "L4D1PlayerNiceShot" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotSpeaking,
					Criterion.IsSubjectDistNear1500,
					Criterion.ChanceToFire70Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsGambler,
				],
				responses =
				[
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Killing03.vcd",
					},
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Killing05.vcd",
					},
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Killing07.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerNiceShotUnknownMechanic",
				criteria =
				[
					[ "concept", "L4D1PlayerNiceShot" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotSpeaking,
					Criterion.IsSubjectDistNear1500,
					Criterion.ChanceToFire70Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsMechanic,
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing01.vcd",
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing02.vcd",
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing04.vcd",
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing07.vcd",
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing10.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerNiceShotUnknownProducer",
				criteria =
				[
					[ "concept", "L4D1PlayerNiceShot" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotSpeaking,
					Criterion.IsSubjectDistNear1500,
					Criterion.ChanceToFire70Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsProducer,
				],
				responses =
				[
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleL4D1Killing07.vcd",
					},
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleL4D1Killing08.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerReviveFriendLoudUnknownBiker",
				criteria =
				[
					[ "concept", "PlayerReviveFriend" ],
					Criterion.IsNotCoughing,
					Criterion.SubjectIsUnknown,
					Criterion.IsBiker,
					[ @(query) ("zombiepresenttank" in query) && (query.zombiepresenttank == 1) ],
				],
				responses =
				[
					{
						scenename = "scenes/Biker/ReviveFriendLoud03.vcd",
						applycontext = { context = "ReviveTalk", value = "1", duration = 5 },
					},
					{
						scenename = "scenes/Biker/ReviveFriendLoud06.vcd",
						applycontext = { context = "ReviveTalk", value = "1", duration = 5 },
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerReviveFriendLoudUnknownManager",
				criteria =
				[
					[ "concept", "PlayerReviveFriend" ],
					Criterion.IsNotCoughing,
					Criterion.IsManager,
					[ @(query) query.Subject == "Unknown" || query.Subject == "Producer" ],
					[ @(query) ("zombiepresenttank" in query) && (query.zombiepresenttank == 1) ],
				],
				responses =
				[
					{
						scenename = "scenes/Manager/ReviveFriendLoud07.vcd",
						applycontext = { context = "ReviveTalk", value = "1", duration = 5 },
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1ReviveThanksUnknownBiker",
				criteria =
				[
					[ "concept", "RevivedByFriend" ],
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsBiker,
				],
				responses =
				[
					{
						scenename = "scenes/Biker/Thanks17.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkBiker", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Biker/ToTheRescueThanks04.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkBiker", value = "1", duration = 2 },
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1ReviveThanksUnknownGambler",
				criteria =
				[
					[ "concept", "RevivedByFriend" ],
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsGambler,
				],
				responses =
				[
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Items06.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkGambler", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Killing03.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkGambler", value = "1", duration = 2 },
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1ReviveThanksUnknownMechanic",
				criteria =
				[
					[ "concept", "RevivedByFriend" ],
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsMechanic,
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Items01.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkMechanic", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Items02.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkMechanic", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Items03.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkMechanic", value = "1", duration = 2 },
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1ReviveThanksUnknownProducer",
				criteria =
				[
					[ "concept", "RevivedByFriend" ],
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					Criterion.IsProducer,
				],
				responses =
				[
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleFinalGas03.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkProducer", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleL4D1Items01.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkProducer", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleL4D1Items02.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkProducer", value = "1", duration = 2 },
					},
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleL4D1Killing07.vcd",
						delay = RandomFloat( 0.2, 0.5 ),
						applycontext = { context = "TalkProducer", value = "1", duration = 2 },
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorMournUnknownBiker",
				criteria =
				[
					[ "concept", "PlayerSeeDeadPlayer" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotIncapacitated,
					Criterion.IsBiker,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
					[ @(query) ("activeweapon" in query) && (query.activeweapon != "Defibrillator") ],
				],
				responses =
				[
					{
						scenename = "scenes/Biker/GriefFemaleGeneric03.vcd",
					},
					{
						scenename = "scenes/Biker/GriefTeengirl01.vcd",
					},
					{
						scenename = "scenes/Biker/GriefTeengirl02.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorMournUnknownManager",
				criteria =
				[
					[ "concept", "PlayerSeeDeadPlayer" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotIncapacitated,
					Criterion.IsManager,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
					[ @(query) ("activeweapon" in query) && (query.activeweapon != "Defibrillator") ],
				],
				responses =
				[
					{
						scenename = "scenes/Manager/GriefFemaleGeneric02.vcd",
					},
					{
						scenename = "scenes/Manager/GriefTeengirl04.vcd",
					},
					{
						scenename = "scenes/Manager/GriefTeengirl05.vcd",
					},
					{
						scenename = "scenes/Manager/GriefTeengirl07.vcd",
					},
					{
						scenename = "scenes/Manager/GriefTeengirl08.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorMournUnknownNamVet",
				criteria =
				[
					[ "concept", "PlayerSeeDeadPlayer" ],
					Criterion.IsNotCoughing,
					Criterion.IsNotIncapacitated,
					Criterion.IsNamVet,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
					[ @(query) ("activeweapon" in query) && (query.activeweapon != "Defibrillator") ],
				],
				responses =
				[
					{
						scenename = "scenes/NamVet/GriefFemaleGeneric01.vcd",
					},
					{
						scenename = "scenes/NamVet/GriefFemaleGeneric02.vcd",
					},
					{
						scenename = "scenes/NamVet/GriefFemaleGeneric04.vcd",
					},
					{
						scenename = "scenes/NamVet/GriefTeengirl01.vcd",
					},
					{
						scenename = "scenes/NamVet/GriefTeengirl02.vcd",
					},
					{
						scenename = "scenes/NamVet/GriefTeengirl03.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1HelpResponseUnknownBiker",
				criteria =
				[
					[ "concept", "FriendNeedsHelp" ],
					Criterion.IsNotIncapacitated,
					Criterion.IsInSafeSpot,
					Criterion.IsNotInStartArea,
					Criterion.IsBiker,
					Criterion.FromIsUnknown,
					[ @(query) ("numberinsafespot" in query) && (query.numberinsafespot > 1) ],
				],
				responses =
				[
					{
						scenename = "scenes/Biker/InsideSafeRoom02.vcd",
					},
					{
						scenename = "scenes/Biker/InsideSafeRoom05.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1HelpResponseUnknownManager",
				criteria =
				[
					[ "concept", "FriendNeedsHelp" ],
					Criterion.IsNotIncapacitated,
					Criterion.IsInSafeSpot,
					Criterion.IsNotInStartArea,
					Criterion.IsManager,
					Criterion.FromIsUnknown,
					[ @(query) ("numberinsafespot" in query) && (query.numberinsafespot > 1) ],
				],
				responses =
				[
					{
						scenename = "scenes/Manager/InsideSafeRoom02.vcd",
					},
					{
						scenename = "scenes/Manager/InsideSafeRoom05.vcd",
					},
					{
						scenename = "scenes/Manager/InsideSafeRoom08.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1HelpResponseUnknownNamVet",
				criteria =
				[
					[ "concept", "FriendNeedsHelp" ],
					Criterion.IsNotIncapacitated,
					Criterion.IsInSafeSpot,
					Criterion.IsNotInStartArea,
					Criterion.IsNamVet,
					Criterion.FromIsUnknown,
					[ @(query) ("numberinsafespot" in query) && (query.numberinsafespot > 1) ],
				],
				responses =
				[
					{
						scenename = "scenes/NamVet/InsideSafeRoom02.vcd",
					},
					{
						scenename = "scenes/NamVet/InsideSafeRoom06.vcd",
					},
					{
						scenename = "scenes/NamVet/InsideSafeRoom07.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1ThanksGotItemUnknown",
				criteria =
				[
					[ "concept", "Award" ],
					Criterion.IsNotCoughing,
					Criterion.IsSharingSubject,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/TeenGirl/Thanks02.vcd",
					},
					{
						scenename = "scenes/TeenGirl/Thanks03.vcd",
					},
					{
						scenename = "scenes/TeenGirl/Thanks07.vcd",
					},
					{
						scenename = "scenes/TeenGirl/Thanks11.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedUnknownBiker",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsBiker,
					Criterion.IsNotCoughing,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Biker/NameZoey01.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.679 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Biker/NameZoey02.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 1.011 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedUnknownManager",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsManager,
					Criterion.IsNotCoughing,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Manager/GriefTeengirl01.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 1.771 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/GriefTeengirl02.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 2.687 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/GriefTeengirl03.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 3.172 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/GriefTeengirl06.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 1.223 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/NameZoey01.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.636 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/NameZoey02.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.852 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedUnknownNamVet",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsNamVet,
					Criterion.IsNotCoughing,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/NamVet/NameZoey01.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.744 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/NamVet/NameZoey02.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 1.275 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedUnknownGambler",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsGambler,
					Criterion.IsNotCoughing,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Killing04.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.588 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedFrancisMechanic",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsMechanic,
					Criterion.IsNotCoughing,
					Criterion.IsDeadBiker,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing13.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.628 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedLouisMechanic",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsMechanic,
					Criterion.IsNotCoughing,
					Criterion.IsDeadManager,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing20.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 1.173 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedUnknownMechanic",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsMechanic,
					Criterion.IsNotCoughing,
					Criterion.IsDeadUnknown,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing11.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.608 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorDiedFrancisProducer",
				criteria =
				[
					[ "concept", "SurvivorDied" ],
					Criterion.IsProducer,
					Criterion.IsNotCoughing,
					Criterion.IsDeadBiker,
					[ @(query) !("worldsaidsomeonedied" in query) || (("worldsaidsomeonedied" in query) && (query.worldsaidsomeonedied != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Producer/DLC1_C6M3_FinaleL4D1Killing04.vcd",
						delay = RandomFloat( 0.5, 1.25 ),
						then = { target = "Any", concept = "Death2Left", contexts = null, delay = 0.997 },
						applycontext =
						{
							context1 = { context = "SaidSomeoneDied", value = "1", duration = 10 },
							context2 = { context = "SaidSomeoneDiedKill", value = "1", duration = 20 }
						},
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerUnknownPouncedBiker",
				criteria =
				[
					[ "concept", "SurvivorWasPounced" ],
					Criterion.IsBiker,
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					[ @(query) !("worldunknownpounced" in query) || (("worldunknownpounced" in query) && (query.worldunknownpounced != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Biker/HunterZoeyPounced01.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Biker/HunterZoeyPounced02.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Biker/HunterZoeyPounced03.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerUnknownPouncedManager",
				criteria =
				[
					[ "concept", "SurvivorWasPounced" ],
					Criterion.IsManager,
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					[ @(query) !("worldunknownpounced" in query) || (("worldunknownpounced" in query) && (query.worldunknownpounced != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/Manager/HunterZoeyPounced01.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/HunterZoeyPounced02.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/Manager/HunterZoeyPounced03.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1PlayerUnknownPouncedNamVet",
				criteria =
				[
					[ "concept", "SurvivorWasPounced" ],
					Criterion.IsNamVet,
					Criterion.IsNotCoughing,
					Criterion.ChanceToFire30Percent,
					Criterion.SubjectIsUnknown,
					[ @(query) !("worldunknownpounced" in query) || (("worldunknownpounced" in query) && (query.worldunknownpounced != 1)) ],
				],
				responses =
				[
					{
						scenename = "scenes/NamVet/HunterZoeyPounced01.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/NamVet/HunterZoeyPounced02.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					},
					{
						scenename = "scenes/NamVet/HunterZoeyPounced03.vcd",
						delay = RandomFloat( 0.5, 1.0 ),
						applycontext = { context = "UnknownPounced", value = "1", duration = 60 },
						applycontexttoworld = true,
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "SurvivorSpottedUnknownGambler",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsGambler,
					Criterion.IsNotSmartLookAuto,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/Gambler/DLC1_C6M3_FinaleL4D1Killing04.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "SurvivorSpottedUnknownMechanic",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsMechanic,
					Criterion.IsNotSmartLookAuto,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing06.vcd",
					},
					{
						scenename = "scenes/Mechanic/DLC1_C6M3_FinaleL4D1Killing11.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorSpottedUnknownCloseBiker",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsBiker,
					Criterion.IsNotSmartLookAuto,
					Criterion.IsTeenGirlNear400,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/Biker/NameZoey03.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorSpottedUnknownFarBiker",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsBiker,
					Criterion.IsNotSmartLookAuto,
					Criterion.IsTeenGirlFar400,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/Biker/NameZoey01.vcd",
						scenename = "scenes/Biker/NameZoey02.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorSpottedUnknownCloseManager",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsManager,
					Criterion.IsNotSmartLookAuto,
					Criterion.IsTeenGirlNear400,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/Manager/NameZoey04.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorSpottedUnknownFarManager",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsManager,
					Criterion.IsNotSmartLookAuto,
					Criterion.IsTeenGirlFar400,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/Manager/NameZoey01.vcd",
						scenename = "scenes/Manager/NameZoey03.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorSpottedUnknownCloseNamVet",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsNamVet,
					Criterion.IsNotSmartLookAuto,
					Criterion.IsTeenGirlNear400,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/NamVet/NameZoey03.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "L4D1SurvivorSpottedUnknownFarNamVet",
				criteria =
				[
					[ @(query) query.concept == "PlayerLook" || query.concept == "PlayerLookHere" ],
					Criterion.IsNotCoughing,
					Criterion.IsNamVet,
					Criterion.IsNotSmartLookAuto,
					Criterion.IsTeenGirlFar400,
					Criterion.SubjectIsUnknown,
				],
				responses =
				[
					{
						scenename = "scenes/NamVet/NameZoey01.vcd",
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
		]
		ResponseRules.ProcessRules( unitedrules );
	}
	else
	{
		local unitedrules_l4d1 =
		[
			{
				name = "PlayerCallForRescueUnknown",
				criteria =
				[
					[ "concept", "CallForRescue" ],
					Criterion.IsUnknown,
				],
				responses =
				[
					{
						func = UnitedCheckL4D2SurvivorResponse,
					},
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "C11M5PlaneCrashCoach",
				criteria =
				[
					[ "concept", "PlaneCrashResponse" ],
					Criterion.IsCoach,
				],
				responses =
				[
					{
						scenename = "scenes/Coach/ReactionNegative01.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					},
					{
						scenename = "scenes/Coach/ReactionNegative15.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "C11M5PlaneCrashGambler",
				criteria =
				[
					[ "concept", "PlaneCrashResponse" ],
					Criterion.IsGambler,
				],
				responses =
				[
					{
						scenename = "scenes/Gambler/ReactionNegative04.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					},
					{
						scenename = "scenes/Gambler/ReactionNegative05.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "C11M5PlaneCrashMechanic",
				criteria =
				[
					[ "concept", "PlaneCrashResponse" ],
					Criterion.IsMechanic,
				],
				responses =
				[
					{
						scenename = "scenes/Mechanic/ReactionNegative02.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					},
					{
						scenename = "scenes/Mechanic/ReactionNegative04.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
			{
				name = "C11M5PlaneCrashProducer",
				criteria =
				[
					[ "concept", "PlaneCrashResponse" ],
					Criterion.IsProducer,
				],
				responses =
				[
					{
						scenename = "scenes/Producer/ReactionNegative08.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					},
					{
						scenename = "scenes/Producer/ReactionNegative21.vcd",
						delay = RandomFloat( 0.5, 2.0 ),
					}
				],
				group_params = ResponseRules.GroupParams({ permitrepeats = true, sequential = false, norepeat = false })
			},
		]
		ResponseRules.ProcessRules( unitedrules_l4d1 );
	}
}
