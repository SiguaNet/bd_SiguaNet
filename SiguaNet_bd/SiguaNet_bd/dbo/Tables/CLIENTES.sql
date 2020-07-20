CREATE TABLE [dbo].[CLIENTES] (
    [numeroIdentidad] VARCHAR (13) NOT NULL,
    [idPaquete]       INT          NOT NULL,
    [pagosCliente]    INT          NOT NULL,
    [estadoC]         VARCHAR (30) NOT NULL,
    CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED ([numeroIdentidad] ASC),
    CONSTRAINT [FK_CLIENTES_DATOS_PERSONAS] FOREIGN KEY ([numeroIdentidad]) REFERENCES [dbo].[DATOS_PERSONAS] ([numeroIdentidad]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_CLIENTES_PLANES_INTERNET] FOREIGN KEY ([idPaquete]) REFERENCES [dbo].[PLANES_INTERNET] ([idPaquete])
);

