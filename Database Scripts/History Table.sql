CREATE TABLE [dbo].[History] (
    [fight_id]               INT        IDENTITY (1, 1) NOT NULL,
    [user_id]                INT        NULL,
    [creature_1_id]          INT        NOT NULL,
    [creature_2_id]          INT        NOT NULL,
    [creature_1_hit_rate]    DECIMAL NOT NULL,
    [creature_2_hit_rate]    DECIMAL NOT NULL,
    [creature_1_damage_rate] DECIMAL NOT NULL,
    [creature_2_damage_rate] DECIMAL NOT NULL,
    [creature_1_win_rate]    DECIMAL NOT NULL,
    [creature_2_win_rate]    DECIMAL NOT NULL,
    PRIMARY KEY CLUSTERED ([fight_id] ASC),
    FOREIGN KEY ([creature_1_id]) REFERENCES [dbo].[Creatures] ([creature_id]),
    FOREIGN KEY ([creature_2_id]) REFERENCES [dbo].[Creatures] ([creature_id])
);

