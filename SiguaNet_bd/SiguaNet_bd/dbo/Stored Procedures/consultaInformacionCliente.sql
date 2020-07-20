create procedure consultaInformacionCliente( @numeroIdentidad varchar(13))
as begin
	
		if exists(select numeroIdentidad from CLIENTES WHERE numeroIdentidad = @numeroIdentidad) and 
				exists(select numeroIdentidad FROM DATOS_PERSONAS where numeroIdentidad = @numeroIdentidad)
		begin
			select numeroIdentidad as 'Numero de Indentidad', CONCAT(nombres, ' ', primerApellido, ' ', segundoApellido) as 'Nombre', 
			numeroTelefono as 'Numero Telefono', referenciasDireccion as 'Referencias Direccion'  from DATOS_PERSONAS where numeroIdentidad = @numeroIdentidad
		end
		else
			raiserror('No existe un numero de identidad con ese valor, ¡por favor ingrese uno valido!',16,1)
end
