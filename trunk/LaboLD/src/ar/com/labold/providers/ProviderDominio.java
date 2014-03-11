package ar.com.labold.providers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.dto.RolDTO;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.Usuario;


public abstract class ProviderDominio {

	public static Usuario getUsuario(UsuarioDTO usuarioDTO, Rol rol) {

		Usuario usuario = new Usuario();
		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	public static Usuario getUsuario(Usuario usuario, UsuarioDTO usuarioDTO, Rol rol) {

		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	public static Rol getRol(RolDTO rolDTO) {

		Rol rol = new Rol();
		rol.setRol(rolDTO.getRol());
		rol.setMenues(new ArrayList<ItemMenu>());

		return rol;
	}	
	
	public static Paciente getPaciente(PacienteDTO pacienteDTO) {

		Paciente paciente = new Paciente();

		paciente.setApellido(pacienteDTO.getApellido());
		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setDni(pacienteDTO.getDni());
		paciente.setEmail(pacienteDTO.getEmail());
		paciente.setId(pacienteDTO.getId());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setTelefono(pacienteDTO.getTelefono());
		
		return paciente;
	}	
	
	/*public static Localidad getLocalidad(LocalidadDTO localidadDTO) {

		Localidad localidad = new Localidad();
		localidad.setNombre(localidadDTO.getNombre());
		return localidad;
	}

	public static Localidad getLocalidad(Localidad localidad,
			LocalidadDTO localidadDTO) {

		localidad.setNombre(localidadDTO.getNombre());
		return localidad;
	}

	public static Periodo getPeriodo(PeriodoDTO periodoDTO) {

		Periodo periodo = new Periodo();
		periodo.setPeriodo(periodoDTO.getPeriodo());

		for (VencimientoPeriodoDTO vencimientoDTO : periodoDTO
				.getVencimientoPeriodoDTO()) {
			periodo.getVencimientoPeriodo().add(
					ProviderDominio.getVencimientoPeriodo(periodo,
							vencimientoDTO));
		}

		return periodo;
	}

	public static VencimientoPeriodo getVencimientoPeriodo(Periodo periodo,
			VencimientoPeriodoDTO vencimientoPeriodoDTO) {

		VencimientoPeriodo vencimientoPeriodo = new VencimientoPeriodo();

		vencimientoPeriodo.setPeriodo(periodo);
		vencimientoPeriodo.setFecha(Fecha
				.stringDDMMAAAAToUtilDate(vencimientoPeriodoDTO.getFecha()));
		;

		return vencimientoPeriodo;
	}

	public static Periodo getPeriodo(Periodo periodo, PeriodoDTO periodoDTO) {

		periodo.setPeriodo(periodoDTO.getPeriodo());

		for (VencimientoPeriodoDTO vencDTO : periodoDTO
				.getVencimientoPeriodoDTO()) {

			for (VencimientoPeriodo venc : periodo.getVencimientoPeriodo()) {

				if (vencDTO.getId().longValue() == venc.getId().longValue()) {

					venc.setFecha(Fecha.stringDDMMAAAAToUtilDate(vencDTO
							.getFecha()));
				}
			}
		}

		return periodo;
	}

	// Se usa en el alta de Entidad, por lo tanto no seteo las Marcas y Señales
	// pq no tiene.
	public static Entidad getEntidad(EntidadDTO entidadDTO, Localidad localidad) {

		Entidad entidad = null;
		if (TipoDeEntidad.PRD.getName().equalsIgnoreCase(
				entidadDTO.getTipoEntidad())) {
			entidad = new Productor();
		} else {
			entidad = new RecursosNaturales();
		}

		entidad.setDireccion(entidadDTO.getDireccion());
		entidad.setEmail(entidadDTO.getEmail());
		entidad.setNombre(entidadDTO.getNombre());
		entidad.setTelefono(entidadDTO.getTelefono());
		entidad.setLocalidad(localidad);
		entidad.setNroMatricula(entidadDTO.getNroMatricula());
		entidad.setNroExpediente(entidadDTO.getNroExpediente());
		entidad.setCuit(entidadDTO.getCuit());
		entidad.setCuil(entidadDTO.getCuil());
		entidad.setDni(entidadDTO.getDni());
		entidad.setTipoDocumento(entidadDTO.getTipoDocumento());
		entidad.setCodigoPostal(entidadDTO.getCodigoPostal());

		return entidad;
	}

	// Se usa en la modificacion de Entidad, por lo tanto no seteo las Marcas y
	// Señales pq no se modifican.
	public static Entidad getEntidad(Entidad entidad, EntidadDTO entidadDTO,
			Localidad localidad) {

		entidad.setDireccion(entidadDTO.getDireccion());
		entidad.setEmail(entidadDTO.getEmail());
		entidad.setLocalidad(localidad);
		entidad.setNombre(entidadDTO.getNombre());
		entidad.setTelefono(entidadDTO.getTelefono());
		entidad.setNroMatricula(entidadDTO.getNroMatricula());
		entidad.setCuit(entidadDTO.getCuit());
		entidad.setCuil(entidadDTO.getCuil());
		entidad.setDni(entidadDTO.getDni());
		entidad.setTipoDocumento(entidadDTO.getTipoDocumento());
		entidad.setCodigoPostal(entidadDTO.getCodigoPostal());
		return entidad;
	}*/

	/*public static Provincia getProvincia(ProvinciaDTO provinciaDTO) {

		Provincia provincia = new Provincia();
		provincia.setNombre(provinciaDTO.getNombre());
		return provincia;
	}

	public static Provincia getProvincia(Provincia provincia,
			ProvinciaDTO provinciaDTO) {

		provincia.setNombre(provinciaDTO.getNombre());
		return provincia;
	}

	public static Localidad getLocalidad(LocalidadDTO localidadDTO,
			Provincia provincia) {

		Localidad localidad = new Localidad();
		localidad.setNombre(localidadDTO.getNombre());
		localidad.setProvincia(provincia);

		return localidad;
	}

	public static Localidad getLocalidad(LocalidadDTO localidadDTO,
			Localidad localidad, Provincia provincia) {

		localidad.setNombre(localidadDTO.getNombre());
		localidad.setProvincia(provincia);

		return localidad;
	}

	public static Establecimiento getEstablecimiento(
			EstablecimientoDTO establecimientoDTO, Localidad localidad) {
		Establecimiento establecimiento = new Establecimiento();
		establecimiento.setNombre(establecimientoDTO.getNombre());
		establecimiento.setLocalidad(localidad);
		return establecimiento;
	}

	public static Establecimiento getEstablecimiento(
			EstablecimientoDTO establecimientoDTO,
			Establecimiento establecimiento, Localidad localidad) {
		establecimiento.setNombre(establecimientoDTO.getNombre());
		establecimiento.setLocalidad(localidad);
		return establecimiento;
	}

	public static Marca getMarca(MarcaSenialDTO marcaSenialDTO, Entidad entidad) {

		Marca marca = new Marca();

		marca.setFechaVencimiento(Fecha.stringDDMMAAAAToUtilDate(marcaSenialDTO
				.getFechaVencimiento()));
		marca.setId(marcaSenialDTO.getId());
		marca.setImagen(marcaSenialDTO.getImagen());
		marca.setNumero(marcaSenialDTO.getNumero());
		marca.setBoletaDeposito(ProviderDominio
				.getBoletaDeposito(marcaSenialDTO.getBoletaDeposito()));
		marca.setProductor(entidad);
		String nombreImagen = marcaSenialDTO.getNombreImagen();
		if (marcaSenialDTO.getNombreImagen().contains(File.separator)) {
			nombreImagen = marcaSenialDTO.getNombreImagen().substring(
					marcaSenialDTO.getNombreImagen()
							.lastIndexOf(File.separator));
		}
		marca.setNombreImagen(nombreImagen);

		return marca;
	}

	public static Senial getSenial(MarcaSenialDTO marcaSenialDTO,
			Entidad entidad) {

		Senial senial = new Senial();

		senial.setFechaVencimiento(Fecha
				.stringDDMMAAAAToUtilDate(marcaSenialDTO.getFechaVencimiento()));
		senial.setId(marcaSenialDTO.getId());
		senial.setImagen(marcaSenialDTO.getImagen());
		senial.setNumero(marcaSenialDTO.getNumero());
		senial.setBoletaDeposito(ProviderDominio
				.getBoletaDeposito(marcaSenialDTO.getBoletaDeposito()));
		senial.setProductor(entidad);
		String nombreImagen = marcaSenialDTO.getNombreImagen();
		if (marcaSenialDTO.getNombreImagen().contains(File.separator)) {
			nombreImagen = marcaSenialDTO.getNombreImagen().substring(
					marcaSenialDTO.getNombreImagen()
							.lastIndexOf(File.separator));
		}
		senial.setNombreImagen(nombreImagen);

		return senial;
	}

	public static BoletaDeposito getBoletaDeposito(BoletaDepositoDTO boletaDTO) {

		BoletaDeposito boleta = new BoletaDeposito();
		if (boletaDTO.getFechaPago() != null
				&& !boletaDTO.getFechaPago().equals("")) {
			boleta.setFechaPago(Fecha.stringDDMMAAAAToUtilDate(boletaDTO
					.getFechaPago()));
		}
		boleta.setFechaVencimiento(Fecha.stringDDMMAAAAToUtilDate(boletaDTO
				.getFechaVencimiento()));
		boleta.setId(boletaDTO.getId());
		boleta.setMonto(boletaDTO.getMonto());
		boleta.setNumero(boletaDTO.getNumero());

		return boleta;
	}

	public static BoletaDeposito getBoletaDepositoParaGuias(
			BoletaDepositoDTO boletaDTO, List<Guia> listaGuias,
			Productor productor) {

		BoletaDeposito boleta = ProviderDominio.getBoletaDeposito(boletaDTO);
		boleta.setProductor(productor);
		boleta.setGuias(listaGuias);

		return boleta;
	}

	public static Denuncia getDenuncia(DenunciaDTO denunciaDTO) {
		Denuncia denuncia = new Denuncia();
		denuncia.setNumeroDeDenuncia(denunciaDTO.getNumeroDeDenuncia());
		denuncia.setNumeroDeLlamado(denunciaDTO.getNumeroDeLlamado());
		denuncia.setDesde(Fecha.stringDDMMAAAAToUtilDate(denunciaDTO.getDesde()));
		denuncia.setHasta(Fecha.stringDDMMAAAAToUtilDate(denunciaDTO.getHasta()));
		denuncia.setLugar(denunciaDTO.getLugar());
		return denuncia;

	}

	public static Guia getGuiaLegalizada(GuiaDTO guiaDTO, Marca marca,
			Productor productor, Senial senial, Usuario usuario) {

		Guia guia = new Guia();
		guia.setFechaLegalizacion(Fecha.stringDDMMAAAAToUtilDate(guiaDTO
				.getFechaLegalizacion()));
		guia.setMarca(marca);
		guia.setNumero(guiaDTO.getNumero());
		guia.setNumeroInterno(guiaDTO.getNumeroInterno());
		guia.setPeriodo(guiaDTO.getPeriodo());
		guia.setProductor(productor);
		guia.setSenial(senial);
		guia.setTipoEstadoGuia(TipoEstadoGuia.LEGALIZADA);
		guia.setAgenteFirmante(usuario);
		
		return guia;
	}

	public static void getGuiaDevuelta(Guia guia, GuiaDTO guiaDTO,
			Establecimiento establecimientoOrigen,
			Establecimiento establecimientoDestino, TipoAnimal tipoAnimal) {

		guia.setCanon(guiaDTO.getCanon());
		guia.setCantidad(guiaDTO.getCantidad());
		guia.setEstablecimientoOrigen(establecimientoOrigen);
		guia.setEstablecimientoDestino(establecimientoDestino);
		guia.setFechaTransito(Fecha.stringDDMMAAAAToUtilDate(guiaDTO
				.getFechaTransito()));
		guia.setFinalidad(guiaDTO.getFinalidad());
		guia.setInteres(guiaDTO.getInteres());
		guia.setMedioTransporte(guiaDTO.getMedioTransporte());
		guia.setMonto(guiaDTO.getMonto());
		guia.setNroDTA(guiaDTO.getNroDTA());
		guia.setPatente(guiaDTO.getPatente());
		guia.setPatenteAcoplado(guiaDTO.getPatenteAcoplado());
		guia.setTipoAnimal(tipoAnimal);
		guia.setTipoEstadoGuia(TipoEstadoGuia.DEVUELTA);
		guia.setTrasporteACargo(guiaDTO.getTrasporteACargo());

	}

	public static Autorizado getAutorizado(AutorizadoDTO autorizadoDTO) {
		Autorizado autorizado = new Autorizado();
		autorizado.setNombre(autorizadoDTO.getNombre());
		autorizado.setDni(autorizadoDTO.getDni());
		return autorizado;
	}

	public static TipoAnimal getTipoAnimal(TipoAnimalDTO tipoAnimalDTO,
			Categoria categoria) {
		TipoAnimal tipoAnimal = new TipoAnimal();
		tipoAnimal.setDescripcion(tipoAnimalDTO.getDescripcion());
		tipoAnimal.setCategoria(categoria);
		tipoAnimal.setValor(Double.valueOf(tipoAnimalDTO.getValor()));
		return tipoAnimal;
	}

	public static ProductorEnEstablecimiento getProductorEnEstablecimiento(
			Productor productor, Establecimiento establecimiento,
			TipoAnimal tipoAnimal, int stock) {

		ProductorEnEstablecimiento productorEnEstablecimiento = new ProductorEnEstablecimiento();
		productorEnEstablecimiento.setEstablecimiento(establecimiento);
		productorEnEstablecimiento.setProductor(productor);
		productorEnEstablecimiento.getAnimalesEnEstablecimiento().add(
				getAnimalesEnEstablecimiento(productorEnEstablecimiento,
						tipoAnimal, stock));

		return productorEnEstablecimiento;
	}

	public static AnimalEnEstablecimiento getAnimalesEnEstablecimiento(
			ProductorEnEstablecimiento productorEnEstablecimiento,
			TipoAnimal tipoAnimal, int stock) {

		AnimalEnEstablecimiento animalEnEstablecimiento = new AnimalEnEstablecimiento();
		animalEnEstablecimiento.setStock(stock);
		animalEnEstablecimiento.setTipoAnimal(tipoAnimal);
		animalEnEstablecimiento
				.setProductorEnEstablecimiento(productorEnEstablecimiento);

		return animalEnEstablecimiento;
	}*/
}
