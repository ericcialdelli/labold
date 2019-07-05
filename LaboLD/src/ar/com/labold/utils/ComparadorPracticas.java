package ar.com.labold.utils;

import java.util.Comparator;

import ar.com.labold.negocio.Practica;

public class ComparadorPracticas implements Comparator<Practica> {

	public int compare(Practica o1, Practica o2) {

		return o1.getNombre().compareTo(o2.getNombre());
	}	
}
