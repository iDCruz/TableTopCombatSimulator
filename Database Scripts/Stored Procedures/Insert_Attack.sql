CREATE PROCEDURE [dbo].[Insert_Attack]
	@creature_id INT,
	@attack_name NVARCHAR (MAX),
	@attack_damage NVARCHAR (MAX),
	@critical_threshold INT,
	@critical_multiplier INT,
	@attack_modifier INT,
	@user_id NVARCHAR (MAX)
AS
	INSERT INTO Attacks(creature_id, attack_name, attack_damage, critical_threshold, critical_multiplier, attack_modifier, user_id) VALUES (@creature_id, @attack_name, @attack_damage, @critical_threshold, @critical_multiplier, @attack_modifier, @user_id)
RETURN 0