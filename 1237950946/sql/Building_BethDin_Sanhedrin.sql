--==========================================================================================================================
-- BUILDINGS: TRAITS
--==========================================================================================================================	
-- Types			
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,												Kind)
VALUES	('TRAIT_CIVILIZATION_BUILDING_LEU_BETH_DIN',		'KIND_TRAIT');
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits				
		(TraitType,											Name,										Description)
VALUES	('TRAIT_CIVILIZATION_BUILDING_LEU_BETH_DIN',		'LOC_BUILDING_LEU_BETH_DIN_NAME',			null);	

-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(TraitType,										CivilizationType)
VALUES	('TRAIT_CIVILIZATION_BUILDING_LEU_BETH_DIN',	'CIVILIZATION_LEU_ISRAEL');

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,							Kind)
VALUES	('BUILDING_LEU_BETH_DIN',		'KIND_BUILDING'),
		('BUILDING_LEU_SANHEDRIN',		'KIND_BUILDING');		
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings	
		(BuildingType,						Name,									Description,									EnabledByReligion,		PrereqDistrict,				PurchaseYield,		Cost,		AdvisorType,			Maintenance, CitizenSlots,  TraitType,										InternalOnly,		MustPurchase)
VALUES  ('BUILDING_LEU_BETH_DIN',			'LOC_BUILDING_LEU_BETH_DIN_NAME',		'LOC_BUILDING_LEU_BETH_DIN_DESCRIPTION',		0,						'DISTRICT_CITY_CENTER',		'YIELD_GOLD',		60,			'ADVISOR_RELIGIOUS',	0, 			 0,  			'TRAIT_CIVILIZATION_BUILDING_LEU_BETH_DIN',		0,					0),
		('BUILDING_LEU_SANHEDRIN',			'LOC_BUILDING_LEU_SANHEDRIN_NAME',		'LOC_BUILDING_LEU_SANHEDRIN_DESCRIPTION',		1,						'DISTRICT_CITY_CENTER',		'YIELD_CULTURE',	100000,		null,					0, 			 0,  			null,											1,					1);		
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges	
		(BuildingType,					YieldType,					YieldChange)
VALUES	('BUILDING_LEU_BETH_DIN',		'YIELD_CULTURE', 			1),
		('BUILDING_LEU_SANHEDRIN',		'YIELD_CULTURE', 			3);
--------------------------------------------------------------------------------------------------------------------------
-- Building_GreatPersonPoints
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_GreatPersonPoints	
		(BuildingType,					GreatPersonClassType,				PointsPerTurn)
VALUES	('BUILDING_LEU_BETH_DIN',		'GREAT_PERSON_CLASS_WRITER', 		1),
		('BUILDING_LEU_SANHEDRIN',		'GREAT_PERSON_CLASS_WRITER', 		3);
--------------------------------------------------------------------------------------------------------------------------
-- Building_GreatWorks
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_GreatWorks	
		(BuildingType,						GreatWorkSlotType,					NumSlots)
VALUES	('BUILDING_LEU_SANHEDRIN',			'GREATWORKSLOT_WRITING', 			1);	

--------------------------------------------------------------------------------------------------------------------------
-- BuildingReplaces
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingReplaces	
		(CivUniqueBuildingType,				ReplacesBuildingType)
VALUES	('BUILDING_LEU_BETH_DIN',			'BUILDING_MONUMENT');	

--------------------------------------------------------------------------------------------------------------------------
-- MutuallyExclusiveBuildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO MutuallyExclusiveBuildings	
		(Building,							MutuallyExclusiveBuilding)
VALUES	('BUILDING_LEU_BETH_DIN',			'BUILDING_LEU_SANHEDRIN'),
		('BUILDING_MONUMENT',			'BUILDING_LEU_SANHEDRIN');	

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
		(Building,					MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,		'BUILDING_LEU_SANHEDRIN'
FROM BuildingReplaces WHERE ReplacesBuildingType = 'BUILDING_MONUMENT';

-------------------------------------			
-- Compatibility Triggers
-------------------------------------		

CREATE TRIGGER Leu_Israel_Exclusive_Sanhedrin
AFTER INSERT ON BuildingReplaces
WHEN ReplacesBuildingType = 'BUILDING_MONUMENT'
BEGIN
-----
	INSERT INTO MutuallyExclusiveBuildings	
			(Building,							MutuallyExclusiveBuilding)
	VALUES	(NEW.CivUniqueBuildingType,			'BUILDING_LEU_SANHEDRIN');
-----
END;