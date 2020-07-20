create procedure consultaInformacionClienteLety(@numeroIdentidad varchar(13))
as begin
	
		if exists(select numeroIdentidad from CLIENTES WHERE numeroIdentidad = @numeroIdentidad) and 
				exists(select numeroIdentidad FROM DATOS_PERSONAS where numeroIdentidad = @numeroIdentidad)
		begin
			select dp.numeroIdentidad as 'Numero de Indentidad', CONCAT(dp.nombres, ' ', dp.primerApellido, ' ', dp.segundoApellido) as 'Nombre', 
			dp.numeroTelefono as 'Numero Telefono', dp.numeroCasa as 'Numero Casa', se.barrio as 'Barrio', 
			dp.referenciasDireccion as 'Referencias Direccion', pli.nombrePaquete as 'Precio Paquete', c.pagosCliente as 'Cant Pagos Cliente'  from SECTORES se
			inner join DATOS_PERSONAS dp on se.idSector = dp.idSector
			inner join CLIENTES c on dp.numeroIdentidad = c.numeroIdentidad
			inner join PLANES_INTERNET pli on c.idPaquete = pli.idPaquete where dp.numeroIdentidad = @numeroIdentidad
		end
		else
			raiserror('No existe un numero de identidad con ese valor, ¡por favor ingrese uno valido!',16,1)
end
