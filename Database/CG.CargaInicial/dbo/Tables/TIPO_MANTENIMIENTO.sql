﻿CREATE TABLE dbo.TIPO_MANTENIMIENTO
(
		IdTipoMantenimiento INT NOT NULL IDENTITY(1,1) 
		CONSTRAINT PK_TipoMantenimiento PRIMARY KEY CLUSTERED,
		NombreTipoMantenimiento VARCHAR(200) NOT NULL
)
WITH (DATA_COMPRESSION  = PAGE)
GO