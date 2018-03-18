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

    public Videojuego() {
        videojuegoID = 0;
        desarrollador = " ";
        nombreVideojuego = " ";
        publicador = " ";
        precio = 0;

    }

    public Videojuego(int videojuegoID, String nombreVideojuego, String desarrollador,
            String publicador, float precio) {
        this.videojuegoID = videojuegoID;
        this.nombreVideojuego = nombreVideojuego;
        this.desarrollador = desarrollador;
        this.publicador = publicador;
        this.precio = precio;

    }

    public Videojuego(Videojuego v) {

        this.desarrollador = v.desarrollador;
        this.nombreVideojuego = v.nombreVideojuego;
        this.precio = v.precio;
        this.publicador = v.publicador;
        this.videojuegoID = v.videojuegoID;
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

}
