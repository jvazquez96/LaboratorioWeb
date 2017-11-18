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
public class Responsabilidad {
    Maestro maestro;
    int responsabilidad;
    Curso curso;
    
    public Responsabilidad() {
        this.maestro = null;
        this.responsabilidad = 0;
        this.curso = null;
    }
    
    public Responsabilidad(Maestro maestro, int responsabilidad, Curso curso) {
        this.maestro = maestro;
        this.responsabilidad = responsabilidad;
        this.curso = curso;
    }
    
    public Maestro getMaestro() {
        return maestro;
    }
    
    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }
    
    public int getResponsabilidad() {
        return responsabilidad;
    }
    
    public void setResponsabilidad(int responsabilidad) {
        this.responsabilidad = responsabilidad;
    }
    
    public Curso getCurso() {
        return curso;
    }
    
    public void setCurso(Curso curso) {
        this.curso = curso;
    }
}
