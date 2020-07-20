CREATE TABLE [dbo].[FACTURA] (
    [idFactura]        INT          IDENTITY (1, 1) NOT NULL,
    [numeroIdentidadC] VARCHAR (13) NOT NULL,
    [fechaPago]        DATETIME     NOT NULL,
    CONSTRAINT [PK_FACTURA] PRIMARY KEY CLUSTERED ([idFactura] ASC),
    CONSTRAINT [FK_FACTURA_CLIENTES] FOREIGN KEY ([numeroIdentidadC]) REFERENCES [dbo].[CLIENTES] ([numeroIdentidad]) ON UPDATE CASCADE
);

