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
