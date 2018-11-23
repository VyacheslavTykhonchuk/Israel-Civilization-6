--==========================================================================================================================
-- AGENDAS
--==========================================================================================================================
-- HistoricalAgendas
---------------------------------------	
INSERT OR REPLACE INTO HistoricalAgendas	
		(LeaderType,			AgendaType)
SELECT	'LEADER_LEU_HEROD',	'AGENDA_LEU_HEROD'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

-------------------------------------
-- Types
-------------------------------------	
INSERT OR REPLACE INTO Types	
		(Type,						Kind)
VALUES	('TRAIT_AGENDA_LEU_HEROD',	'KIND_TRAIT');			
-------------------------------------			
-- Agendas			
-------------------------------------				
INSERT OR REPLACE INTO Agendas				
		(AgendaType,				Name,							Description)
VALUES	('AGENDA_LEU_HEROD',		'LOC_AGENDA_LEU_HEROD_NAME',	'LOC_AGENDA_LEU_HEROD_DESCRIPTION');	
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT OR REPLACE INTO Traits				
		(TraitType,							Name,										Description)
VALUES	('TRAIT_AGENDA_LEU_HEROD',		'LOC_AGENDA_LEU_HEROD_NAME',	'LOC_AGENDA_LEU_HEROD_DESCRIPTION');	
-------------------------------------			
-- AgendaTraits			
-------------------------------------				
INSERT OR REPLACE INTO AgendaTraits				
		(AgendaType,			TraitType)
VALUES	('AGENDA_LEU_HEROD',	'TRAIT_AGENDA_LEU_HEROD');	
-------------------------------------		
-- TraitModifiers
-------------------------------------			
INSERT OR REPLACE INTO TraitModifiers			
		(TraitType,					ModifierId)
VALUES	('TRAIT_AGENDA_LEU_HEROD',	'LEU_HEROD_CONQUEROR_LOVER'),
		('TRAIT_AGENDA_LEU_HEROD',	'LEU_HEROD_POOR_HATER'),
		('TRAIT_AGENDA_LEU_HEROD',	'LEU_HEROD_DENOUNCER_HATER');

--==========================================================================================================================
--==========================================================================================================================
-- Loves Conquerors
-------------------------------------
INSERT OR REPLACE INTO Modifiers	
		(ModifierId,								ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_HEROD_CONQUEROR_LOVER',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		null,						'LEUGENDA_HAS_MANY_CAPTURED_CITIES');

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value,														Extra,				Type)
VALUES	('LEU_HEROD_CONQUEROR_LOVER',		'InitialValue',					10,															null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_CONQUEROR_LOVER',		'StatementKey',					'LOC_DIPLO_KUDO_EXIT_LEADER_LEU_HEROD_CONQUEROR_LOVER',		null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_CONQUEROR_LOVER',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_HEROD_CONQUEROR_LOVER',				null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_CONQUEROR_LOVER',		'HiddenAgenda',					0,															null,				'ARGTYPE_IDENTITY');

INSERT OR REPLACE INTO ModifierStrings
		(ModifierId,							Context,							Text)
VALUES	('LEU_HEROD_CONQUEROR_LOVER',			'Sample',							'LOC_DIPLO_KUDO_LEADER_LEU_HEROD_CONQUEROR_LOVER');

INSERT OR REPLACE INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('LEUGENDA_HAS_MANY_CAPTURED_CITIES',		'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('LEUGENDA_HAS_MANY_CAPTURED_CITIES',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('LEUGENDA_HAS_MANY_CAPTURED_CITIES',		'REQUIRES_MET_30_TURNS_AGO'),
		('LEUGENDA_HAS_MANY_CAPTURED_CITIES',		'LEU_ISR_REQUIRES_MANY_CAPTURES'),

INSERT OR REPLACE INTO Requirements
		(RequirementId,						RequirementType,							Progressive)
VALUES	('LEU_ISR_REQUIRES_MANY_CAPTURES',	'REQUIREMENT_COLLECTION_COUNT_ATLEAST',	1);

INSERT OR REPLACE INTO RequirementArguments
		(RequirementId,						Name,							Value)
VALUES	('LEU_ISR_REQUIRES_MANY_CAPTURES',	'CollectionType',				'COLLECTION_PLAYER_CAPTURED_CITIES'),
		('LEU_ISR_REQUIRES_MANY_CAPTURES',	'Count',						3);;

--==========================================================================================================================
--==========================================================================================================================

--==========================================================================================================================
--==========================================================================================================================
-- Poor Hater
-------------------------------------
INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_HEROD_POOR_HATER',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		null,						'LEUGENDA_IS_POOR');

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,					Name,							Value,														Extra,				Type)
VALUES	('LEU_HEROD_POOR_HATER',		'InitialValue',					-7,														null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_POOR_HATER',		'StatementKey',					'LOC_DIPLO_WARNING_EXIT_LEADER_LEU_HEROD_POOR_HATER',	null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_POOR_HATER',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_HEROD_POOR_HATER',				null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_POOR_HATER',		'HiddenAgenda',					0,															null,				'ARGTYPE_IDENTITY');

INSERT OR REPLACE INTO ModifierStrings
		(ModifierId,							Context,							Text)
VALUES	('LEU_HEROD_POOR_HATER',			'Sample',							'LOC_DIPLO_WARNING_LEADER_LEU_HEROD_POOR_HATER');

INSERT OR REPLACE INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('LEUGENDA_IS_POOR',					'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('LEUGENDA_IS_POOR',					'REQUIRES_MAJOR_CIV_OPPONENT'),
		('LEUGENDA_IS_POOR',					'REQUIRES_MET_10_TURNS_AGO'),
		('LEUGENDA_IS_POOR',					'REQUIRES_HAS_LOW_INCOME'),
		('LEUGENDA_IS_POOR',					'REQUIRES_HAS_HIGH_FAITH');

--==========================================================================================================================
--==========================================================================================================================

--==========================================================================================================================
--==========================================================================================================================
-- Denounce Hater
-------------------------------------
INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_HEROD_DENOUNCER_HATER',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		null,						'LEU_HEROD_DENOUNCER_HATER');

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,					Name,							Value,														Extra,				Type)
VALUES	('LEU_HEROD_DENOUNCER_HATER',		'InitialValue',					-10,														null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_DENOUNCER_HATER',		'StatementKey',					'LOC_DIPLO_WARNING_EXIT_LEADER_LEU_HEROD_DENOUNCER_HATER',	null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_DENOUNCER_HATER',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_HEROD_DENOUNCER_HATER',				null,				'ARGTYPE_IDENTITY'),
		('LEU_HEROD_DENOUNCER_HATER',		'HiddenAgenda',					0,															null,				'ARGTYPE_IDENTITY');

INSERT OR REPLACE INTO ModifierStrings
		(ModifierId,							Context,							Text)
VALUES	('LEU_HEROD_DENOUNCER_HATER',			'Sample',							'LOC_DIPLO_WARNING_LEADER_LEU_HEROD_DENOUNCER_HATER');


--==========================================================================================================================
--==========================================================================================================================

-------------------------------------			
-- ExclusiveAgendas			
-------------------------------------				
INSERT OR REPLACE INTO ExclusiveAgendas				
		(AgendaOne,					AgendaTwo)
VALUES	('AGENDA_LEU_HEROD',		'AGENDA_DEVOUT');
		
--==========================================================================================================================
-- AI
--==========================================================================================================================
-- AiListTypes
-------------------------------------	
INSERT OR REPLACE INTO AiListTypes	
		(ListType)
VALUES	('Leu_Herod_I_Districts'),
		('Leu_Herod_I_Buildings'),
		('Leu_Herod_I_Units');
-------------------------------------
-- AiLists
-------------------------------------	
INSERT OR REPLACE INTO AiLists	
		(ListType,								AgendaType,							System)
VALUES	('Leu_Herod_I_Districts',				'TRAIT_AGENDA_LEU_HEROD',		'Districts'),
		('Leu_Herod_I_Buildings',				'TRAIT_AGENDA_LEU_HEROD',		'Districts'),
		('FavorReligiousVictory',				'TRAIT_AGENDA_LEU_HEROD',		'Strategies'),
		('WonderObsessedWonders',				'TRAIT_AGENDA_LEU_HEROD',		'PseudoYields'),
		('Leu_Herod_I_Units',					'TRAIT_AGENDA_LEU_HEROD',		'Units');

-------------------------------------		
-- AiFavoredItems
-------------------------------------	
INSERT OR REPLACE INTO AiFavoredItems	
		(ListType,						Item)
VALUES	('Leu_Herod_I_Districts',		'DISTRICT_LEU_HERODIAN_PALACE'),
		('Leu_Herod_I_Units',			'UNIT_LEU_QALLA'),
		('Leu_Herod_I_Buildings',		'BUILDING_LEU_BETH_DIN');
--==========================================================================================================================
--==========================================================================================================================

