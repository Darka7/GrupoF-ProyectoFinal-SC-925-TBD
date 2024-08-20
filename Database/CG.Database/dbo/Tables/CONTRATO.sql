﻿CREATE TABLE dbo.CONTRATO
(
	IdContrato INT NOT NULL IDENTITY(1,1) 
		CONSTRAINT PK_Contrato PRIMARY KEY CLUSTERED,
	IdCliente INT NOT NULL
		CONSTRAINT FK_CONTRATO_Cliente
			FOREIGN KEY
			REFERENCES dbo.CLIENTE(IdCliente),
	FechaInicio DATETIME NOT NULL, 
    FechaFin DATETIME, 
    EstadoContrato VARCHAR(15) NOT NULL
		CONSTRAINT CHK_CONTRATO_EstadoContrato
			CHECK (EstadoContrato in ('Activo', 'Pendiente','Finalizado')  ),
	SysDateFrom DATETIME2 GENERATED ALWAYS AS ROW START,
    SysDateTo DATETIME2 GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME (SysDateFrom, SysDateTo)
)
WITH (DATA_COMPRESSION  = PAGE,SYSTEM_VERSIONING = ON (HISTORY_TABLE=dbo.[CONTRATO_HISTORY], DATA_CONSISTENCY_CHECK=ON))
GO