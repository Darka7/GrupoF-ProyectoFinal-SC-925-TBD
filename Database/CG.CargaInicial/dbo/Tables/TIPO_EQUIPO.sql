﻿CREATE TABLE dbo.TIPO_EQUIPO
(
		IdTipoEquipo INT NOT NULL IDENTITY(1,1) 
		CONSTRAINT PK_TipoEquipo PRIMARY KEY CLUSTERED,
		NombreTipoEquipo VARCHAR(200) NOT NULL
)
WITH (DATA_COMPRESSION  = PAGE)
GO