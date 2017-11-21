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
public class Ensena {
    
    String nomina, nombre, clave, horario, horarioLaboratorio, salon;
    int responsabilidad, numeroDeGrupo;
    Boolean ingles, honors;
    
    public Ensena() {
        this.nomina = "";
        this.nombre = "";
        this.clave = "";
        this.horario = "";
        this.horarioLaboratorio = "";
        this.salon = "";
        this.responsabilidad = 0;
        this.numeroDeGrupo = 0;
        this.ingles = false;
        this.honors = false;
    }
    
    public Ensena(String nomina, String nombre, String clave, String horario, 
            String horarioLaboratorio, String salon, int responsabilidad, int numeroDeGrupo,
            Boolean ingles, Boolean honors) {
        this.nomina = nomina;
        this.nombre = nombre;
        this.clave = clave;
        this.horario = horario;
        this.horarioLaboratorio = horarioLaboratorio;
        this.salon = salon;
        this.responsabilidad = responsabilidad;
        this.numeroDeGrupo = numeroDeGrupo;
        this.ingles = ingles;
        this.honors = honors;
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

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getHorarioLaboratorio() {
        return horarioLaboratorio;
    }

    public void setHorarioLaboratorio(String horarioLaboratorio) {
        this.horarioLaboratorio = horarioLaboratorio;
    }

    public String getSalon() {
        return salon;
    }

    public void setSalon(String salon) {
        this.salon = salon;
    }

    public int getResponsabilidad() {
        return responsabilidad;
    }

    public void setResponsabilidad(int responsabilidad) {
        this.responsabilidad = responsabilidad;
    }

    public int getNumeroDeGrupo() {
        return numeroDeGrupo;
    }

    public void setNumeroDeGrupo(int numeroDeGrupo) {
        this.numeroDeGrupo = numeroDeGrupo;
    }

    public Boolean getIngles() {
        return ingles;
    }

    public void setIngles(Boolean ingles) {
        this.ingles = ingles;
    }

    public Boolean getHonors() {
        return honors;
    }

    public void setHonors(Boolean honors) {
        this.honors = honors;
    }
    
}
