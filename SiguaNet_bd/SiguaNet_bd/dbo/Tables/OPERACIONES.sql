CREATE TABLE [dbo].[OPERACIONES] (
    [idOperacion]     INT          IDENTITY (1, 1) NOT NULL,
    [descripcion]     VARCHAR (80) NULL,
    [nombreOperacion] VARCHAR (40) NOT NULL,
    CONSTRAINT [PK_OPERACIONES] PRIMARY KEY CLUSTERED ([idOperacion] ASC)
);

