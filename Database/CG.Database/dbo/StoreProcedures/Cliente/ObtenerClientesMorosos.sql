CREATE PROCEDURE dbo.ObtenerClientesMorosos


AS

BEGIN
SET NOCOUNT ON

    SELECT DISTINCT
        C.IdCliente,
        C.Nombre + ' ' + C.Apellido1 AS NombreCliente,
        C.Telefono,
        F.IdFactura,
        F.MontoTotal,
        F.FechaVencimiento
    FROM
        CLIENTE C
            INNER JOIN CONTRATO CO 
                ON C.IdCliente = CO.IdCliente
            INNER JOIN FACTURA F 
                ON CO.IdContrato = F.IdContrato
    WHERE
        F.EstadoPago = 'Pendiente'
        AND F.FechaVencimiento < GETDATE()
    ORDER BY
        F.FechaVencimiento;



END