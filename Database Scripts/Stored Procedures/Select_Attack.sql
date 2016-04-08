CREATE PROCEDURE [dbo].[Select_Attack]
AS
	SELECT creature_id, attack_name, attack_damage, critical_range, finesse, is_weapon, attack_modifier, user_id FROM Attacks
	RETURN