--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,										Kind)
VALUES	('TRAIT_CIVILIZATION_UNIT_LEU_QALLA',		'KIND_TRAIT'),
		('UNIT_LEU_QALLA',						'KIND_UNIT');
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,									Name,							Description)
VALUES	('TRAIT_CIVILIZATION_UNIT_LEU_QALLA',		'LOC_UNIT_LEU_QALLA_NAME',		'LOC_UNIT_LEU_QALLA_DESCRIPTION');

--------------------------------------------------------------------------------------------------------------------------		
-- TraitModifiers		
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,								ModifierId)
VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',	'TRAIT_LEU_QALLA_FAITH_PURCHASE_ATTACH'),
		('TRAIT_CIVILIZATION_LEU_ISRAEL',	'TRAIT_LEU_QALLA_PURCHASE_COST');								
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,								ModifierType,												SubjectRequirementSetId)
VALUES	('TRAIT_LEU_QALLA_FAITH_PURCHASE',			'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',					null),
		('TRAIT_LEU_QALLA_FAITH_PURCHASE_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					null),
		('TRAIT_LEU_QALLA_PURCHASE_COST',			'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',					null);
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('TRAIT_LEU_QALLA_FAITH_PURCHASE',				'Tag',			'CLASS_LEU_QALLA'),
		('TRAIT_LEU_QALLA_FAITH_PURCHASE_ATTACH',		'ModifierId',	'TRAIT_LEU_QALLA_FAITH_PURCHASE'),
		('TRAIT_LEU_QALLA_PURCHASE_COST',				'UnitType',		'UNIT_LEU_QALLA'),
		('TRAIT_LEU_QALLA_PURCHASE_COST',				'Amount',		35);

-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(TraitType,										CivilizationType)
VALUES	('TRAIT_CIVILIZATION_UNIT_LEU_QALLA',			'CIVILIZATION_LEU_ISRAEL');

-----------------------------------------------------------------------------------
-- Units
-----------------------------------------------------------------------------------	
INSERT INTO Units	
		(UnitType,				BaseMoves, 	 Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, Name,								Description,					 		MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, Combat, PrereqTech, TraitType,								Range,	RangedCombat)
SELECT  'UNIT_LEU_QALLA',		BaseMoves, 	 Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, 'LOC_UNIT_LEU_QALLA_NAME',			'LOC_UNIT_LEU_QALLA_DESCRIPTION', 		MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, Combat, PrereqTech, 'TRAIT_CIVILIZATION_UNIT_LEU_QALLA',		Range,	RangedCombat
FROM Units WHERE UnitType = 'UNIT_SLINGER';
-----------------------------------------------------------------------------------
-- UnitReplaces
-----------------------------------------------------------------------------------	
INSERT INTO UnitReplaces	
		(CivUniqueUnitType,		ReplacesUnitType)
VALUES	('UNIT_LEU_QALLA',		'UNIT_SLINGER');	
-----------------------------------------------------------------------------------
-- UnitUpgrades
-----------------------------------------------------------------------------------	
INSERT INTO UnitUpgrades	
		(Unit,					UpgradeUnit)
SELECT  'UNIT_LEU_QALLA',		UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_SLINGER'; 	
-----------------------------------------------------------------------------------
-- UnitAIInfos
-----------------------------------------------------------------------------------	
INSERT INTO UnitAIInfos	
		(UnitType,				AiType)
SELECT  'UNIT_LEU_QALLA',		AiType
FROM UnitAIInfos WHERE UnitType = 'UNIT_SLINGER'; 
-----------------------------------------------------------------------------------
-- Tags
-----------------------------------------------------------------------------------	
INSERT INTO Tags	
		(Tag,					Vocabulary)
VALUES	('CLASS_LEU_QALLA',		'ABILITY_CLASS');	
-----------------------------------------------------------------------------------
-- TypeTags
-----------------------------------------------------------------------------------	
INSERT INTO TypeTags	
		(Type,					Tag)
SELECT  'UNIT_LEU_QALLA',		Tag
FROM TypeTags WHERE Type = 'UNIT_SLINGER';

INSERT INTO TypeTags	
		(Type,					Tag)
VALUES	('UNIT_LEU_QALLA',		'CLASS_LEU_QALLA');	
--==========================================================================================================================
-- UNITS: ABILITIES
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('ABILITY_LEU_QALLA',					'KIND_ABILITY');	
-----------------------------------------------------------------------------------
-- TypeTags
-----------------------------------------------------------------------------------	
INSERT INTO TypeTags	
		(Type,									Tag)
VALUES	('ABILITY_LEU_QALLA',					'CLASS_LEU_QALLA');	
-----------------------------------------------------------------------------------
-- UnitAbilities
-----------------------------------------------------------------------------------	
INSERT INTO UnitAbilities	
		(UnitAbilityType,						Name,											Inactive,	Description)
VALUES	('ABILITY_LEU_QALLA',					'LOC_ABILITY_LEU_QALLA_NAME',					0,			'LOC_ABILITY_LEU_QALLA_DESCRIPTION');	
-----------------------------------------------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------------------------------------------	
INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_LEU_QALLA',					'LEU_QALLA_GREAT_PROPHET'),
		('ABILITY_LEU_QALLA',					'LEU_QALLA_DAVID_GOLIATH');	
-----------------------------------------------------------------------------------
-- Modifiers
-----------------------------------------------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,													SubjectRequirementSetId)
VALUES	('LEU_QALLA_FAITH_KILL',				'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD',						null),
		('LEU_QALLA_DAVID_GOLIATH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',							'LEU_OPPONENT_IS_MELEE_BARBARIAN'),
		('LEU_QALLA_GREAT_PROPHET',				'MODIFIER_PLAYER_UNIT_ADJUST_GREAT_PEOPLE_POINTS_PER_KILL',		null);

INSERT INTO ModifierStrings
		(ModifierId, Context, Text)
VALUES ('LEU_QALLA_DAVID_GOLIATH',		'Preview',		'LOC_ABILITY_QALLA_DESCRIPTION');

-----------------------------------------------------------------------------------	
-- ModifierArguments		
-----------------------------------------------------------------------------------	
INSERT INTO ModifierArguments		
		(ModifierId,							Name,						Value)
VALUES	('LEU_QALLA_DAVID_GOLIATH',				'Amount',					7),
		('LEU_QALLA_FAITH_KILL',				'YieldType',				'YIELD_FAITH'),
		('LEU_QALLA_FAITH_KILL',				'PercentDefeatedStrength',	50),
		('LEU_QALLA_GREAT_PROPHET',				'GreatPersonClassType',		'GREAT_PERSON_CLASS_PROPHET'),
		('LEU_QALLA_GREAT_PROPHET',				'Amount',					5);

--------------------------------------------------------------------------------------------------------------------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
		(RequirementId,						Inverse,			RequirementType)
VALUES	('LEU_MELEE_UNITS_REQ',				0,					'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES'),
		('LEU_RECON_UNITS_REQ',				0,					'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES'),
		('LEU_ANTICAVALRY_UNITS_REQ',		0,					'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES'),
		('LEU_MELEE_REQSET',				0,					'REQUIREMENT_REQUIREMENTSET_IS_MET');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,								Name,							Value)
VALUES	('LEU_MELEE_REQSET',						'RequirementSetId',			'LEU_OPPONENT_IS_MELEE_VARIATIONS'),
		('LEU_MELEE_UNITS_REQ',						'Tag',		'CLASS_MELEE'),
		('LEU_ANTICAVALRY_UNITS_REQ',				'Tag',		'CLASS_ANTY_CAVALRY'),
		('LEU_RECON_UNITS_REQ',						'Tag',		'CLASS_RECON');	
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('LEU_OPPONENT_IS_MELEE_BARBARIAN',				'REQUIREMENTSET_TEST_ALL'),
		('LEU_OPPONENT_IS_MELEE_VARIATIONS',			'REQUIREMENTSET_TEST_ANY');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('LEU_OPPONENT_IS_MELEE_BARBARIAN',				'REQUIRES_OPPONENT_IS_BARBARIAN'),
		('LEU_OPPONENT_IS_MELEE_VARIATIONS',			'LEU_MELEE_UNITS_REQ'),
		('LEU_OPPONENT_IS_MELEE_VARIATIONS',			'LEU_ANTICAVALRY_UNITS_REQ'),
		('LEU_OPPONENT_IS_MELEE_VARIATIONS',			'LEU_RECON_UNITS_REQ');


--==========================================================================================================================
--==========================================================================================================================