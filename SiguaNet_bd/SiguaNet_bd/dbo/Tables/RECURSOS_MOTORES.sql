CREATE TABLE [dbo].[RECURSOS_MOTORES] (
    [idVehiculo] INT          IDENTITY (1, 1) NOT NULL,
    [matricula]  VARCHAR (7)  NOT NULL,
    [modelo]     VARCHAR (30) NOT NULL,
    CONSTRAINT [PK_RECURSOS_MOTORES] PRIMARY KEY CLUSTERED ([idVehiculo] ASC)
);

