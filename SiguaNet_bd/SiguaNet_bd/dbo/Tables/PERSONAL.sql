﻿CREATE TABLE [dbo].[PERSONAL] (
    [idPersonal]      INT          IDENTITY (1, 1) NOT NULL,
    [numeroIdentidad] VARCHAR (13) NOT NULL,
    [idVehiculo]      INT          NULL,
    [estado]          VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_PERSONAL_1] PRIMARY KEY CLUSTERED ([idPersonal] ASC),
    CONSTRAINT [FK_PERSONAL_DATOS_PERSONAS] FOREIGN KEY ([numeroIdentidad]) REFERENCES [dbo].[DATOS_PERSONAS] ([numeroIdentidad]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_PERSONAL_RECURSOS_MOTORES] FOREIGN KEY ([idVehiculo]) REFERENCES [dbo].[RECURSOS_MOTORES] ([idVehiculo]),
    CONSTRAINT [IX_PERSONAL] UNIQUE NONCLUSTERED ([numeroIdentidad] ASC)
);

