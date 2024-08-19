CREATE PROCEDURE dbo.ObtenerIngresosPorServicio

@FechaInicio DATE=NULL,
@FechaFin DATE= NULL

AS

BEGIN
SET NOCOUNT ON

IF (@FechaInicio IS NULL) SET @FechaInicio=DATEADD(MONTH,-1,GETDATE());

IF (@FechaFin IS NULL ) SET @FechaFin=GETDATE();

    
SELECT
        TS.NombreServicio,
        SUM(F.MontoTotal) AS IngresoTotal,
        COUNT(DISTINCT CO.IdContrato) AS NumeroContratos
    FROM
        SERVICIO S
            INNER JOIN TIPO_SERVICIO TS 
                ON S.IdTipoServicio = TS.IdTipoServicio
            INNER JOIN CONTRATO CO 
                ON S.IdContrato = CO.IdContrato
            INNER JOIN FACTURA F 
                ON CO.IdContrato = F.IdContrato
    WHERE
        F.FechaEmision BETWEEN @FechaInicio AND @FechaFin
    GROUP BY
        TS.NombreServicio
    ORDER BY
        IngresoTotal DESC;



END