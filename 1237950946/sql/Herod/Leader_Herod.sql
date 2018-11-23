--==========================================================================================================================
-- LEADER
--==========================================================================================================================
-- CivilizationLeaders
-------------------------------------		
INSERT INTO CivilizationLeaders	
		(CivilizationType,				LeaderType,						CapitalName)
SELECT	'CIVILIZATION_LEU_ISRAEL',		'LEADER_LEU_HEROD',			'LOC_CITY_NAME_LEU_ISRAEL_01'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		


-------------------------------------
-- LoadingInfo
-------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,				ForegroundImage,						PlayDawnOfManAudio,		BackgroundImage)
SELECT	'LEADER_LEU_HEROD',		'LEADER_LEU_HEROD_NEUTRAL.dds',		0,						'LEADER_VICTORIA_BACKGROUND.dds'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

--==========================================================================================================================
-- DIPLOMACY INFOfav
--==========================================================================================================================
-- DiplomacyInfo
-------------------------------------	
-- INSERT INTO DiplomacyInfo	
-- 			(Type,						BackgroundImage)
-- VALUES	('LEADER_LEU_HEROD',		'FALLBACK_NEUTRAL_LEU_HEROD.dds');
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- PlayerColors
-------------------------------------	
INSERT INTO PlayerColors	
		(Type,					Usage,			PrimaryColor, 									SecondaryColor,								TextColor)
SELECT	'LEADER_LEU_HEROD',	'Unique',		'COLOR_PLAYER_LEUGI_LEU_HEROD_BACKGROUND',		'COLOR_PLAYER_LEUGI_LEU_HEROD_FOREGROUND', 	'COLOR_PLAYER_WHITE_TEXT'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

INSERT INTO Colors 
		(Type, 											Color)
VALUES	('COLOR_PLAYER_LEUGI_LEU_HEROD_BACKGROUND', 	'82,38,87,255'),
		('COLOR_PLAYER_LEUGI_LEU_HEROD_FOREGROUND', 	'143,159,201,255');		

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,					Kind)
SELECT	'LEADER_LEU_HEROD',		'KIND_LEADER'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

-------------------------------------
-- Leaders
-------------------------------------	
INSERT INTO Leaders	
		(LeaderType,				Name,								InheritFrom,		SceneLayers)
SELECT	'LEADER_LEU_HEROD',		'LOC_LEADER_LEU_HEROD_NAME',		'LEADER_DEFAULT',	3
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

-------------------------------------
-- LeaderQuotes
-------------------------------------
INSERT INTO LeaderQuotes	
		(LeaderType,				Quote)
SELECT	'LEADER_LEU_HEROD',		'LOC_PEDIA_LEADERS_PAGE_LEADER_LEU_HEROD_QUOTE'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

-------------------------------------
-- FavoredReligions
-------------------------------------
INSERT OR REPLACE INTO FavoredReligions	
		(LeaderType,				ReligionType)
SELECT	'LEADER_LEU_HEROD',		'RELIGION_JUDAISM'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_HEROD' AND Value = 1);		

--==========================================================================================================================
--==========================================================================================================================