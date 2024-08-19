CREATE PROCEDURE dbo.RptConsumoMensual
    @Mes INT=1,
    @Anio INT=2024
AS

BEGIN
SET NOCOUNT ON


 SELECT 
        C.IdCliente,
        C.Nombre + ' ' + C.Apellido1 AS NombreCliente,
        SUM(F.MontoTotal) AS ConsumoTotal
    FROM 
        CLIENTE C
            INNER JOIN CONTRATO CO 
                ON C.IdCliente = CO.IdCliente
            INNER JOIN FACTURA F 
                ON CO.IdContrato = F.IdContrato
    WHERE 
        MONTH(F.FechaEmision) = @Mes
        AND YEAR(F.FechaEmision) = @Anio
    GROUP BY 
        C.IdCliente, C.Nombre, C.Apellido1
    ORDER BY 
        ConsumoTotal DESC

END