CREATE PROCEDURE [dbo].ObtenerConsumoClienteUltimoMes

AS

BEGIN
 SET NOCOUNT ON;


     SELECT
        C.IdCliente,
        C.Nombre + ' ' + C.Apellido1 AS NombreCliente,
        U.NombreUbicacion,
        SUM(F.MontoTotal) AS ConsumoTotal
    FROM
        CLIENTE C
            INNER JOIN UBICACION U
                ON C.IdUbicacion = U.IdUbicacion
            INNER JOIN CONTRATO CO
                ON C.IdCliente = CO.IdCliente
            INNER JOIN FACTURA F
                ON CO.IdContrato = F.IdContrato
    WHERE
        F.FechaEmision >= DATEADD(MONTH, -1, GETDATE())
    GROUP BY
        C.IdCliente, C.Nombre, C.Apellido1, U.NombreUbicacion
    ORDER BY
        ConsumoTotal DESC;



END