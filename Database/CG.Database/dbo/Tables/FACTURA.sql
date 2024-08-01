﻿CREATE TABLE dbo.FACTURA 
(
	IdFactura INT NOT NULL IDENTITY(1,1) 
		CONSTRAINT PK_Factura PRIMARY KEY CLUSTERED,
	IdContrato INT NOT NULL
        CONSTRAINT FK_FACTURA_CONTRATO
				FOREIGN KEY
				REFERENCES dbo.CONTRATO(IdContrato) , 
    FechaEmision DATE NOT NULL,
	Periodo AS CAST( FORMAT(FechaEmision,'yyyyMM') AS int),
    FechaVencimiento DATETIME NOT NULL,
    MontoTotal DECIMAL(16,2) NOT NULL, 
    EstadoPago VARCHAR(20) NOT NULL
		CONSTRAINT CHK_FACTURA_EstadoContrato
			CHECK (EstadoPago in ( 'Pendiente','Pagado')  )
)
WITH (DATA_COMPRESSION  = PAGE)
GO

