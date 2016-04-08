CREATE PROCEDURE [dbo].[Check_User_Or_Pass_Exist]
	@user_name NVARCHAR (MAX),
	@user_password NVARCHAR (MAX)
AS
	SELECT Users.user_id FROM Users WHERE user_name=@user_name OR user_password=@user_password
	RETURN