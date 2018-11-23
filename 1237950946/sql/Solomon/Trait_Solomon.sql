--==========================================================================================================================
-- TRAIT
--==========================================================================================================================
-- LeaderTraits
-------------------------------------
INSERT INTO LeaderTraits	
		(LeaderType,				TraitType)
SELECT	'LEADER_LEU_SOLOMON',		'TRAIT_LEADER_LEU_SOLOMON'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

-------------------------------------
-- Types
-------------------------------------
INSERT INTO Types	
		(Type,												Kind)
VALUES	('TRAIT_LEADER_LEU_SOLOMON',						'KIND_TRAIT'),
		('LEU_MODIFIER_CAPITAL_CITY_GP_POINTS',				'KIND_MODIFIER'),
		('LEU_MODIFIER_CAPITAL_CITY_INSPIRATION',				'KIND_MODIFIER'),
		('LEU_MODIFIER_CAPITAL_CITY_REL_PRESSURE',				'KIND_MODIFIER');	
			
-------------------------------------
-- Traits			
-------------------------------------
INSERT INTO Traits				
		(TraitType,											Name,											Description)
VALUES	('TRAIT_LEADER_LEU_SOLOMON',						'LOC_TRAIT_LEADER_LEU_SOLOMON_NAME',			'LOC_TRAIT_LEADER_LEU_SOLOMON_DESCRIPTION');		
		
--------------------------------------------------------------------------------------------------------------------------		
-- TraitModifiers		
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,												ModifierId)
VALUES	('TRAIT_LEADER_LEU_SOLOMON',						'LEU_SOLOMON_TEMPLE_GREAT_PROPHET'),
		('TRAIT_LEADER_LEU_SOLOMON',						'LEU_SOLOMON_TEMPLE_GREAT_WRITER'),
		('TRAIT_LEADER_LEU_SOLOMON',						'LEU_SOLOMON_TEMPLE_INSPIRATION'),
		('TRAIT_LEADER_LEU_SOLOMON',						'LEU_SOLOMON_TEMPLE_ADDITIONAL_FAITH'),
		('TRAIT_LEADER_LEU_SOLOMON',						'LEU_SOLOMON_TEMPLE_PRESSURE');				
--------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO DynamicModifiers				
		(ModifierType,										CollectionType,									EffectType)
VALUES	('LEU_MODIFIER_CAPITAL_CITY_GP_POINTS',				'COLLECTION_PLAYER_CAPITAL_CITY',			'EFFECT_ADJUST_GREAT_PERSON_POINTS'),
		('LEU_MODIFIER_CAPITAL_CITY_INSPIRATION',				'COLLECTION_PLAYER_CAPITAL_CITY',			'EFFECT_GRANT_RANDOM_CIVIC_BOOST_BY_ERA'),
		('LEU_MODIFIER_CAPITAL_CITY_REL_PRESSURE',				'COLLECTION_PLAYER_CAPITAL_CITY',			'EFFECT_ADJUST_RELIGIOUS_SPREAD_STRENGTH');		
		
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,												ModifierType,										Permanent,		OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_SOLOMON_TEMPLE_GREAT_PROPHET',					'LEU_MODIFIER_CAPITAL_CITY_GP_POINTS',					0,				null,						'LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET'), 
		('LEU_SOLOMON_TEMPLE_GREAT_WRITER',					'LEU_MODIFIER_CAPITAL_CITY_GP_POINTS',						0,				null,						'LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET'),
		('LEU_SOLOMON_TEMPLE_INSPIRATION',				'LEU_MODIFIER_CAPITAL_CITY_INSPIRATION',						0,				null,						'LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET'),
		('LEU_SOLOMON_TEMPLE_ADDITIONAL_FAITH',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		0,				null,						'LEU_SOLOMON_CITY_IS_CAPITAL_REQSET'),
		('LEU_SOLOMON_TEMPLE_PRESSURE',				'LEU_MODIFIER_CAPITAL_CITY_REL_PRESSURE',							0,				null,						'LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET');
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,												Name,													Value)
VALUES	('LEU_SOLOMON_TEMPLE_INSPIRATION',					'StartEraType',											'ERA_CLASSICAL'),
		('LEU_SOLOMON_TEMPLE_INSPIRATION',					'EndEraType',											'ERA_MEDIEVAL'),
		('LEU_SOLOMON_TEMPLE_INSPIRATION',					'Amount',												2),
		('LEU_SOLOMON_TEMPLE_GREAT_PROPHET',				'Amount',												3),
		('LEU_SOLOMON_TEMPLE_GREAT_WRITER',					'GreatPersonClassType',									'GREAT_PERSON_CLASS_WRITER'),
		('LEU_SOLOMON_TEMPLE_GREAT_WRITER',					'Amount',												3),
		('LEU_SOLOMON_TEMPLE_ADDITIONAL_FAITH',				'BuildingType',											'BUILDING_TEMPLE'),
		('LEU_SOLOMON_TEMPLE_ADDITIONAL_FAITH',				'YieldType',											'YIELD_FAITH'),
		('LEU_SOLOMON_TEMPLE_ADDITIONAL_FAITH',				'Amount',												3),
		('LEU_SOLOMON_TEMPLE_PRESSURE',				'SpreadMultiplier',											50);

INSERT OR REPLACE INTO ModifierStrings
		(ModifierId,							Context,		Text)
VALUES ('LEU_SOLOMON_TEMPLE_INSPIRATION',		'Summary',		'LOC_TRAIT_LEU_TEMPLE_INSPIRATION');


--------------------------------------------------------------------------------------------------------------------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
		(RequirementId,									Inverse,			RequirementType)
VALUES	('LEU_SOLOMON_CITY_HAS_TEMPLE_REQ',		0,					'REQUIREMENT_CITY_HAS_BUILDING'),
		('LEU_SOLOMON_CITY_IS_CAPITAL_REQ',		0,					'REQUIREMENT_CITY_IS_ORIGINAL_CAPITAL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,									Name,				Value)
VALUES	('LEU_SOLOMON_CITY_HAS_TEMPLE_REQ',		'BuildingType',		'BUILDING_TEMPLE');	
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET',	'REQUIREMENTSET_TEST_ALL'),
		('LEU_SOLOMON_CITY_HAS_TEMPLE_AND_RELIGION_REQSET',	'REQUIREMENTSET_TEST_ALL'),
		('LEU_SOLOMON_CITY_IS_CAPITAL_REQSET',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET',	'LEU_SOLOMON_CITY_HAS_TEMPLE_REQ'),
		('LEU_SOLOMON_CITY_HAS_TEMPLE_REQSET',	'LEU_SOLOMON_CITY_IS_CAPITAL_REQ'),
		('LEU_SOLOMON_CITY_IS_CAPITAL_REQSET',	'LEU_SOLOMON_CITY_IS_CAPITAL_REQ'),
		('LEU_SOLOMON_CITY_HAS_TEMPLE_AND_RELIGION_REQSET',	'LEU_SOLOMON_CITY_HAS_TEMPLE_REQ'),
		('LEU_SOLOMON_CITY_HAS_TEMPLE_AND_RELIGION_REQSET',	'LEU_SOLOMON_CITY_IS_CAPITAL_REQ'),
		('LEU_SOLOMON_CITY_HAS_TEMPLE_AND_RELIGION_REQSET',	'REQUIRES_CITY_FOLLOWS_RELIGION');

--==========================================================================================================================
--==========================================================================================================================
