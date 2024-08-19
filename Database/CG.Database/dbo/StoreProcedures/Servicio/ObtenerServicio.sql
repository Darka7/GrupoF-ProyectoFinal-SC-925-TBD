CREATE PROCEDURE dbo.ObtenerServicio
  @IdServicio INT

AS

BEGIN
SET NOCOUNT ON

SELECT 
    IdServicio,
    IdContrato,
    IdTipoServicio,
    IdEquipo,
    FechaInstalacion
    FROM SERVICIO
    WHERE IdServicio = @IdServicio

END