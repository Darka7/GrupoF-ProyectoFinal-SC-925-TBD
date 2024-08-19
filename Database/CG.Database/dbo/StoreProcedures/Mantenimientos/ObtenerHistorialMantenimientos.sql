CREATE PROCEDURE dbo.ObtenerHistorialMantenimientos
@IdSubEstacion INT = NULL

AS

BEGIN
SET NOCOUNT ON


SELECT
        S.Nombre AS NombreSubestacion,
        TE.NombreTipoEquipo,
        E.NumeroSerie,
        M.FechaMantenimiento,
        TM.NombreTipoMantenimiento,
        M.Costo,
        EM.Nombre + ' ' + EM.Apellido1 AS NombreTecnico
    FROM
        SUBESTACION S
        INNER JOIN EQUIPO E 
            ON S.IdSubEstacion = E.IdSubEstacion
        INNER JOIN TIPO_EQUIPO TE 
            ON E.IdTipoEquipo = TE.IdTipoEquipo
        INNER JOIN MANTENIMIENTO M 
            ON E.IdEquipo = M.IdEquipo
        INNER JOIN TIPO_MANTENIMIENTO TM 
            ON M.IdTipoMantenimiento = TM.IdTipoMantenimiento
        INNER JOIN EMPLEADO EM 
            ON M.IdEmpleado = EM.IdEmpleado
    WHERE
       (@IdSubEstacion is null OR  S.IdSubEstacion = @IdSubEstacion)
    ORDER BY
        S.Nombre, M.FechaMantenimiento DESC;


END