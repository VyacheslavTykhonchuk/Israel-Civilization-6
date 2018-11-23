--==========================================================================================================================
-- LEADER
--==========================================================================================================================
-- CivilizationLeaders
-------------------------------------		
INSERT INTO CivilizationLeaders	
		(CivilizationType,				LeaderType,						CapitalName)
SELECT	'CIVILIZATION_LEU_ISRAEL',		'LEADER_LEU_SOLOMON',			'LOC_CITY_NAME_LEU_ISRAEL_01'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		


-------------------------------------
-- LoadingInfo
-------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,				ForegroundImage,						PlayDawnOfManAudio,		BackgroundImage)
SELECT	'LEADER_LEU_SOLOMON',		'LEADER_LEU_SOLOMON_NEUTRAL.dds',		0,						'LEADER_LEU_SOLOMON_BACKGROUND_2.dds'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

--==========================================================================================================================
-- DIPLOMACY INFOfav
--==========================================================================================================================
-- DiplomacyInfo
-------------------------------------	
-- INSERT INTO DiplomacyInfo	
-- 			(Type,						BackgroundImage)
-- VALUES	('LEADER_LEU_SOLOMON',		'FALLBACK_NEUTRAL_LEU_SOLOMON.dds');
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- PlayerColors
-------------------------------------	
INSERT INTO PlayerColors	
		(Type,					Usage,			PrimaryColor, 									SecondaryColor,								TextColor)
SELECT	'LEADER_LEU_SOLOMON',	'Unique',		'COLOR_PLAYER_LEUGI_LEU_SOLOMON_BACKGROUND',		'COLOR_PLAYER_LEUGI_LEU_SOLOMON_FOREGROUND', 	'COLOR_PLAYER_WHITE_TEXT'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

INSERT INTO Colors 
		(Type, 											Color)
VALUES	('COLOR_PLAYER_LEUGI_LEU_SOLOMON_BACKGROUND', 	'245,235,220,255'),
		('COLOR_PLAYER_LEUGI_LEU_SOLOMON_FOREGROUND', 	'24,51,121,255');		

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,					Kind)
SELECT	'LEADER_LEU_SOLOMON',		'KIND_LEADER'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

-------------------------------------
-- Leaders
-------------------------------------	
INSERT INTO Leaders	
		(LeaderType,				Name,								InheritFrom,		SceneLayers)
SELECT	'LEADER_LEU_SOLOMON',		'LOC_LEADER_LEU_SOLOMON_NAME',		'LEADER_DEFAULT',	3
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

-------------------------------------
-- LeaderQuotes
-------------------------------------
INSERT INTO LeaderQuotes	
		(LeaderType,				Quote)
SELECT	'LEADER_LEU_SOLOMON',		'LOC_PEDIA_LEADERS_PAGE_LEADER_LEU_SOLOMON_QUOTE'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

-------------------------------------
-- FavoredReligions
-------------------------------------
INSERT OR REPLACE INTO FavoredReligions	
		(LeaderType,				ReligionType)
SELECT	'LEADER_LEU_SOLOMON',		'RELIGION_JUDAISM'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

--==========================================================================================================================
--==========================================================================================================================