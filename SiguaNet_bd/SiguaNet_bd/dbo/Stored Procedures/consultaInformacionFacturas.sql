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
