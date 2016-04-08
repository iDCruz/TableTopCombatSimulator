CREATE PROCEDURE [dbo].[Delete_Attacks_Of_Creature]
	@creature_id int
AS
	DELETE FROM Attacks WHERE creature_id=@creature_id
RETURN 0