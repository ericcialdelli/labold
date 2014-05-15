package ar.com.labold.providers;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.GrupoPracticaDTO;
import ar.com.labold.dto.ObraSocialDTO;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.dto.RolDTO;
import ar.com.labold.dto.SubItemPracticaDTO;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.SubItemPractica;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValoresEstudio;
import ar.com.labold.utils.Fecha;


public abstract class ProviderDominio {

	//Se usa en el Alta de Usuario
	public static Usuario getUsuario(UsuarioDTO usuarioDTO, Rol rol) {

		Usuario usuario = new Usuario();
		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	//Se usa en la modificacion de Usuario
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
	
	//Se usa en el alta de Paciente
	public static Paciente getPaciente(PacienteDTO pacienteDTO, ObraSocial obraSocial) {

		Paciente paciente = new Paciente();

		paciente.setApellido(pacienteDTO.getApellido());
		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setDni(pacienteDTO.getDni());
		paciente.setEmail(pacienteDTO.getEmail());
		paciente.setId(pacienteDTO.getId());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setTelefono(pacienteDTO.getTelefono());
		paciente.setFechaNacimiento(Fecha
				.stringDDMMAAAAToUtilDate(pacienteDTO.getFechaNacimiento()));
		paciente.setObraSocial(obraSocial);
		
		return paciente;
	}	
	
	//Se usa en la modificacion de Paciente
	public static Paciente getPaciente(Paciente paciente, PacienteDTO pacienteDTO, ObraSocial obraSocial) {

		paciente.setApellido(pacienteDTO.getApellido());
		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setDni(pacienteDTO.getDni());
		paciente.setEmail(pacienteDTO.getEmail());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setTelefono(pacienteDTO.getTelefono());
		paciente.setFechaNacimiento(Fecha
				.stringDDMMAAAAToUtilDate(pacienteDTO.getFechaNacimiento()));
		paciente.setObraSocial(obraSocial);
		
		return paciente;
	}	
	
	//Se usa en el alta de Obra Social
	public static ObraSocial getObraSocial(ObraSocialDTO obraSocialDTO){
		
		ObraSocial obraSocial = new ObraSocial();
		obraSocial.setId(obraSocialDTO.getId());
		obraSocial.setNombre(obraSocialDTO.getNombre());
		
		return obraSocial;
	}	
	
	//Se usa en la modificacion de Obra Social
	public static ObraSocial getObraSocial(ObraSocial obraSocial, ObraSocialDTO obraSocialDTO){
			
		obraSocial.setNombre(obraSocialDTO.getNombre());
		
		return obraSocial;
	}	
	
	//Se usa en el alta de la Practica
	public static Practica getPractica(PracticaDTO practicaDTO, GrupoPractica grupo, SubItemPractica subItem){
		
		Practica practica = new Practica();
		practica.setId(practicaDTO.getId());
		practica.setNombre(practicaDTO.getNombre());
		practica.setGrupoPractica(grupo);
		practica.setSubItemPractica(subItem);
		practica.setUnidad(practicaDTO.getUnidad());
		practica.setValorNormalDesde(practicaDTO.getValorNormalDesde());
		practica.setValorNormalHasta(practicaDTO.getValorNormalHasta());
		practica.setValorReferencia(practicaDTO.getValorReferencia());
		practica.setMayorMenor(practicaDTO.getMayorMenor());
		
		return practica;
	}	
	
	//Se usa en la modificacion de la Practica
	public static Practica getPractica(Practica practica, PracticaDTO practicaDTO){

		practica.setNombre(practicaDTO.getNombre());
		practica.setUnidad(practicaDTO.getUnidad());
		practica.setValorNormalDesde(practicaDTO.getValorNormalDesde());
		practica.setValorNormalHasta(practicaDTO.getValorNormalHasta());
		practica.setValorReferencia(practicaDTO.getValorReferencia());
		practica.setMayorMenor(practicaDTO.getMayorMenor());
		
		return practica;
	}		
	
	//Se usa en el alta del GrupoPractica
	public static GrupoPractica getGrupoPractica(GrupoPracticaDTO grupoPracticaDTO){
		
		GrupoPractica grupoPractica = new GrupoPractica();		
		grupoPractica.setNombre(grupoPracticaDTO.getNombre());
		
		return grupoPractica;
	}	
	
	//Se usa en el alta del SubItemPractica
	public static SubItemPractica getSubItemPractica(SubItemPracticaDTO subItemPracticaDTO, GrupoPractica grupoPractica){
		
		SubItemPractica subItemPractica = new SubItemPractica();
		subItemPractica.setNombre(subItemPracticaDTO.getNombre());
		subItemPractica.setGrupoPractica(grupoPractica);
		
		return subItemPractica;
	}	
	
	//Se usa en el alta del Estudio
	public static Estudio getEstudio(EstudioDTO estudioDTO, Paciente paciente, List<Practica> listaPracticas){
		
		Estudio estudio = new Estudio(); 
		estudio.setId(estudioDTO.getId());
		estudio.setNumero(estudioDTO.getNumero());
		estudio.setPaciente(paciente);
		estudio.setSolicitadoPor(estudioDTO.getSolicitadoPor());
		estudio.setFecha(Fecha.stringDDMMAAAAToUtilDate(estudioDTO.getFecha()));
		
		Map<Long,ValoresEstudio> mapValoresEstudio = new TreeMap<Long,ValoresEstudio>();
		Map<Long,ValorSubItemPractica> mapValorSubItemPractica = new TreeMap<Long,ValorSubItemPractica>();
		long idGrupo;
		long idSubItemPractica;
		ValoresEstudio valoresEstudio;
		ValorSubItemPractica valorSubItemPractica;
		
		//Hay q agregar todas las practicas...
		for (Practica practica : listaPracticas) {
			
			idGrupo = practica.getGrupoPractica().getId();
			valoresEstudio = mapValoresEstudio.get(idGrupo);
			
			if(valoresEstudio == null){
				valoresEstudio = new ValoresEstudio();
				valoresEstudio.setNombre(practica.getGrupoPractica().getNombre());
				mapValoresEstudio.put(idGrupo, valoresEstudio);
			}
			
			ValorPractica valorPractica = new ValorPractica();
			valorPractica.setPractica(practica);
			valorPractica.setValor(null);										

			if(practica.getSubItemPractica() != null ){
				
				idSubItemPractica = practica.getSubItemPractica().getId();
				valorSubItemPractica = mapValorSubItemPractica.get(idSubItemPractica);
				if(valorSubItemPractica == null){
					valorSubItemPractica = new ValorSubItemPractica();
					valorSubItemPractica.setNombre(practica.getSubItemPractica().getNombre());
					mapValorSubItemPractica.put(idSubItemPractica, valorSubItemPractica);
					valoresEstudio.getValorSubItemPractica().add(valorSubItemPractica);
				}
				
				valorPractica.setValorSubItemPractica(valorSubItemPractica);
				valorPractica.setValoresEstudio(null);				
				valorSubItemPractica.getValoresPracticas().add(valorPractica);
				valorSubItemPractica.setValoresEstudio(valoresEstudio);
				
			}else{				
				valorPractica.setValoresEstudio(valoresEstudio);
				valorPractica.setValorSubItemPractica(null);
				valoresEstudio.getValoresPracticas().add(valorPractica);
			}					
		}
		
		for (ValoresEstudio valoresEstudio2 : mapValoresEstudio.values()) {
			
			valoresEstudio2.setEstudio(estudio);
			estudio.getValoresEstudio().add(valoresEstudio2);
		}
		
		return estudio;
	}	
	
	//Se usa en la modificacion del Estudio
	public static Estudio getEstudio(Estudio estudio, EstudioDTO estudioDTO){
					
		estudio.setNumero(estudioDTO.getNumero());		
		estudio.setSolicitadoPor(estudioDTO.getSolicitadoPor());
		estudio.setFecha(Fecha.stringDDMMAAAAToUtilDate(estudioDTO.getFecha()));
		
		return estudio;
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
