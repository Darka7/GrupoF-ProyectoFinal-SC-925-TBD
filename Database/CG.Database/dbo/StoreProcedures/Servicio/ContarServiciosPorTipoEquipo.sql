CREATE PROCEDURE dbo.ContarServiciosPorTipoEquipo


AS

BEGIN
SET NOCOUNT ON


    SELECT
        TE.NombreTipoEquipo,
        COUNT(*) AS NumeroServicios
    FROM
        SERVICIO S
            INNER JOIN EQUIPO E 
                ON S.IdEquipo = E.IdEquipo
            INNER JOIN TIPO_EQUIPO TE 
                ON E.IdTipoEquipo = TE.IdTipoEquipo
    GROUP BY
        TE.NombreTipoEquipo
    ORDER BY
        NumeroServicios DESC;



END