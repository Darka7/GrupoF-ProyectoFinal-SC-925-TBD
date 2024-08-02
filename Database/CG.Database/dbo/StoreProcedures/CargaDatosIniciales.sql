CREATE PROCEDURE dbo.CargaDatosIniciales
	
AS
BEGIN
SET NOCOUNT ON

IF EXISTS (SELECT * FROM RECLAMO )BEGIN
--NO SE VUELVE A EJECUTAR EL SCRIPT SOLO EN UNA OCACION
PRINT 'Carga Inicial Cancelada'
    RETURN;
END
        -- Variables para controlar la cantidad de registros
            DECLARE @NumClientes INT = 1000;
            DECLARE @NumContratos INT = 1500;
            DECLARE @NumFacturas INT = 5000;
            DECLARE @NumPagos INT = 4000;
            DECLARE @NumEmpleados INT = 100;
            DECLARE @NumEquipos INT = 200;
            DECLARE @NumMantenimientos INT = 500;
            DECLARE @NumReclamos INT = 300;

            -- Insertar datos en tablas normalizadas
            INSERT INTO UBICACION (NombreUbicacion)
            VALUES ('Liberia'), ('Santa Cruz'), ('Nicoya'), ('Bagaces'), ('Cañas'), ('Tilarán'), ('La Cruz'), ('Hojancha'), ('Nandayure'), ('Abangares');

            INSERT INTO TIPO_SERVICIO (NombreServicio, Tarifa)
            VALUES ('Electricidad Residencial', 100.00),
                   ('Electricidad Comercial', 150.00),
                   ('Internet Fibra Óptica 50Mbps', 25000.00),
                   ('Internet Fibra Óptica 100Mbps', 35000.00),
                   ('TV por Cable Básico', 15000.00),
                   ('TV por Cable Premium', 25000.00);

            INSERT INTO METODO_PAGO (NombreMetodo)
            VALUES ('Tarjeta de Crédito'), ('Efectivo'), ('Transferencia Bancaria'), ('Débito Automático'), ('Pago en Línea');

            INSERT INTO PUESTO (NombrePuesto)
            VALUES ('Técnico de Campo'), ('Servicio al Cliente'), ('Contador'), ('Ingeniero Eléctrico'), ('Gerente de Operaciones');

            INSERT INTO TIPO_EQUIPO (NombreTipoEquipo)
            VALUES ('Transformador'), ('Generador'), ('Panel Solar'), ('Router'), ('Decodificador de TV');

            INSERT INTO TIPO_MANTENIMIENTO (NombreTipoMantenimiento)
            VALUES ('Preventivo'), ('Correctivo'), ('Predictivo'), ('Overhaul');

            INSERT INTO TIPO_RECLAMO (NombreTipoReclamo)
            VALUES ('Facturación Incorrecta'), ('Interrupción de Servicio'), ('Baja Calidad de Señal'), ('Demora en Instalación'), ('Mala Atención al Cliente');

            -- Insertar clientes de prueba
            DECLARE @i INT = 1;
            WHILE @i <= @NumClientes
            BEGIN
                INSERT INTO CLIENTE (Cedula, Nombre, Apellido1, Apellido2, Direccion, Telefono, Email, IdUbicacion)
                VALUES (
                    CONCAT('30', RIGHT('00000000' + CAST(@i AS VARCHAR(8)), 8)),
                    'Cliente' + CAST(@i AS VARCHAR(10)),
                    'Apellido' + CAST(@i AS VARCHAR(10)),
                    'SegundoApellido' + CAST(@i AS VARCHAR(10)),
                    'Dirección ' + CAST(@i AS VARCHAR(10)),
                    CONCAT('8888', RIGHT('0000' + CAST(@i AS VARCHAR(4)), 4)),
                    CONCAT('cliente', @i, '@email.com'),
                    ((@i - 1) % 10) + 1
                );
                SET @i = @i + 1;
            END;

            -- Insertar contratos de prueba
            SET @i = 1;
            WHILE @i <= @NumContratos
            BEGIN
                INSERT INTO CONTRATO (IdCliente, FechaInicio, EstadoContrato)
                VALUES (
                    (@i % @NumClientes) + 1,
                    DATEADD(DAY, -CAST(RAND() * 365 AS INT), GETDATE()),
                    CASE WHEN RAND() > 0.1 THEN 'Activo' ELSE 'Finalizado' END
                );
                SET @i = @i + 1;
            END;

            -- Insertar servicios de prueba
            INSERT INTO SERVICIO (IdContrato, IdTipoServicio, FechaInstalacion)
            SELECT 
                IdContrato,
                (ABS(CHECKSUM(NEWID())) % 6) + 1,
                DATEADD(DAY, CAST(RAND() * 30 AS INT), FechaInicio)
            FROM CONTRATO;

            -- Insertar facturas de prueba
            SET @i = 1;
            WHILE @i <= @NumFacturas
            BEGIN
                INSERT INTO FACTURA (IdContrato, FechaEmision, FechaVencimiento, MontoTotal, EstadoPago)
                VALUES (
                    ((@i - 1) % @NumContratos) + 1,
                    DATEADD(DAY, -CAST(RAND() * 365 AS INT), GETDATE()),
                    DATEADD(DAY, 15, DATEADD(DAY, -CAST(RAND() * 365 AS INT), GETDATE())),
                    CAST((RAND() * 100000) + 5000 AS DECIMAL(10,2)),
                    CASE WHEN RAND() > 0.2 THEN 'Pagado' ELSE 'Pendiente' END
                );
                SET @i = @i + 1;
            END;

            -- Insertar pagos de prueba
            SET @i = 1;
            WHILE @i <= @NumPagos
            BEGIN
                INSERT INTO PAGO (IdFactura, FechaPago, MontoPagado, IdMetodoPago)
                VALUES (
                    ((@i - 1) % @NumFacturas) + 1,
                    DATEADD(DAY, CAST(RAND() * 15 AS INT), (SELECT FechaEmision FROM FACTURA WHERE IdFactura = ((@i - 1) % @NumFacturas) + 1)),
                    (SELECT MontoTotal FROM FACTURA WHERE IdFactura = ((@i - 1) % @NumFacturas) + 1),
                    (ABS(CHECKSUM(NEWID())) % 5) + 1
                );
                SET @i = @i + 1;
            END;

            -- Insertar empleados de prueba
            SET @i = 1;
            WHILE @i <= @NumEmpleados
            BEGIN
                INSERT INTO EMPLEADO (Cedula, Nombre, Apellido1, Apellido2, IdPuesto, FechaContratacion, Salario)
                VALUES (
                    CONCAT('10', RIGHT('00000000' + CAST(@i AS VARCHAR(8)), 8)),
                    'Empleado' + CAST(@i AS VARCHAR(10)),
                    'Apellido' + CAST(@i AS VARCHAR(10)),
                    'SegundoApellido' + CAST(@i AS VARCHAR(10)),
                    ((@i - 1) % 5) + 1,
                    DATEADD(YEAR, -CAST(RAND() * 10 AS INT), GETDATE()),
                    CAST((RAND() * 1000000) + 300000 AS DECIMAL(10,2))
                );
                SET @i = @i + 1;
            END;

            -- Insertar subestaciones de prueba
            INSERT INTO SUBESTACION (Nombre, Ubicacion, CapacidadKW, FechaInstalacion)
            VALUES 
            ('Subestación Norte', 'Km 5 Carretera a Nicoya', 1000.00, '2020-01-01'),
            ('Subestación Sur', 'Km 10 Carretera a Santa Cruz', 1200.00, '2021-01-01'),
            ('Subestación Este', 'Km 15 Carretera a Liberia', 1500.00, '2019-06-15'),
            ('Subestación Oeste', 'Km 8 Carretera a Tamarindo', 800.00, '2022-03-20');

            -- Insertar equipos de prueba
            SET @i = 1;
            WHILE @i <= @NumEquipos
            BEGIN
                INSERT INTO EQUIPO (IdSubEstacion, IdTipoEquipo, Marca, Modelo, NumeroSerie, FechaAdquisicion, EstadoEquipo)
                VALUES (
                    ((@i - 1) % 4) + 1,
                    (ABS(CHECKSUM(NEWID())) % 5) + 1,
                    CASE (ABS(CHECKSUM(NEWID())) % 5)
                        WHEN 0 THEN 'ABB'
                        WHEN 1 THEN 'Siemens'
                        WHEN 2 THEN 'General Electric'
                        WHEN 3 THEN 'Schneider Electric'
                        ELSE 'Mitsubishi'
                    END,
                    'Modelo' + CAST(@i AS VARCHAR(10)),
                    'SN' + RIGHT('00000' + CAST(@i AS VARCHAR(5)), 5),
                    DATEADD(YEAR, -CAST(RAND() * 5 AS INT), GETDATE()),
                    CASE WHEN RAND() > 0.7 THEN 'Nuevo' WHEN RAND() > 0.3 THEN 'Usado' ELSE 'Obsoleto' END
                );
                SET @i = @i + 1;
            END;

            -- Insertar mantenimientos de prueba
            SET @i = 1;
            WHILE @i <= @NumMantenimientos
            BEGIN
                INSERT INTO MANTENIMIENTO (IdEquipo, IdEmpleado, FechaMantenimiento, IdTipoMantenimiento, Descripcion, Costo)
                VALUES (
                    (ABS(CHECKSUM(NEWID())) % @NumEquipos) + 1,
                    (ABS(CHECKSUM(NEWID())) % @NumEmpleados) + 1,
                    DATEADD(DAY, -CAST(RAND() * 365 AS INT), GETDATE()),
                    (ABS(CHECKSUM(NEWID())) % 4) + 1,
                    'Mantenimiento #' + CAST(@i AS VARCHAR(10)),
                    CAST((RAND() * 100000) + 10000 AS DECIMAL(10,2))
                );
                SET @i = @i + 1;
            END;

            -- Insertar reclamos de prueba
            SET @i = 1;
            WHILE @i <= @NumReclamos
            BEGIN
                INSERT INTO RECLAMO (IdCliente, FechaReclamo, IdTipoReclamo, Descripcion, EstadoReclamo)
                VALUES (
                    (ABS(CHECKSUM(NEWID())) % @NumClientes) + 1,
                    DATEADD(DAY, -CAST(RAND() * 180 AS INT), GETDATE()),
                    (ABS(CHECKSUM(NEWID())) % 5) + 1,
                    'Reclamo #' + CAST(@i AS VARCHAR(10)),
                    CASE WHEN RAND() > 0.5 THEN 'Pendiente' ELSE 'Revisado' END
                );
                SET @i = @i + 1;
            END;

            PRINT 'Carga Inicial Finalizada'

END