--==========================================================================================================================
-- Districts
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,												Kind)
VALUES	('TRAIT_LEADER_DISTRICT_LEU_HERODIAN_PALACE',		'KIND_TRAIT');
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,									Name,							Description)
VALUES	('TRAIT_LEADER_DISTRICT_LEU_HERODIAN_PALACE',		'LOC_DISTRICT_LEU_HERODIAN_PALACE_NAME',		'LOC_DISTRICT_LEU_HERODIAN_PALACE_DESCRIPTION');

-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO LeaderTraits	
		(TraitType,										LeaderType)
SELECT	'TRAIT_LEADER_DISTRICT_LEU_HERODIAN_PALACE',			'LEADER_LEU_HEROD'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

------------------------------------------------------------------------------------
-- Types
-----------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,										Kind)
VALUES	('DISTRICT_LEU_HERODIAN_PALACE',			'KIND_DISTRICT'),
		('PROJECT_LEU_HEROD_TRIBUTES',				'KIND_PROJECT');
-----------------------------------------------------------------------------------
-- Districts
-----------------------------------------------------------------------------------
INSERT INTO Districts
			(DistrictType,						Name,										Description,										TraitType,											Cost,	CostProgressionModel,				CostProgressionParam1,			PrereqTech,			PlunderType,		PlunderAmount,		RequiresPlacement,	Housing,		OnePerCity,		AdvisorType,			NoAdjacentCity,		Coast,	RequiresPopulation,	CityCenter,	Aqueduct,	InternalOnly,	ZOC,	FreeEmbark,		HitPoints,		CaptureRemovesCityDefenses,	TradeEmbark,	MilitaryDomain,		Appeal,		Entertainment,	AllowsHolyCity,	Maintenance,	AirSlots,	TravelTime,	CityStrengthModifier,	AdjacentToLand,		CanAttack,	CaptureRemovesDistrict,		CaptureRemovesBuildings)
VALUES		('DISTRICT_LEU_HERODIAN_PALACE',	'LOC_DISTRICT_LEU_HERODIAN_PALACE_NAME',	'LOC_DISTRICT_LEU_HERODIAN_PALACE_DESCRIPTION',		'TRAIT_LEADER_DISTRICT_LEU_HERODIAN_PALACE',		27,		'COST_PROGRESSION_GAME_PROGRESS',	1000,							'TECH_ENGINEERING',	'PLUNDER_GOLD',		75,					1,					1,				1,				'ADVISOR_GENERIC',		0,					0,		0,					0,			0,			0,				1,		0,				0,				0,							0,				'NO_DOMAIN',		1,			0,				1,				0,				0,			-1,			2,						0,					0,			0,							0);

-----------------------------------------------------------------------------------
-- District_GreatPersonPoints
-----------------------------------------------------------------------------------
--INSERT INTO District_GreatPersonPoints
--			(DistrictType,						GreatPersonClassType,				PointsPerTurn)
--VALUES 		('DISTRICT_LEU_HERODIAN_PALACE',	'GREAT_PERSON_CLASS_ENGINEER',		1);
-----------------------------------------------------------------------------------
-- District_TradeRouteYields
-----------------------------------------------------------------------------------
INSERT INTO District_TradeRouteYields
			(DistrictType,						YieldType,			YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
VALUES 		('DISTRICT_LEU_HERODIAN_PALACE',	'YIELD_GOLD',		1.0,					1.0,								1.0);

-----------------------------------------------------------------------------------
-- District_Adjacencies
-----------------------------------------------------------------------------------
INSERT INTO District_Adjacencies
			(DistrictType,							YieldChangeId)
VALUES 		('DISTRICT_LEU_HERODIAN_PALACE',		'Herodian_Adj_Holysites'),
			('DISTRICT_LEU_HERODIAN_PALACE',		'Herodian_Adj_Wonders');
-----------------------------------------------------------------------------------
-- Adjacency_YieldChanges
-----------------------------------------------------------------------------------
INSERT INTO Adjacency_YieldChanges
		(ID,							Description,						YieldType,			YieldChange,		TilesRequired,	AdjacentWonder,		AdjacentDistrict)
VALUES	('Herodian_Adj_Wonders',		'LOC_HERODIAN_PALACE_WONDER_ADJ',	'YIELD_GOLD',		2,					1,				1,					null),
		('Herodian_Adj_Holysites',		'LOC_HERODIAN_PALACE_HOLY_ADJ',		'YIELD_GOLD',		1,					1,				0,					'DISTRICT_HOLY_SITE');

-----------------------------------------------------------------------------------
-- District_CitizenYieldChanges
-----------------------------------------------------------------------------------
INSERT INTO District_CitizenYieldChanges
			(DistrictType,						YieldType,			YieldChange)
VALUES 		('DISTRICT_LEU_HERODIAN_PALACE',	'YIELD_GOLD',		4);

--==========================================================================================================================
-- Projects
--==========================================================================================================================
INSERT INTO Projects
		(ProjectType,						Name,										ShortName,										Description,										Cost,		CostProgressionModel,				CostProgressionParam1,		PrereqDistrict,						AmenitiesWhileActive,	AdvisorType)	
VALUES	('PROJECT_LEU_HEROD_TRIBUTES',		'LOC_PROJECT_LEU_HEROD_TRIBUTES_NAME',		'LOC_PROJECT_LEU_HEROD_TRIBUTES_SHORT_NAME',	'LOC_PROJECT_LEU_HEROD_TRIBUTES_DESCRIPTION',		35,			'COST_PROGRESSION_GAME_PROGRESS',	1500,						'DISTRICT_LEU_HERODIAN_PALACE',		-5,						'ADVISOR_CONQUEST');		

INSERT INTO Project_YieldConversions
		(ProjectType,						YieldType,				PercentOfProductionRate)
VALUES	('PROJECT_LEU_HEROD_TRIBUTES',		'YIELD_GOLD',			50);

INSERT INTO Project_GreatPersonPoints
		(ProjectType,						GreatPersonClassType,				Points,				PointProgressionModel,				PointProgressionParam1)
VALUES	('PROJECT_LEU_HEROD_TRIBUTES',		'GREAT_PERSON_CLASS_ENGINEER',		5,					'COST_PROGRESSION_GAME_PROGRESS',	800);

--==========================================================================================================================
--==========================================================================================================================