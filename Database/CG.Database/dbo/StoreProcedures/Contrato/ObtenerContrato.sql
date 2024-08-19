CREATE PROCEDURE dbo.ObtenerContrato
@IdContrato INT


AS

BEGIN
SET NOCOUNT ON

		 SELECT 
            IdContrato,
            IdCliente,
            FechaInicio,
            FechaFin,
            EstadoContrato
    FROM CONTRATO
    WHERE IdContrato = @IdContrato

END