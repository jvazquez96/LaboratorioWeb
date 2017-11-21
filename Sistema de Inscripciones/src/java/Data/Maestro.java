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
 * @author jorgevazquez
 */
public class Maestro {

    String nomina, nombre, correoElectronico, telefono;
    int cursosProgramados;

    public Maestro() {
        this.nomina = "";
        this.nombre = "";
        this.correoElectronico = "";
        this.telefono = "";
        this.cursosProgramados = 0;
    }

    public Maestro(String nomina, String nombre, String correoElectronico, String telefono) {
        this.nomina = nomina;
        this.nombre = nombre;
        this.correoElectronico = correoElectronico;
        this.telefono = telefono;
        this.cursosProgramados = 0;
    }

    public Maestro(String nomina, String nombre, String correoElectronico, String telefono, int cursosProgramados) {
        this.nomina = nomina;
        this.nombre = nombre;
        this.correoElectronico = correoElectronico;
        this.telefono = telefono;
        this.cursosProgramados = cursosProgramados;
    }

    public String getNomina() {
        return nomina;
    }

    public void setNomina(String nomina) {
        this.nomina = nomina;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getCursosProgramados() {
        return cursosProgramados;
    }

    public void setCursosProgramados(int cursosProgramados) {
        this.cursosProgramados = cursosProgramados;
    }

    public static ArrayList<String> ggetprimaryKeyNames() {
        return new ArrayList<>(Arrays.asList("Nomina"));
    }
}
