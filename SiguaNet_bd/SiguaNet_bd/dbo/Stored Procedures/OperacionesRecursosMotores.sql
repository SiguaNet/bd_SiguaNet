------------------------OPERACIONES-RECURSOS MOTORES-------------------------------

create procedure OperacionesRecursosMotores (@idVehiculo int, @matricula varchar(7), @modelo varchar(30), @codigoOP int)as begin	if @codigoOP = 1	begin	if exists(select idVehiculo from RECURSOS_MOTORES where idVehiculo = @idVehiculo) 		raiserror('Ya existe un vehículo con ese id, ¡por favor ingrese uno valido!',16,1)	else		insert into RECURSOS_MOTORES values(@matricula, @modelo)	end	if @codigoOP = 2	begin	if exists(select idVehiculo from RECURSOS_MOTORES where idVehiculo = @idVehiculo) 		update RECURSOS_MOTORES set matricula = @matricula, modelo = @modelo where idVehiculo = @idVehiculo	else		raiserror('No existe un vehículo con ese id, ¡por favor ingrese uno valido!',16,1)
		end
end
