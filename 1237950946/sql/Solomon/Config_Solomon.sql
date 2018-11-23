--==========================================================================================================================
-- CONFIG DATA
--==========================================================================================================================
-- Players

INSERT INTO Players	
		(CivilizationType,				Portrait,								PortraitBackground,					LeaderType,					LeaderName,							 LeaderIcon,						LeaderAbilityName,							LeaderAbilityDescription,						LeaderAbilityIcon,				CivilizationName,					CivilizationIcon,						CivilizationAbilityName,								CivilizationAbilityDescription,								CivilizationAbilityIcon)
SELECT	'CIVILIZATION_LEU_ISRAEL',		'LEADER_LEU_SOLOMON_NEUTRAL.dds',		'LEADER_LEU_SOLOMON_BACKGROUND',	'LEADER_LEU_SOLOMON',		'LOC_LEADER_LEU_SOLOMON_NAME',		 'ICON_LEADER_LEU_SOLOMON',		'LOC_TRAIT_LEADER_LEU_SOLOMON_NAME',		'LOC_TRAIT_LEADER_LEU_SOLOMON_DESCRIPTION',	'ICON_LEADER_LEU_SOLOMON',		'LOC_CIVILIZATION_LEU_ISRAEL_NAME',	'ICON_CIVILIZATION_LEU_ISRAEL',			'LOC_TRAIT_CIVILIZATION_LEU_ISRAEL_NAME',	'LOC_TRAIT_CIVILIZATION_LEU_ISRAEL_DESCRIPTION',	'ICON_CIVILIZATION_LEU_ISRAEL'
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

-- PlayerItems

INSERT INTO PlayerItems	
		(CivilizationType,				LeaderType,					Type,							Icon,									Name,									Description,									  SortIndex)
SELECT	'CIVILIZATION_LEU_ISRAEL',		'LEADER_LEU_SOLOMON',		'BUILDING_LEU_BETH_DIN',		'ICON_BUILDING_LEU_BETH_DIN',		'LOC_BUILDING_LEU_BETH_DIN_NAME',	'LOC_BUILDING_LEU_BETH_DIN_DESCRIPTION',		  20
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

INSERT INTO PlayerItems	
		(CivilizationType,				LeaderType,					Type,							Icon,									Name,									  Description,									  SortIndex)
SELECT	'CIVILIZATION_LEU_ISRAEL',		'LEADER_LEU_SOLOMON',		'UNIT_LEU_QALLA',				'ICON_UNIT_LEU_QALLA',				'LOC_UNIT_LEU_QALLA_NAME',			 'LOC_UNIT_LEU_QALLA_DESCRIPTION',			  10
WHERE EXISTS (SELECT * FROM Leu_Settings WHERE Type = 'LEU_SOLOMON' AND Value = 1);		

--==========================================================================================================================
--==========================================================================================================================