CREATE PROCEDURE [dbo].[Select_Attack]
AS
	SELECT creature_id, attack_name, attack_damage, critical_threshold, critical_multiplier, attack_modifier, user_id FROM Attacks
	RETURN