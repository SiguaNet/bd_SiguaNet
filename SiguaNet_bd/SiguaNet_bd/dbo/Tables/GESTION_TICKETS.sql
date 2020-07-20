CREATE TABLE [dbo].[GESTION_TICKETS] (
    [idTicket]         INT          IDENTITY (1, 1) NOT NULL,
    [numeroIdentidadC] VARCHAR (13) NOT NULL,
    [idPersonal]       INT          NOT NULL,
    [estado]           VARCHAR (20) NOT NULL,
    [idOperacion]      INT          NOT NULL,
    [fechaInicio]      DATETIME     NOT NULL,
    [fechaFin]         DATETIME     NULL,
    CONSTRAINT [PK_GESTION_TICKETS] PRIMARY KEY CLUSTERED ([idTicket] ASC),
    CONSTRAINT [FK_GESTION_TICKETS_CLIENTES] FOREIGN KEY ([numeroIdentidadC]) REFERENCES [dbo].[CLIENTES] ([numeroIdentidad]) ON UPDATE CASCADE,
    CONSTRAINT [FK_GESTION_TICKETS_OPERACIONES] FOREIGN KEY ([idOperacion]) REFERENCES [dbo].[OPERACIONES] ([idOperacion]),
    CONSTRAINT [FK_GESTION_TICKETS_PERSONAL] FOREIGN KEY ([idPersonal]) REFERENCES [dbo].[PERSONAL] ([idPersonal])
);

