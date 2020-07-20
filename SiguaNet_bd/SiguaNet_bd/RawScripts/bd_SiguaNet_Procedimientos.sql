USE bd_SiguaNet;
GO

------------------------OPERACIONES-PERSONAS CLIENTES--------------------------------------------------

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
go

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
go

create procedure OperacionesAdministradores(@numeroIdentidad varchar(13), @contrasena varchar(20), @codigoOP int)
as begin
	if @codigoOP = 1
	begin
		if exists(select numeroIdentidad from ADMINISTRADORES where numeroIdentidad = @numeroIdentidad)
			raisError('Ya existe un registro con este ID', 16, 1)
		else if exists(select numeroIdentidad from PERSONAL where numeroIdentidad = @numeroIdentidad)
			insert into ADMINISTRADORES values(@numeroIdentidad, @contrasena)
		else
			raisError('No existe un registro con este ID en la tabla PERSONAL, creelo', 16, 1)
	end

	if @codigoOP = 2
	begin
		if exists(select numeroIdentidad from ADMINISTRADORES where numeroIdentidad = @numeroIdentidad)
		update ADMINISTRADORES set numeroIdentidad = @numeroIdentidad, contrasena = @contrasena where numeroIdentidad = @numeroIdentidad
	else
		raiserror('No existe un Numero de Identidad con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
GO
------------------------OPERACIONES-GESTION DE TICKETS--------------------------------------------------

create procedure OperacionesGestionTickets(@idTicket int, @numeroIdentidadC varchar(13), @idPersonal int, @estado varchar(20), @idOperacion int, @fechaInicio datetime, @fechaFin datetime, @codigoOP int)
as begin
	if @codigoOP = 1
	begin
	if exists(select idTicket from GESTION_TICKETS where idTicket = @idTicket)
		raiserror('Ya existe un Ticket con ese id, ¡por favor ingrese uno valido!',16,1)
	else if  exists(select numeroIdentidad from CLIENTES where numeroIdentidad = @numeroIdentidadC) and exists(select idPersonal from PERSONAL where idPersonal = @idPersonal)
		insert into GESTION_TICKETS(numeroIdentidadC, idPersonal, estado, idOperacion, fechaInicio, fechaFin) 
			values(@numeroIdentidadC, @idPersonal, @estado, @idOperacion, @fechaInicio, @fechaFin)
	else
		raiserror('NO existe un numero de identidad ni empleado con ese id, ¡por favor ingrese uno valido!',16,1)
	end

	begin
	if @codigoOP = 2
		if exists(select idTicket from GESTION_TICKETS where idTicket = @idTicket)
		update GESTION_TICKETS set numeroIdentidadC = @numeroIdentidadC, idPersonal = @idPersonal, estado = @estado, idOperacion = @idOperacion, fechaInicio = @fechaInicio, fechaFin = @fechaFin where idTicket = @idTicket
	else
		raiserror('No existe una Ticket con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
go
------------------------OPERACIONES-TICKETS--------------------------------------------

create procedure operacionesTickets(@idOperacion int, @descripcion varchar(80), @nombreOperacion varchar(40), @codigoOP int)
as begin
	if @codigoOP = 1
	begin
	if exists(select idOperacion from OPERACIONES where idOperacion = @idOperacion)
		raiserror('Ya existe una Operacion con ese id, ¡por favor ingrese uno valido!',16,1)
	else
		insert into OPERACIONES values(@descripcion, @nombreOperacion)
	end

	if @codigoOP = 2
	begin
	if exists(select idOperacion from OPERACIONES where idOperacion = @idOperacion)
		update OPERACIONES set descripcion = @descripcion, nombreOperacion = @nombreOperacion where idOperacion = @idOperacion
	else
		raiserror('No existe una Operacion con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
go
------------------------OPERACIONES-PLANES DE INTERNET---------------------YA

create procedure OperacionesPlanesInternet 
@idPaquete as int, @nombrePaquete as varchar(40), @velocidad as int, @precio as float, @codigoOP as int
as begin
	if @codigoOP = 1
	begin
	if exists(select idPaquete from PLANES_INTERNET where idPaquete = @idPaquete)
		raiserror('Ya existe un plan con ese id, ¡por favor ingrese uno valido!',16,1)
	else
		insert into PLANES_INTERNET values(@nombrePaquete, @velocidad, @precio)
	end

	begin
	if @codigoOP = 2
	if exists(select idPaquete from PLANES_INTERNET where idPaquete = @idPaquete)
		update PLANES_INTERNET set nombrePaquete = @nombrePaquete, velocidad = @velocidad, precio = @precio where idPaquete = @idPaquete
	else
		raiserror('No existe un plan con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
go
------------------------OPERACIONES-FACTURAS----------------------------------------

create procedure operacionesFactura (@idFactura int, @numeroIdentidadC varchar(13), @fechaPago datetime, @codigoOP int)
as begin
	if @codigoOP = 1
	begin
	if exists(select idFactura from FACTURA where idFactura = @idFactura) and exists(select numeroIdentidad from CLIENTES where numeroIdentidad = @numeroIdentidadC)
		raiserror('Ya existe una factura con ese id o el numero de identidad no ha sido registrado, ¡por favor ingrese uno valido!',16,1)
	else
		insert into FACTURA values (@numeroIdentidadC, @fechaPago)
	end
	begin
	if @codigoOP = 2
	if exists(select idFactura from FACTURA where idFactura = @idFactura)
		update FACTURA set numeroIdentidadC = @numeroIdentidadC, fechaPago = @fechaPago where idFactura = @idFactura
	else
		raiserror('No existe una Factura con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
go
------------------------OPERACIONES-RECURSOS MOTORES-------------------------------

create procedure OperacionesRecursosMotores (@idVehiculo int, @matricula varchar(7), @modelo varchar(30), @codigoOP int)
as begin

	if @codigoOP = 1
	begin
	if exists(select idVehiculo from RECURSOS_MOTORES where idVehiculo = @idVehiculo) 
		raiserror('Ya existe un vehículo con ese id, ¡por favor ingrese uno valido!',16,1)
	else
		insert into RECURSOS_MOTORES values(@matricula, @modelo)
	end

	if @codigoOP = 2
	begin
	if exists(select idVehiculo from RECURSOS_MOTORES where idVehiculo = @idVehiculo) 
		update RECURSOS_MOTORES set matricula = @matricula, modelo = @modelo where idVehiculo = @idVehiculo
	else
		raiserror('No existe un vehículo con ese id, ¡por favor ingrese uno valido!',16,1)
		end
end
go

------------------------OPERACIONES-INVENTARIO--------------------------------------------------
create procedure OperacionesInventario
@idTipoAparato as int, @nombreTipo as varchar(20), @cantidad as int, @codigoOP as int
as begin
	if @codigoOP = 1
	begin
	if exists(select idTipoAparato from INVENTARIO where idTipoAparato = @idTipoAparato)
	raiserror('Ya existe un tipo de aparato con ese id, ¡por favor ingrese uno valido!',16,1)
	else 
	insert into INVENTARIO values(@nombreTipo, @cantidad)
	end

	begin
	if @codigoOP = 2
	if exists(select idTipoAparato from INVENTARIO where idTipoAparato = @idTipoAparato) 
	update INVENTARIO set nombreTipo = @nombreTipo, cantidad = @cantidad where idTipoAparato = @idTipoAparato
	else
	raiserror('No existe un tipo de aparato con ese id, ¡por favor ingrese uno valido!',16,1)
	end
	end
go

---------------------------------OPERACIONES-SECTORES-------------------------------------
create procedure OperacionesSectores
@idSector as int, @barrio as varchar(50), @codigoOP int
as begin
	if @codigoOP = 1
	begin
	if exists(select idSector from SECTORES where idSector = @idSector)
	raiserror('Ya existe un sector con ese id, ¡por favor ingrese uno valido!',16,1)
	else 
	insert into SECTORES values(@barrio)
	end

	begin
	if @codigoOP = 2
	if exists(select idSector from SECTORES where idSector = @idSector) 
	update SECTORES set barrio = @barrio where idSector = @idSector
	else
	raiserror('No existe un sector con ese id, ¡por favor ingrese uno valido!',16,1)
	end
end
go

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
go

create procedure consultaInformacionClienteTicket( @numeroIdentidad varchar(13))
as begin
	
		if exists(select numeroIdentidadC from GESTION_TICKETS WHERE numeroIdentidadC = @numeroIdentidad)
		begin
			select gt.idTicket, CONCAT(dp.nombres, ' ', dp.primerApellido, ' ', dp.segundoApellido) as 'Nombre Cliente', op.nombreOperacion as 'Nombre Operacion', pli.nombrePaquete as 'Paquete'
					from OPERACIONES op 
					inner join GESTION_TICKETS gt on op.idOperacion = gt.idOperacion
					inner join CLIENTES cl on gt.numeroIdentidadC = cl.numeroIdentidad
					inner join DATOS_PERSONAS dp on cl.numeroIdentidad = dp.numeroIdentidad 
					inner join PLANES_INTERNET pli on cl.idPaquete = pli.idPaquete where gt.numeroIdentidadC = @numeroIdentidad
					UNION
			select op.descripcion as 'Descripcion Operacion', convert(varchar(50), fechaInicio) as 'Fecha Inicio', fechaFin as 'Fecha Fin', CONCAT(dp.nombres, ' ', dp.primerApellido) as 'Nombre Empleado' from OPERACIONES op
					inner join GESTION_TICKETS gt on op.idOperacion = gt.idOperacion
					inner join PERSONAL p on gt.idPersonal = p.idPersonal
					inner join DATOS_PERSONAS dp on p.numeroIdentidad = dp.numeroIdentidad where gt.numeroIdentidadC = @numeroIdentidad
		end
		else
			raiserror('No existe un numero de identidad con ese valor, ¡por favor ingrese uno valido!',16,1)
end
go

create procedure consultaInformacionFacturas( @numeroIdentidad varchar(13))
as begin
	
		if exists(select numeroIdentidadC from FACTURA WHERE numeroIdentidadC = @numeroIdentidad)
		begin
			select f.idFactura as 'ID Factura', f.numeroIdentidadC as 'Numero Identidad', CONCAT(dp.nombres, ' ', dp.primerApellido, ' ', dp.segundoApellido) as 'Nombre', 
			pli.nombrePaquete as 'Nombre Paquete', pli.precio as 'Precio', f.fechaPago, cl.pagosCliente as 'Cant Pagos Cliente'  from FACTURA f
			inner join CLIENTES cl on f.numeroIdentidadC = cl.numeroIdentidad
			inner join DATOS_PERSONAS dp on cl.numeroIdentidad = dp.numeroIdentidad
			inner join PLANES_INTERNET pli on cl.idPaquete = pli.idPaquete where f.numeroIdentidadC = @numeroIdentidad
		end
		else
			raiserror('No existe un numero de identidad con ese valor, ¡por favor ingrese uno valido!',16,1)
end
go
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
go

--alter procedure comprobarUsuario(@numeroIdentidad varchar(13), @contrasena nvarchar(80), @pasa int output)
--as begin
--	if exists(select numeroIdentidad from ADMINISTRADORES where numeroIdentidad = @numeroIdentidad) and exists(select contrasena from ADMINISTRADORES where contrasena = @contrasena)
--	begin
--	set @pasa = 1
--	return @pasa
--	end
--	else
--	begin
--	set @pasa = 2
--	return @pasa
--	end
	
--end







