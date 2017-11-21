/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

/**
 *
 * @author jorgevazquez
 */
public class Materia {
    String clave, nombre;
    int horasLaboratorio;

    public Materia() {
        this.clave= "";
        this.nombre = "";
        this.horasLaboratorio = 0;
    }
    public Materia(String clave, String nombre, int horasLaboratorio) {
        this.clave = clave;
        this.nombre = nombre;
        this.horasLaboratorio = horasLaboratorio;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getHorasLaboratorio() {
        return horasLaboratorio;
    }

    public void setHorasLaboratorio(int horasLaboratorio) {
        this.horasLaboratorio = horasLaboratorio;
    }
    
    
}
