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
