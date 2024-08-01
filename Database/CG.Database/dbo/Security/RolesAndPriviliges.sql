
-- Crear roles
CREATE ROLE RolAdministrador;
go
CREATE ROLE RolServicioCliente;
go
CREATE ROLE RolTecnico;
go
CREATE ROLE RolFacturacion;
go
CREATE ROLE RolLectura;
go

-- Asignar privilegios
GRANT SELECT, INSERT, UPDATE ON CLIENTE TO RolServicioCliente; 
GO
GRANT SELECT, INSERT, UPDATE ON CONTRATO TO RolServicioCliente; 
GO
GRANT SELECT, INSERT, UPDATE ON SERVICIO TO RolServicioCliente; 
GO
GRANT SELECT, INSERT ON RECLAMO TO RolServicioCliente; 
GO
GRANT SELECT ON FACTURA TO RolServicioCliente; 
GO
---------------------------------------------------------------------
GRANT SELECT, INSERT, UPDATE ON EQUIPO TO RolTecnico; 
GO
GRANT SELECT, INSERT, UPDATE ON MANTENIMIENTO TO RolTecnico; 
GO
GRANT SELECT ON SUBESTACION TO RolTecnico; 
GO
 
-------------------------------------------------------------------------------------
GRANT SELECT, INSERT, UPDATE ON FACTURA TO RolFacturacion; 
GO
GRANT SELECT, INSERT, UPDATE ON PAGO TO RolFacturacion; 
GO
GRANT SELECT ON CLIENTE TO RolFacturacion; 
GO
GRANT SELECT ON CONTRATO TO RolFacturacion; 
GO
GRANT SELECT ON SERVICIO TO RolFacturacion; 
GO
-----------------------------------------------------------------
GRANT SELECT ON SCHEMA::dbo TO RolLectura; 