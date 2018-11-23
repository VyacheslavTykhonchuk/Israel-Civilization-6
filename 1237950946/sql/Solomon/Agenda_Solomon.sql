--==========================================================================================================================
-- AGENDAS
--==========================================================================================================================
-- HistoricalAgendas
---------------------------------------	
INSERT INTO HistoricalAgendas	
		(LeaderType,			AgendaType)
SELECT	'LEADER_LEU_SOLOMON',	'AGENDA_LEU_SOLOMON'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

-------------------------------------
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,						Kind)
VALUES	('TRAIT_AGENDA_LEU_SOLOMON',	'KIND_TRAIT');			
-------------------------------------			
-- Agendas			
-------------------------------------				
INSERT INTO Agendas				
		(AgendaType,				Name,							Description)
VALUES	('AGENDA_LEU_SOLOMON',		'LOC_AGENDA_LEU_SOLOMON_NAME',	'LOC_AGENDA_LEU_SOLOMON_DESCRIPTION');	
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,							Name,										Description)
VALUES	('TRAIT_AGENDA_LEU_SOLOMON',		'LOC_AGENDA_LEU_SOLOMON_NAME',	'LOC_AGENDA_LEU_SOLOMON_DESCRIPTION');	
-------------------------------------			
-- AgendaTraits			
-------------------------------------				
INSERT INTO AgendaTraits				
		(AgendaType,			TraitType)
VALUES	('AGENDA_LEU_SOLOMON',	'TRAIT_AGENDA_LEU_SOLOMON');	
-------------------------------------		
-- TraitModifiers
-------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,						ModifierId)
VALUES	('TRAIT_AGENDA_LEU_SOLOMON',	'LEU_SOLOMON_FRIENDLY'),
		('TRAIT_AGENDA_LEU_SOLOMON',	'LEU_SOLOMON_PAGAN_HATER');

--==========================================================================================================================
--==========================================================================================================================
-- Friendly with Friends
-------------------------------------
INSERT INTO Modifiers	
		(ModifierId,						ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_SOLOMON_FRIENDLY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		null,						'PLAYER_DECLARED_FRIEND');

INSERT INTO ModifierArguments
		(ModifierId,						Name,							Value,													Extra,				Type)
VALUES	('LEU_SOLOMON_FRIENDLY',			'InitialValue',					12,														null,				'ARGTYPE_IDENTITY'),
		('LEU_SOLOMON_FRIENDLY',			'StatementKey',					'LOC_DIPLO_KUDO_EXIT_LEADER_LEU_SOLOMON_FRIENDLY',		null,				'ARGTYPE_IDENTITY'),
		('LEU_SOLOMON_FRIENDLY',			'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_SOLOMON_FRIENDLY',				null,				'ARGTYPE_IDENTITY'),
		('LEU_SOLOMON_FRIENDLY',			'HiddenAgenda',					0,														null,				'ARGTYPE_IDENTITY');

INSERT INTO ModifierStrings
		(ModifierId,						Context,						Text)
VALUES	('LEU_SOLOMON_FRIENDLY',			'Sample',						'LOC_DIPLO_KUDO_LEADER_LEU_FRIENDLY');

--==========================================================================================================================
--==========================================================================================================================

--==========================================================================================================================
--==========================================================================================================================
-- Pagan_Hater
-------------------------------------
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_SOLOMON_PAGAN_HATER',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		null,						'PLAYER_HAS_LOW_FAITH');

INSERT INTO ModifierArguments
		(ModifierId,					Name,							Value,														Extra,				Type)
VALUES	('LEU_SOLOMON_PAGAN_HATER',		'InitialValue',					-10,														null,				'ARGTYPE_IDENTITY'),
		('LEU_SOLOMON_PAGAN_HATER',		'StatementKey',					'LOC_DIPLO_WARNING_EXIT_LEADER_LEU_SOLOMON_PAGAN_HATER',	null,				'ARGTYPE_IDENTITY'),
		('LEU_SOLOMON_PAGAN_HATER',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_SOLOMON_PAGAN_HATER',				null,				'ARGTYPE_IDENTITY'),
		('LEU_SOLOMON_PAGAN_HATER',		'HiddenAgenda',					0,															null,				'ARGTYPE_IDENTITY');

INSERT INTO ModifierStrings
		(ModifierId,							Context,							Text)
VALUES	('LEU_SOLOMON_PAGAN_HATER',			'Sample',							'LOC_DIPLO_WARNING_LEADER_LEU_SOLOMON_PAGAN_HATER');

--==========================================================================================================================
--==========================================================================================================================

-------------------------------------			
-- ExclusiveAgendas			
-------------------------------------				
INSERT INTO ExclusiveAgendas				
		(AgendaOne,					AgendaTwo)
VALUES	('AGENDA_LEU_SOLOMON',		'AGENDA_DEVOUT');
		
--==========================================================================================================================
-- AI
--==========================================================================================================================
-- AiListTypes
-------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('Leu_Solomon_Districts'),
		('Leu_Solomon_Buildings'),
		('Leu_Solomon_Units');
-------------------------------------
-- AiLists
-------------------------------------	
INSERT INTO AiLists	
		(ListType,								AgendaType,							System)
VALUES	('Leu_Solomon_Districts',				'TRAIT_AGENDA_LEU_SOLOMON',		'Districts'),
		('Leu_Solomon_Buildings',				'TRAIT_AGENDA_LEU_SOLOMON',		'Districts'),
		('FavorReligiousVictory',				'TRAIT_AGENDA_LEU_SOLOMON',		'Strategies'),
		('GreatPersonObsessedGreatPeople',		'TRAIT_AGENDA_LEU_SOLOMON',		'PseudoYields'),
		('Leu_Solomon_Units',					'TRAIT_AGENDA_LEU_SOLOMON',		'Units');

-------------------------------------		
-- AiFavoredItems
-------------------------------------	
INSERT INTO AiFavoredItems	
		(ListType,						Item)
VALUES	('Leu_Solomon_Districts',		'DISTRICT_HOLY_SITE'),
		('Leu_Solomon_Units',			'UNIT_LEU_QALLA'),
		('Leu_Solomon_Buildings',		'BUILDING_LEU_BETH_DIN');
--==========================================================================================================================
--==========================================================================================================================

