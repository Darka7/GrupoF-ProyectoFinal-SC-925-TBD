CREATE PROCEDURE dbo.RptEficienciaEquipos


AS

BEGIN
SET NOCOUNT ON

    SELECT 
        E.NumeroSerie,
        TE.NombreTipoEquipo,
        COUNT(M.IdMantenimiento) AS CantidadMantenimientos,
        AVG(M.Costo) AS CostoPromedioMantenimiento,
        DATEDIFF(DAY, E.FechaAdquisicion, GETDATE()) AS DiasEnServicio
    FROM 
        EQUIPO E
            INNER JOIN TIPO_EQUIPO TE 
                ON E.IdTipoEquipo = TE.IdTipoEquipo
            LEFT JOIN MANTENIMIENTO M 
                ON E.IdEquipo = M.IdEquipo
    GROUP BY 
        E.NumeroSerie, TE.NombreTipoEquipo, E.FechaAdquisicion
    ORDER BY 
        CantidadMantenimientos DESC

END