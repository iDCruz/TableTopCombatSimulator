CREATE TABLE [dbo].[Attacks] (
    [attack_id]       INT           IDENTITY (1, 1) NOT NULL,
    [creature_id]     INT           NOT NULL,
    [attack_name]     VARCHAR (MAX) NOT NULL,
    [attack_damage]   VARCHAR (MAX) NOT NULL,
    [critical_range]  INT           NOT NULL,
    [finesse]         BIT           NOT NULL,
    [is_weapon]       BIT           NOT NULL,
    [attack_modifier] INT           NOT NULL,
    [user_id]         INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([attack_id] ASC),
    FOREIGN KEY ([creature_id]) REFERENCES [dbo].[Creatures] ([creature_id])
);
