
------------------------OPERACIONES-PERSONAS EMPLEADOS--------------------------------------------------

create procedure OperacionesPersonaPE(@numeroIdentidad varchar(13), @nombres varchar(25), @primerApellido varchar (15), @segundoApellido varchar(15), @numeroTelefono int, @numeroCasa int,
@idSector int, @referenciasDireccion varchar(80), @idVehiculo int, @estado varchar(15), @codigoOP int)
as begin
	if @codigoOP = 1
		begin
		IF exists(select numeroIdentidad from CLIENTES where numeroIdentidad = @numeroIdentidad)
			raisError('Ya existe un registro', 16, 1)
		else
		
		
		insert into DATOS_PERSONAS(numeroIdentidad, nombres, primerApellido, segundoApellido, numeroTelefono, numeroCasa, idSector, referenciasDireccion) 
		values(@numeroIdentidad, @nombres, @primerApellido, @segundoApellido, @numeroTelefono, @numeroCasa, @idSector, @referenciasDireccion)
		
		insert into PERSONAL(numeroIdentidad, idVehiculo, estado)
		values(@numeroIdentidad, @idVehiculo, @estado)
		end

	if @codigoOP = 2
	begin
		if exists(select numeroIdentidad from CLIENTES where numeroIdentidad = @numeroIdentidad)
		begin
		update DATOS_PERSONAS set numeroIdentidad = @numeroIdentidad, nombres = @nombres, primerApellido = @primerApellido, segundoApellido = @segundoApellido, numeroTelefono = @numeroTelefono, numeroCasa = @numeroCasa, idSector = @idSector, referenciasDireccion = @referenciasDireccion where numeroIdentidad = @numeroIdentidad
		update PERSONAL set numeroIdentidad = @numeroIdentidad, idVehiculo = @idVehiculo, estado = @estado where numeroIdentidad = @numeroIdentidad
		end
	else
		raiserror('No existe un Numero de Identidad con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
