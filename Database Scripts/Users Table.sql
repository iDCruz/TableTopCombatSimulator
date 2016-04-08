CREATE TABLE [dbo].[Users] (
    [user_id]       INT            IDENTITY (1, 1) NOT NULL,
    [user_name]     NVARCHAR (MAX) NOT NULL,
    [user_password] NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([user_id] ASC)
);