﻿CREATE PROCEDURE dbo.ActualizarContrato
 @IdContrato INT,
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


		 UPDATE CONTRATO
    SET IdCliente = @IdCliente,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        EstadoContrato = @EstadoContrato
    WHERE IdContrato = @IdContrato

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