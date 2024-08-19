﻿CREATE PROCEDURE dbo.EliminarContrato
@IdContrato INT

AS

BEGIN

SET NOCOUNT ON

BEGIN TRANSACTION TRA
			

	BEGIN TRY
	
		---CODE

		DELETE FROM CONTRATO WHERE IdContrato = @IdContrato

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