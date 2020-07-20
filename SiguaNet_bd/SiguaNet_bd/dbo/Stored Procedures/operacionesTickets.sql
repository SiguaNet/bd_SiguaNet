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
