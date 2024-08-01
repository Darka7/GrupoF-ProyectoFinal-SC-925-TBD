CREATE TABLE dbo.EMPLEADO
(
		IdEmpleado INT NOT NULL IDENTITY(1,1) 
			CONSTRAINT PK_Empleado PRIMARY KEY CLUSTERED,
        Cedula VARCHAR(20)  NOT NULL, 
        Nombre VARCHAR(50) NOT NULL, 
        Apellido1 VARCHAR(50) NOT NULL, 
        Apellido2 VARCHAR(50), 
        IdPuesto INT NOT NULL
            CONSTRAINT FK_EMPLEADO_Puesto
			FOREIGN KEY
			REFERENCES dbo.PUESTO(IdPuesto), 
        FechaContratacion DATE NOT NULL, 
        Salario DECIMAL(16,2) NOT NULL
)
WITH (DATA_COMPRESSION  = PAGE)
GO
-- no puede existir otra  cedula identica
CREATE UNIQUE NONCLUSTERED INDEX UIDX__EMPLEADO_Cedula
ON dbo.EMPLEADO (Cedula)
WITH (DATA_COMPRESSION  = PAGE)
GO