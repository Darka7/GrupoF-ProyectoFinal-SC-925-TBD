CREATE PROCEDURE dbo.RptMantenimientos
    @FechaInicio DATE,
    @FechaFin DATE

AS

BEGIN
SET NOCOUNT ON


IF (@FechaInicio IS NULL) SET @FechaInicio=DATEADD(MONTH,-2,GETDATE());

IF (@FechaFin IS NULL ) SET @FechaFin=GETDATE();

    
      SELECT 
        E.NumeroSerie,
        TE.NombreTipoEquipo,
        M.FechaMantenimiento,
        TM.NombreTipoMantenimiento,
        EM.Nombre + ' ' + EM.Apellido1 AS NombreTecnico,
        M.Costo
    FROM 
        MANTENIMIENTO M
            INNER JOIN EQUIPO E 
                ON M.IdEquipo = E.IdEquipo
            INNER JOIN TIPO_EQUIPO TE 
                ON E.IdTipoEquipo = TE.IdTipoEquipo
            INNER JOIN TIPO_MANTENIMIENTO TM 
                ON M.IdTipoMantenimiento = TM.IdTipoMantenimiento
            INNER JOIN EMPLEADO EM 
                ON M.IdEmpleado = EM.IdEmpleado
    WHERE 
        M.FechaMantenimiento BETWEEN @FechaInicio AND @FechaFin
    ORDER BY 
        M.FechaMantenimiento


END