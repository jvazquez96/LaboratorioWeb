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
public class Horario {
    String frequencia;
    public Horario() {
        this.frequencia = null;
    }
    
    public Horario(String frequencia) {
        this.frequencia = frequencia;
    }
    
    public String getFrequencia() {
        return this.frequencia;
    }
    
    public void setFrequencia(String frequencia) {
        this.frequencia = frequencia;
    }
}
