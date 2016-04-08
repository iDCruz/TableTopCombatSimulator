CREATE PROCEDURE [dbo].[Get_User_ID]
	@user_name NVARCHAR (MAX),
	@user_password NVARCHAR (MAX)
AS
	SELECT * FROM Users WHERE user_name=@user_name AND user_password=@user_password
	RETURN