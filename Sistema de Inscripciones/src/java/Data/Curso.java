/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

public class Curso {

    String clave, horario, horarioLaboratorio, salon;
    Integer numeroDeGrupo;
    Boolean ingles, honors;

    public Curso() {
        this.clave = "";
        this.horario = "";
        this.horarioLaboratorio = "";
        this.salon = "";
        this.numeroDeGrupo = 0;
        this.ingles = false;
        this.honors = false;
    }

    public Curso(String clave, String horario, String horarioLaboratorio, String salon,
                 Integer numeroDeGrupo, Boolean ingles, Boolean honors) {
        this.clave = clave;
        this.horario = horario;
        this.horarioLaboratorio = horarioLaboratorio;
        this.salon = salon;
        this.numeroDeGrupo = numeroDeGrupo;
        this.ingles = ingles;
        this.honors = honors;
    }
    public String getClave() {
        return clave;
    }
    public String getHorario() {
        return horario;
    }
    public String getHorarioLaboratorio() {
        return horarioLaboratorio;
    }
    public String getSalon() {
        return salon;
    }
    public Integer getNumeroDeGrupo() {
        return numeroDeGrupo;
    }
    public Boolean hasIngles() {
        return ingles;
    }
    public Boolean hasHonors() {
        return honors;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    public void setHorario(String horario) {
        this.horario = horario;
    }
    public void setHorarioLaboratorio(String horarioLaboratorio) {
        this.horarioLaboratorio = horarioLaboratorio;
    }
    public void setSalon(String salon) {
        this.salon = salon;
    }
    public void setNumeroDeGrupo(Integer numeroDeGrupo) {
        this.numeroDeGrupo = numeroDeGrupo;
    }
    public void setIngles(Boolean ingles) {
        this.ingles = ingles;
    }
    public void setHonors(Boolean honors) {
        this.honors = honors;
    }
}
