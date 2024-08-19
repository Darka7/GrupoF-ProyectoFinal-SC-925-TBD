CREATE PROCEDURE dbo.InsertarContrato
 @IdCliente INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @EstadoContrato VARCHAR(15)

AS

BEGIN

SET NOCOUNT ON

BEGIN TRANSACTION TRA
			

	BEGIN TRY
	
		---CODE

		INSERT INTO CONTRATO (IdCliente, FechaInicio, FechaFin, EstadoContrato)
    VALUES (@IdCliente, @FechaInicio, @FechaFin, @EstadoContrato)
    

		COMMIT TRANSACTION TRA
	
		SELECT 0 AS CodeError
				, '' AS MsgError
				, SCOPE_IDENTITY() AS IdContrato

	END TRY

	BEGIN CATCH
			SELECT	ERROR_NUMBER() AS CodeError
				, ERROR_MESSAGE() AS MsgError
				, NULL AS IdContrato

			ROLLBACK TRANSACTION TRA
	END CATCH 
END