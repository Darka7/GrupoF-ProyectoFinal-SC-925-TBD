CREATE PROCEDURE dbo.ActualizarServicio
	@IdServicio INT,
    @IdContrato INT,
    @IdTipoServicio INT,
    @IdEquipo INT,
    @FechaInstalacion DATETIME

AS

BEGIN

SET NOCOUNT ON

BEGIN TRANSACTION TRA
			

	BEGIN TRY
	
		---CODE

		UPDATE SERVICIO
    SET IdContrato = @IdContrato,
        IdTipoServicio = @IdTipoServicio,
        IdEquipo = @IdEquipo,
        FechaInstalacion = @FechaInstalacion
    WHERE IdServicio = @IdServicio

		COMMIT TRANSACTION TRA
	
		SELECT 0 AS CodeError
				, '' AS MsgError

	END TRY

	BEGIN CATCH
			SELECT	ERROR_NUMBER() AS CodeError
				, ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRA
	END CATCH 
END