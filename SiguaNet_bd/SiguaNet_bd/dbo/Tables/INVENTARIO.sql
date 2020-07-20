CREATE TABLE [dbo].[INVENTARIO] (
    [idTipoAparato] INT          IDENTITY (1, 1) NOT NULL,
    [nombreTipo]    VARCHAR (20) NOT NULL,
    [cantidad]      INT          NOT NULL,
    CONSTRAINT [PK_INVENTARIO] PRIMARY KEY CLUSTERED ([idTipoAparato] ASC)
);

