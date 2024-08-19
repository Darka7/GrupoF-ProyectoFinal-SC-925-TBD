CREATE PROCEDURE dbo.ObtenerClientesMayorConsumo

@Cantidad INT =10

AS

BEGIN
SET NOCOUNT ON


;WITH ClienteConsumo AS (
        SELECT
            C.IdCliente,
            C.Nombre + ' ' + C.Apellido1 AS NombreCliente,
            U.NombreUbicacion,
            SUM(F.MontoTotal) AS ConsumoTotal,
            ROW_NUMBER() OVER (ORDER BY SUM(F.MontoTotal) DESC) AS Ranking
        FROM
            CLIENTE C
                INNER JOIN UBICACION U 
                    ON C.IdUbicacion = U.IdUbicacion
                INNER JOIN CONTRATO CO 
                    ON C.IdCliente = CO.IdCliente
                INNER JOIN FACTURA F 
                    ON CO.IdContrato = F.IdContrato
        GROUP BY
            C.IdCliente, C.Nombre, C.Apellido1, U.NombreUbicacion
    )
    SELECT
        IdCliente,
        NombreCliente,
        NombreUbicacion,
        ConsumoTotal,
        Ranking
    FROM
        ClienteConsumo
    WHERE
        Ranking <= @Cantidad;



END