CREATE PROCEDURE dbo.ActualizarCliente
@IdCliente INT,
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

		  DECLARE @EmailEncriptado VARBINARY(256);


		    -- Abrir la clave simétrica
    OPEN SYMMETRIC KEY SimKeyClientes
    DECRYPTION BY CERTIFICATE CertClientes;


	-- Encriptar el nuevo email
    SET @EmailEncriptado = ENCRYPTBYKEY(KEY_GUID('SimKeyClientes'), @Email)



	UPDATE CLIENTE
    SET Cedula = @Cedula,
        Nombre = @Nombre,
        Apellido1 = @Apellido1,
        Apellido2 = @Apellido2,
        Direccion = @Direccion,
        Telefono = @Telefono,
        Email = @Email,
        EmailEncriptado = @EmailEncriptado,
        IdUbicacion = @IdUbicacion
    WHERE IdCliente = @IdCliente


     CLOSE SYMMETRIC KEY SimKeyClientes;

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