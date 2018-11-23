--==========================================================================================================================
-- CIVILIZATION TRAITS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT OR REPLACE INTO Types	
		(Type,								Kind)
VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',	'KIND_TRAIT');

-------------------------------------			
-- Traits			
-------------------------------------		
INSERT OR REPLACE INTO Traits				
		(TraitType,												Name,															Description)
VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',			'LOC_TRAIT_CIVILIZATION_LEU_ISRAEL_NAME',			'LOC_TRAIT_CIVILIZATION_LEU_ISRAEL_DESCRIPTION');	
		
-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT OR REPLACE INTO CivilizationTraits	
		(TraitType,									CivilizationType)
VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',			'CIVILIZATION_LEU_ISRAEL');

-------------------------------------			
-- TraitModifiers
-------------------------------------					
INSERT OR REPLACE INTO TraitModifiers			
		(TraitType,										ModifierId)
VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',				'LEU_ISRAEL_GW_FAITH'),
		('TRAIT_CIVILIZATION_LEU_ISRAEL',				'LEU_ISRAEL_GW_PRODUCTION'),
		('TRAIT_CIVILIZATION_LEU_ISRAEL',				'LEU_ISRAEL_GWSLOT_TEMPLE');				

INSERT OR REPLACE INTO TraitModifiers
		(TraitType,										ModifierId)
SELECT	'TRAIT_CIVILIZATION_LEU_ISRAEL',				'LEU_ISRAEL_GW_SLOT_'||BuildingType
FROM Buildings WHERE EnabledByReligion = 1 AND PurchaseYield = 'YIELD_FAITH';

INSERT OR REPLACE INTO TraitModifiers
		(TraitType,										ModifierId)
SELECT	'TRAIT_CIVILIZATION_LEU_ISRAEL',				'LEU_ISRAEL_PRODUCTION_'||BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE';


-------------------------------------			
-- Modifiers
-------------------------------------		
INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType)
VALUES	('LEU_ISRAEL_GW_FAITH',					'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD'),
		('LEU_ISRAEL_GW_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD'),
		('LEU_ISRAEL_GWSLOT_TEMPLE',			'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS');

INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType)
SELECT	'LEU_ISRAEL_GW_SLOT_'||BuildingType,		'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS'
FROM Buildings WHERE EnabledByReligion = 1 AND PurchaseYield = 'YIELD_FAITH';

INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType)
SELECT	'LEU_ISRAEL_PRODUCTION_'||BuildingType,		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE';

-------------------------------------			
-- ModifierArguments
-------------------------------------			
INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
VALUES	('LEU_ISRAEL_GW_FAITH',					'GreatWorkObjectType',		'GREATWORKOBJECT_WRITING'),
		('LEU_ISRAEL_GW_FAITH',					'YieldType',				'YIELD_FAITH'),
		('LEU_ISRAEL_GW_FAITH',					'YieldChange',					4),
		('LEU_ISRAEL_GW_PRODUCTION',			'GreatWorkObjectType',		'GREATWORKOBJECT_WRITING'),
		('LEU_ISRAEL_GW_PRODUCTION',			'YieldType',				'YIELD_FOOD'),
		('LEU_ISRAEL_GW_PRODUCTION',			'YieldChange',					1),
		('LEU_ISRAEL_GWSLOT_TEMPLE',			'GreatWorkSlotType',		'GREATWORKSLOT_WRITING'),
		('LEU_ISRAEL_GWSLOT_TEMPLE',			'Amount',					1),
		('LEU_ISRAEL_GWSLOT_TEMPLE',			'BuildingType',				'BUILDING_TEMPLE');

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
SELECT	'LEU_ISRAEL_GW_SLOT_'||BuildingType,	'GreatWorkSlotType',		'GREATWORKSLOT_WRITING'
FROM Buildings WHERE EnabledByReligion = 1 AND PurchaseYield = 'YIELD_FAITH';

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
SELECT	'LEU_ISRAEL_GW_SLOT_'||BuildingType,	'Amount',					1
FROM Buildings WHERE EnabledByReligion = 1 AND PurchaseYield = 'YIELD_FAITH';

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
SELECT	'LEU_ISRAEL_GW_SLOT_'||BuildingType,	'BuildingType',				BuildingType
FROM Buildings WHERE EnabledByReligion = 1 AND PurchaseYield = 'YIELD_FAITH';


INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
SELECT	'LEU_ISRAEL_PRODUCTION_'||BuildingType,	'BuildingType',				BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE';

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
SELECT	'LEU_ISRAEL_PRODUCTION_'||BuildingType,	'Amount',				20
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE';

--------------

-----------------------			
-- Compatibility Triggers
-------------------------------------		


CREATE TRIGGER Leu_Israel_Religious_Slot
AFTER INSERT ON Buildings
WHEN NEW.EnabledByReligion = 1 AND NEW.PurchaseYield = 'YIELD_FAITH'
BEGIN
-----
	INSERT INTO TraitModifiers
			(TraitType,									ModifierId)
	VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',			'LEU_ISRAEL_GWSLOT_'||NEW.BuildingType);

	INSERT INTO Modifiers	
			(ModifierId,								ModifierType)
	VALUES	('LEU_ISRAEL_GWSLOT_'||NEW.BuildingType,	'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS');
	
	INSERT INTO ModifierArguments
			(ModifierId,								Name,						Value)
	VALUES	('LEU_ISRAEL_GWSLOT_'||NEW.BuildingType,	'GreatWorkSlotType',		'GREATWORKSLOT_WRITING'),
			('LEU_ISRAEL_GWSLOT_'||NEW.BuildingType,	'Amount',					1),
			('LEU_ISRAEL_GWSLOT_'||NEW.BuildingType,	'BuildingType',				NEW.BuildingType);
-----
END;



CREATE TRIGGER Leu_Israel_Religious_Buildings
AFTER INSERT ON Buildings
WHEN NEW.PrereqDistrict = 'DISTRICT_HOLY_SITE'
BEGIN
-----
	INSERT INTO TraitModifiers
			(TraitType,									ModifierId)
	VALUES	('TRAIT_CIVILIZATION_LEU_ISRAEL',			'LEU_ISRAEL_PRODUCTION_'||NEW.BuildingType);

	INSERT INTO Modifiers	
			(ModifierId,								ModifierType)
	VALUES	('LEU_ISRAEL_PRODUCTION_'||NEW.BuildingType,	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
	
	INSERT INTO ModifierArguments
			(ModifierId,								Name,						Value)
	VALUES	('LEU_ISRAEL_PRODUCTION_'||NEW.BuildingType,	'BuildingType',		NEW.BuildingType),
			('LEU_ISRAEL_PRODUCTION_'||NEW.BuildingType,	'Amount',					20);
-----
END;


--==========================================================================================================================
--==========================================================================================================================