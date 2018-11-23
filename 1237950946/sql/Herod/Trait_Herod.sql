--==========================================================================================================================
-- TRAIT
--==========================================================================================================================
-- LeaderTraits
-------------------------------------
INSERT INTO LeaderTraits	
		(LeaderType,				TraitType)
SELECT	'LEADER_LEU_HEROD',		'TRAIT_LEADER_LEU_HEROD'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

-------------------------------------
-- Types
-------------------------------------
INSERT INTO Types	
		(Type,											Kind)
VALUES	('TRAIT_LEADER_LEU_HEROD',						'KIND_TRAIT'),
		('LEU_MODIFIER_DISTRICTS_ATTACH_MODIFIER',		'KIND_MODIFIER'),
		('LEU_MODIFIER_SINGLE_CITY_WONDERS',			'KIND_MODIFIER'),
		('LEU_MODIFIER_DISTRICTS_AMENITIES',			'KIND_MODIFIER');
			
-------------------------------------
-- Traits			
-------------------------------------
INSERT INTO Traits				
		(TraitType,											Name,											Description)
VALUES	('TRAIT_LEADER_LEU_HEROD',						'LOC_TRAIT_LEADER_LEU_HEROD_NAME',			'LOC_TRAIT_LEADER_LEU_HEROD_DESCRIPTION');		
		
--------------------------------------------------------------------------------------------------------------------------		
-- TraitModifiers		
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,										ModifierId)
VALUES	('TRAIT_LEADER_LEU_HEROD',						'LEU_HEROD_HOLY_SITE_WONDERS'),
		('TRAIT_LEADER_LEU_HEROD',						'LEU_HEROD_AQUEDUCT_WONDERS'),
		('TRAIT_LEADER_LEU_HEROD',						'LEU_HEROD_WONDER_AMMENITIES');
						
--------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO DynamicModifiers				
		(ModifierType,										CollectionType,								EffectType)
VALUES	('LEU_MODIFIER_SINGLE_CITY_WONDERS',				'COLLECTION_OWNER',							'EFFECT_ADJUST_WONDER_PRODUCTION'),
		('LEU_MODIFIER_DISTRICTS_ATTACH_MODIFIER',			'COLLECTION_PLAYER_DISTRICTS',				'EFFECT_ATTACH_MODIFIER'),
		('LEU_MODIFIER_DISTRICTS_AMENITIES',				'COLLECTION_PLAYER_DISTRICTS',				'EFFECT_ADJUST_CITY_AMENITIES_FROM_RELIGION');		
		
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,									ModifierType,											SubjectRequirementSetId)
VALUES	('LEU_HEROD_HOLY_SITE_WONDERS',					'LEU_MODIFIER_DISTRICTS_ATTACH_MODIFIER',				'DISTRICT_IS_HOLY_SITE'),
		('LEU_HEROD_AQUEDUCT_WONDERS',					'LEU_MODIFIER_DISTRICTS_ATTACH_MODIFIER',				'LEU_DISTRICT_IS_AQUEDUCT'),
		('LEU_HEROD_CITY_WONDERS',						'LEU_MODIFIER_SINGLE_CITY_WONDERS',						null),
		('LEU_HEROD_WONDER_AMMENITIES',					'LEU_MODIFIER_DISTRICTS_AMENITIES',						'LEU_DISTRICT_IS_WONDER');
		 
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,										Name,						Value)
VALUES	('LEU_HEROD_CITY_WONDERS',							'Amount',					5),
		('LEU_HEROD_HOLY_SITE_WONDERS',						'ModifierId',				'LEU_HEROD_CITY_WONDERS'),
		('LEU_HEROD_AQUEDUCT_WONDERS',						'ModifierId',				'LEU_HEROD_CITY_WONDERS'),
		('LEU_HEROD_WONDER_AMMENITIES',						'Amount',					1);

--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('LEU_DISTRICT_IS_AQUEDUCT',				'REQUIREMENTSET_TEST_ALL'),
		('LEU_DISTRICT_IS_WONDER',					'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('LEU_DISTRICT_IS_AQUEDUCT',					'LEUQUIRES_DISTRICT_IS_AQUEDUCT'),
		('LEU_DISTRICT_IS_WONDER',						'LEUQUIRES_DISTRICT_IS_WORLD_WONDER'),
		('LEU_DISTRICT_IS_WONDER',						'REQUIRES_PLOT_ADJACENT_HOLY_SITE');

INSERT OR REPLACE INTO Requirements
		(RequirementId,							RequirementType)
VALUES	('LEUQUIRES_DISTRICT_IS_AQUEDUCT',		'REQUIREMENT_DISTRICT_TYPE_MATCHES'),
		('LEUQUIRES_DISTRICT_IS_WORLD_WONDER',		'REQUIREMENT_DISTRICT_TYPE_MATCHES');

INSERT OR REPLACE INTO RequirementArguments
		(RequirementId,							Name,				Value)
VALUES	('LEUQUIRES_DISTRICT_IS_AQUEDUCT',		'DistrictType',		'DISTRICT_AQUEDUCT'),
		('LEUQUIRES_DISTRICT_IS_WORLD_WONDER',	'DistrictType',		'DISTRICT_WONDER');
--==========================================================================================================================
--==========================================================================================================================
