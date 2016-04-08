CREATE PROCEDURE [dbo].[Add_User]
	@user_name NVARCHAR (MAX),
	@user_password NVARCHAR (MAX)
AS
	INSERT Users (user_name, user_password) VALUES (@user_name, @user_password)