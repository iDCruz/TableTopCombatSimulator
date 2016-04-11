CREATE TABLE [dbo].[Creatures] (
    [creature_id]   INT           IDENTITY (1, 1) NOT NULL,
    [user_id]       INT           NOT NULL,
    [creature_name] VARCHAR (MAX) NOT NULL,
    [hit_points]    INT           NOT NULL,
    [initiative]    INT           NOT NULL,
    [armor_class]   INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([creature_id] ASC),
    FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([user_id])
);

