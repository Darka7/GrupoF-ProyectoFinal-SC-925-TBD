CREATE PROCEDURE dbo.ObtenerServiciosSinEquipo


AS

BEGIN
SET NOCOUNT ON

    SELECT
        S.IdServicio,
        TS.NombreServicio,
        C.IdCliente,
        C.Nombre + ' ' + C.Apellido1 AS NombreCliente
    FROM
        SERVICIO S
            INNER JOIN TIPO_SERVICIO TS     
                ON S.IdTipoServicio = TS.IdTipoServicio
            INNER JOIN CONTRATO CO 
                ON S.IdContrato = CO.IdContrato
            INNER JOIN CLIENTE C 
                ON CO.IdCliente = C.IdCliente
    WHERE
        S.IdEquipo IS NULL
    ORDER BY
        TS.NombreServicio, C.Nombre;


END