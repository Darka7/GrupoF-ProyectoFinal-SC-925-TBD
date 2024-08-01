	CREATE MASTER KEY ENCRYPTION
		BY PASSWORD = '1aB#cD@fG%hI^jK7&lM!nO)pQ+rS-tU*vW(xY=3z';
	GO

	CREATE CERTIFICATE CertClientes 
	WITH SUBJECT = 'Certificado para encriptar datos de clientes';
	GO

		CREATE SYMMETRIC KEY SimKeyClientes 

		WITH ALGORITHM = AES_256 

		ENCRYPTION BY CERTIFICATE CertClientes; 

		GO