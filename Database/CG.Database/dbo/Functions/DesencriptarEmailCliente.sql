CREATE FUNCTION dbo.DesencriptarEmailCliente
(
	@EmailEncriptado VARBINARY(256)=NULL 
)
RETURNS  NVARCHAR(100)
AS
BEGIN

 DECLARE @EmailDesencriptado NVARCHAR(100)=NULL;

 OPEN SYMMETRIC KEY SimKeyClientes
    DECRYPTION BY CERTIFICATE CertClientes;



	 SELECT @EmailDesencriptado = CONVERT(NVARCHAR(100), 
        DecryptByKey(@EmailEncriptado))
   
	CLOSE SYMMETRIC KEY SimKeyClientes;

	IF (@EmailDesencriptado IS NULL) PRINT 'No se encontró un email encriptado'

	RETURN @EmailDesencriptado
END
