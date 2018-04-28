/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.model;

/**
 *
 * @author Juan Béjar
 */
public class Videojuego {

    private int videojuegoID;
    private String nombreVideojuego;
    private String desarrollador;
    private String publicador;
    private float precio;
    private String estado;
    private boolean promocionado;
    private boolean enOferta;
    private int descuento;
    private int numVentas;

    public Videojuego() {
        videojuegoID = 0;
        desarrollador = " ";
        nombreVideojuego = " ";
        publicador = " ";
        precio = 0;
        estado = " ";

    }

    public Videojuego(int videojuegoID, String nombreVideojuego, String desarrollador,
            String publicador, float precio, String estado, boolean promocionado, boolean enOferta, int descuento, int numVentas) {
        this.videojuegoID = videojuegoID;
        this.nombreVideojuego = nombreVideojuego;
        this.desarrollador = desarrollador;
        this.publicador = publicador;
        this.precio = precio;
        this.estado = estado;
        this.promocionado=promocionado;
        this.enOferta=enOferta;
        this.descuento=descuento;
        this.numVentas=numVentas;

    }

    public Videojuego(int videojuegoID, String nombreVideojuego, String desarrollador,
            String publicador, float precio) {
        this.videojuegoID = videojuegoID;
        this.nombreVideojuego = nombreVideojuego;
        this.desarrollador = desarrollador;
        this.publicador = publicador;
        this.precio = precio;
        estado="";

    }

    public Videojuego(Videojuego v) {

        this.desarrollador = v.desarrollador;
        this.nombreVideojuego = v.nombreVideojuego;
        this.precio = v.precio;
        this.publicador = v.publicador;
        this.videojuegoID = v.videojuegoID;
        this.estado = v.estado;
        this.promocionado=v.promocionado;
        this.enOferta=v.enOferta;
        this.descuento=v.descuento;
        this.numVentas=v.numVentas;
    }

    /**
     * @return the videojuegoID
     */
    public int getVideojuegoID() {
        return videojuegoID;
    }

    /**
     * @param videojuegoID the videojuegoID to set
     */
    public void setVideojuegoID(int videojuegoID) {
        this.videojuegoID = videojuegoID;
    }

    /**
     * @return the nombreVideojuego
     */
    public String getNombreVideojuego() {
        return nombreVideojuego;
    }

    /**
     * @param nombreVideojuego the nombreVideojuego to set
     */
    public void setNombreVideojuego(String nombreVideojuego) {
        this.nombreVideojuego = nombreVideojuego;
    }

    /**
     * @return the desarrollador
     */
    public String getDesarrollador() {
        return desarrollador;
    }

    /**
     * @param desarrollador the desarrollador to set
     */
    public void setDesarrollador(String desarrollador) {
        this.desarrollador = desarrollador;
    }

    /**
     * @return the publicador
     */
    public String getPublicador() {
        return publicador;
    }

    /**
     * @param publicador the publicador to set
     */
    public void setPublicador(String publicador) {
        this.publicador = publicador;
    }

    /**
     * @return the precio
     */
    public float getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(float precio) {
        this.precio = precio;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the promocionado
     */
    public boolean isPromocionado() {
        return promocionado;
    }

    /**
     * @param promocionado the promocionado to set
     */
    public void setPromocionado(boolean promocionado) {
        this.promocionado = promocionado;
    }

    /**
     * @return the enOferta
     */
    public boolean isEnOferta() {
        return enOferta;
    }

    /**
     * @param enOferta the enOferta to set
     */
    public void setEnOferta(boolean enOferta) {
        this.enOferta = enOferta;
    }

    /**
     * @return the descuento
     */
    public int getDescuento() {
        return descuento;
    }

    /**
     * @param descuento the descuento to set
     */
    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }

    /**
     * @return the numVentas
     */
    public int getNumVentas() {
        return numVentas;
    }

    /**
     * @param numVentas the numVentas to set
     */
    public void setNumVentas(int numVentas) {
        this.numVentas = numVentas;
    }

}
