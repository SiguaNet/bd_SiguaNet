CREATE TABLE [dbo].[DATOS_PERSONAS] (
    [numeroIdentidad]      VARCHAR (13) NOT NULL,
    [nombres]              VARCHAR (25) NOT NULL,
    [primerApellido]       VARCHAR (15) NOT NULL,
    [segundoApellido]      VARCHAR (15) NULL,
    [numeroTelefono]       INT          NOT NULL,
    [numeroCasa]           INT          NOT NULL,
    [idSector]             INT          NOT NULL,
    [referenciasDireccion] VARCHAR (80) NULL,
    CONSTRAINT [PK_DATOS_PERSONAS] PRIMARY KEY CLUSTERED ([numeroIdentidad] ASC),
    CONSTRAINT [FK_DATOS_PERSONAS_SECTORES] FOREIGN KEY ([idSector]) REFERENCES [dbo].[SECTORES] ([idSector])
);

