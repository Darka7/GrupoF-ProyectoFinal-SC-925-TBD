﻿CREATE TABLE dbo.PUESTO
(
		IdPuesto INT NOT NULL IDENTITY(1,1) 
		CONSTRAINT PK_Puesto PRIMARY KEY CLUSTERED,
		NombrePuesto VARCHAR(200) NOT NULL
)
WITH (DATA_COMPRESSION  = PAGE)
GO