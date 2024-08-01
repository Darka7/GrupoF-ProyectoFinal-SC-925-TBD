CREATE TABLE dbo.RECLAMO 
(
		IdReclamo INT NOT NULL IDENTITY(1,1) 
			CONSTRAINT PK_Reclamo  PRIMARY KEY CLUSTERED,
		IdCliente INT NOT NULL
            CONSTRAINT FK_RECLAMO_CLIENTE
			FOREIGN KEY
			REFERENCES dbo.CLIENTE(IdCliente), 
        FechaReclamo DATE NOT NULL, 
        IdTipoReclamo INT NOT NULL
            CONSTRAINT FK_RECLAMO_TIPO_RECLAMO
			FOREIGN KEY
			REFERENCES dbo.TIPO_RECLAMO(IdTipoReclamo), 
        Descripcion VARCHAR(500), 
        EstadoReclamo VARCHAR(20) NOT NULL
			CONSTRAINT CHK_RECLAMO_EstadoReclamo
				CHECK (EstadoReclamo in ( 'Pendiente','Revisado')  ), 
        FechaSolucion DATE
)
WITH (DATA_COMPRESSION  = PAGE)
GO