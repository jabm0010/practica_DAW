/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Clase para simular compra de juegos
 * @author Juan Béjar
 */
public class Tarjeta {

    @Size(min=5, max=50, message="El nombre no es correcto")
    private String nombre;
    @Pattern(regexp="^(?:\\d{4}-){3}\\d{4}$", message="El número no es correcto")
    private String numeroTarjeta;
    @Pattern(regexp="\\d{3}", message="El CVV no es correcto")
    private String CVV;

    public Tarjeta() {
        nombre = "";
        numeroTarjeta = "";
        CVV = "";
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the numeroTarjeta
     */
    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }

    /**
     * @param numeroTarjeta the numeroTarjeta to set
     */
    public void setNumeroTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    /**
     * @return the CVV
     */
    public String getCVV() {
        return CVV;
    }

    /**
     * @param CVV the CVV to set
     */
    public void setCVV(String CVV) {
        this.CVV = CVV;
    }

}
