/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author miguelbanda
 */
public class Salon {
    String numero, administrador;
    int capacidad;
    
    public Salon() {
        this.numero = "";
        this.administrador = "";
        this.capacidad = -1;
    }

    public Salon(String numero, String administrador, int capacidad) {
        this.numero = numero;
        this.administrador = administrador;
        this.capacidad = capacidad;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getAdministrador() {
        return administrador;
    }

    public void setAdministrador(String administrador) {
        this.administrador = administrador;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public static ArrayList<String> ggetprimaryKeyNames() {
        return new ArrayList<>(Arrays.asList("Numero"));
    }
}
