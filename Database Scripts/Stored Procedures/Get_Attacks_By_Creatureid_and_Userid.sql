CREATE PROCEDURE [dbo].[Get_Attacks_By_Creatureid_and_Userid]
	@creature_id NVARCHAR (MAX),
	@user_id int
AS
	SELECT * FROM Attacks WHERE creature_id=@creature_id AND user_id=@user_id
	RETURN