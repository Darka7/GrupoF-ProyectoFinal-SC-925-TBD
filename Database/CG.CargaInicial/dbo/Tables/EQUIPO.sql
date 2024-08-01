﻿CREATE TABLE dbo.EQUIPO 
(
		IdEquipo INT NOT NULL IDENTITY(1,1) 
		CONSTRAINT PK_Equipo PRIMARY KEY CLUSTERED,
		IdSubEstacion INT
            CONSTRAINT FK_EQUIPO_SUBESTACION
			FOREIGN KEY
			REFERENCES dbo.SUBESTACION(IdSubEstacion), 
        IdTipoEquipo INT NOT NULL
                CONSTRAINT FK_EQUIPO_TIPO_EQUIPO
			    FOREIGN KEY
			    REFERENCES dbo.TIPO_EQUIPO(IdTipoEquipo), 
        Marca VARCHAR(50) NOT NULL, 
        Modelo VARCHAR(50) NOT NULL, 
        NumeroSerie VARCHAR(50)  NOT NULL, 
        FechaAdquisicion DATE NOT NULL, 
        EstadoEquipo VARCHAR(20) NOT NULL
            CONSTRAINT CHK_EQUIPO_EstadoEquipo
			CHECK (EstadoEquipo in ( 'Nuevo','Usado','Obsoleto')  )
)
WITH (DATA_COMPRESSION  = PAGE)
GO

CREATE UNIQUE NONCLUSTERED INDEX UIDX__EQUIPO_NumeroSerie
ON dbo.EQUIPO (NumeroSerie)
WITH (DATA_COMPRESSION  = PAGE)
GO