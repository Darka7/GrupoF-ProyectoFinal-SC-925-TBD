CREATE PROCEDURE dbo.InsertarServicio
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

		  INSERT INTO SERVICIO (IdContrato, IdTipoServicio, IdEquipo, FechaInstalacion)
			VALUES (@IdContrato, @IdTipoServicio, @IdEquipo, @FechaInstalacion)
    


		COMMIT TRANSACTION TRA
	
		SELECT 0 AS CodeError
				, '' AS MsgError
				,SCOPE_IDENTITY() AS IdServicio

	END TRY

	BEGIN CATCH
			SELECT	ERROR_NUMBER() AS CodeError
				, ERROR_MESSAGE() AS MsgError
				,NULL AS IdServicio

			ROLLBACK TRANSACTION TRA
	END CATCH 
END