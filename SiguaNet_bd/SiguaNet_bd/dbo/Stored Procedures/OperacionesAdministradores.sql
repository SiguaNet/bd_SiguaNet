CREATE procedure OperacionesAdministradores(@numeroIdentidad varchar(13), @contrasena varchar(20), @codigoOP int)
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
