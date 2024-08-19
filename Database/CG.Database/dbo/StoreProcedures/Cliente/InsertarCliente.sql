CREATE PROCEDURE dbo.InsertarCliente
    @Cedula VARCHAR(20),
    @Nombre VARCHAR(50),
    @Apellido1 VARCHAR(50),
    @Apellido2 VARCHAR(50),
    @Direccion VARCHAR(200),
    @Telefono VARCHAR(20),
    @Email VARCHAR(100),
    @IdUbicacion INT

AS

BEGIN

SET NOCOUNT ON

BEGIN TRANSACTION TRA
			

	BEGIN TRY
	
		---CODE

		 DECLARE @EmailEncriptado VARBINARY(256)



		  -- Abrir la clave simétrica
    OPEN SYMMETRIC KEY SimKeyClientes
    DECRYPTION BY CERTIFICATE CertClientes;

	-- Encriptar el email
    SET @EmailEncriptado = ENCRYPTBYKEY(KEY_GUID('SimKeyClientes'), @Email)
    
    INSERT INTO CLIENTE (Cedula, Nombre, Apellido1, Apellido2, Direccion, Telefono, Email, EmailEncriptado, IdUbicacion)
    VALUES (@Cedula, @Nombre, @Apellido1, @Apellido2, @Direccion, @Telefono, @Email, @EmailEncriptado, @IdUbicacion)
    
    -- Cerrar la clave simétrica
    CLOSE SYMMETRIC KEY SimKeyClientes;
    
    



		COMMIT TRANSACTION TRA
	
		SELECT 0 AS CodeError
				, '' AS MsgError
                ,SCOPE_IDENTITY() AS IdCliente

	END TRY

	BEGIN CATCH
			SELECT	ERROR_NUMBER() AS CodeError
				, ERROR_MESSAGE() AS MsgError
                ,NULL AS IdCliente

			ROLLBACK TRANSACTION TRA
	END CATCH 
END