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
			select op.descripcion as 'Descripcion Operacion', fechaInicio as 'Fecha Inicio', fechaFin as 'Fecha Fin', CONCAT(dp.nombres, ' ', dp.primerApellido) as 'Nombre Empleado' from OPERACIONES op
					inner join GESTION_TICKETS gt on op.idOperacion = gt.idOperacion
					inner join PERSONAL p on gt.idPersonal = p.idPersonal
					inner join DATOS_PERSONAS dp on p.numeroIdentidad = dp.numeroIdentidad where gt.numeroIdentidadC = @numeroIdentidad
		end
		else
			raiserror('No existe un numero de identidad con ese valor, ¡por favor ingrese uno valido!',16,1)
end
