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
