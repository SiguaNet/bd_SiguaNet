CREATE TABLE [dbo].[PLANES_INTERNET] (
    [idPaquete]     INT          IDENTITY (1, 1) NOT NULL,
    [nombrePaquete] VARCHAR (40) NOT NULL,
    [velocidad]     INT          NOT NULL,
    [precio]        FLOAT (53)   NOT NULL,
    CONSTRAINT [PK_PLANES_INTERNET] PRIMARY KEY CLUSTERED ([idPaquete] ASC)
);

