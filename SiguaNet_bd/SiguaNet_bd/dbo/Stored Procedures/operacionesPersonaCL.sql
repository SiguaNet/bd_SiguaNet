create procedure operacionesPersonaCL(@numeroIdentidad varchar(13), @nombres varchar(25), @primerApellido varchar (15), @segundoApellido varchar(15), @numeroTelefono int, @numeroCasa int,
@idSector int, @referenciasDireccion varchar(80), @idPaquete int, @pagosCliente int, @estadoC varchar(30), @codigoOP int)
as begin
	if @codigoOP = 1
	begin
		IF exists(select numeroIdentidad from CLIENTES where numeroIdentidad = @numeroIdentidad)
			raisError('Ya existe un registro', 16, 1)
		else
		insert into DATOS_PERSONAS(numeroIdentidad, nombres, primerApellido, segundoApellido, numeroTelefono, numeroCasa, idSector, referenciasDireccion) 
		values(@numeroIdentidad, @nombres, @primerApellido, @segundoApellido, @numeroTelefono, @numeroCasa, @idSector, @referenciasDireccion)
		
		insert into CLIENTES(numeroIdentidad, idPaquete, pagosCliente, estadoC)
		values(@numeroIdentidad, @idPaquete, @pagosCliente, @estadoC)
		
	end
	
	if @codigoOP = 2
	begin
	if exists(select numeroIdentidad from CLIENTES where numeroIdentidad = @numeroIdentidad)
	begin
		update DATOS_PERSONAS set numeroIdentidad = @numeroIdentidad, nombres = @nombres, primerApellido = @primerApellido, segundoApellido = @segundoApellido, numeroTelefono = @numeroTelefono, numeroCasa = @numeroCasa, idSector = @idSector, referenciasDireccion = @referenciasDireccion where numeroIdentidad = @numeroIdentidad
		update CLIENTES set numeroIdentidad = @numeroIdentidad, idPaquete = @idPaquete, pagosCliente = @pagosCliente, estadoC = @estadoC where numeroIdentidad = @numeroIdentidad
		end
	else
		raiserror('No existe un Numero de Identidad con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
