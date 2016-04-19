CREATE PROCEDURE [dbo].[Get_Creature_By_Id_and_Name]
	@creature_name NVARCHAR (MAX),
	@user_id int
AS
	SELECT * FROM Creatures WHERE creature_name=@creature_name AND user_id=@user_id
	RETURN