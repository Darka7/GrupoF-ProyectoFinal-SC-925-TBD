

DECLARE @ISDemo varchar(1)= '$(IsDemo)';

print @ISDemo
IF (@ISDemo='1') BEGIN

EXEC CargaDatosIniciales;

END
GO


