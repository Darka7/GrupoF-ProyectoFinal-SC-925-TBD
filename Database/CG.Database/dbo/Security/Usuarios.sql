-- Crear usuarios y asignar roles 
CREATE LOGIN AdminCoopeGuanacaste WITH PASSWORD = 'PF-SC-925';
GO
CREATE USER AdminCoopeGuanacaste FOR LOGIN AdminCoopeGuanacaste;
GO
ALTER ROLE RolAdministrador ADD MEMBER AdminCoopeGuanacaste;
GO
GRANT CONNECT TO AdminCoopeGuanacaste
GO
---------------------------------------------------------------------------
CREATE LOGIN ServicioClienteCoopeGuanacaste WITH PASSWORD = 'PF-SC-925';
GO
CREATE USER ServicioClienteCoopeGuanacaste FOR LOGIN ServicioClienteCoopeGuanacaste;
GO
ALTER ROLE RolServicioCliente ADD MEMBER ServicioClienteCoopeGuanacaste;
GO
GRANT CONNECT TO ServicioClienteCoopeGuanacaste
GO

-------------------------------------------------------------------

CREATE LOGIN TecnicoCoopeGuanacaste WITH PASSWORD =  'PF-SC-925'; 
GO
CREATE USER TecnicoCoopeGuanacaste FOR LOGIN TecnicoCoopeGuanacaste; 
GO
ALTER ROLE RolTecnico ADD MEMBER TecnicoCoopeGuanacaste; 
GO
GRANT CONNECT TO TecnicoCoopeGuanacaste
GO
------------------------------------------------------
CREATE LOGIN FacturacionCoopeGuanacaste WITH PASSWORD =  'PF-SC-925'; 
GO
CREATE USER FacturacionCoopeGuanacaste FOR LOGIN FacturacionCoopeGuanacaste; 
GO
ALTER ROLE RolFacturacion ADD MEMBER FacturacionCoopeGuanacaste; 
GO
GRANT CONNECT TO FacturacionCoopeGuanacaste
GO
--------------------------------------------------------
CREATE LOGIN LecturaCoopeGuanacaste WITH PASSWORD = 'PF-SC-925'; 
GO
CREATE USER LecturaCoopeGuanacaste FOR LOGIN LecturaCoopeGuanacaste; 
GO
ALTER ROLE RolLectura ADD MEMBER LecturaCoopeGuanacaste; 
GO
GRANT CONNECT TO LecturaCoopeGuanacaste
GO