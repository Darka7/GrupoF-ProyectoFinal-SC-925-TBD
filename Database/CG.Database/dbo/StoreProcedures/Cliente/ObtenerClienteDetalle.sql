CREATE PROCEDURE dbo.ObtenerClienteDetalle
   @IdCliente INT

AS

BEGIN
SET NOCOUNT ON

    SELECT 
        IdCliente,
        Cedula,
        Nombre,
        Apellido1,
        Apellido2,
        Direccion,
        Telefono,
        Email,
        IdUbicacion
    FROM CLIENTE

    WHERE IdCliente = @IdCliente


END