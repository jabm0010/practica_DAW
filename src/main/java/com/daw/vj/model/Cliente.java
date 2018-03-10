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
public class Cliente {

    private int id;
    private String nombre;
    private String correo;
    private String biografia;

    //Constructor por defecto
    public Cliente() {
        id = 0;
        nombre = " ";
        correo = " ";
        biografia = " ";

    }
    
    public Cliente(int id, String nombre, String correo, String biografia){
        this.id=id;
        this.nombre=nombre;
        this.correo=correo;
        this.biografia=biografia;
    }

    //Constructorr de copia
    public Cliente(Cliente c) {
        this.id = c.id;
        this.nombre = c.nombre;
        this.correo = c.correo;
        this.biografia = c.biografia;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
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
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the biografia
     */
    public String getBiografia() {
        return biografia;
    }

    /**
     * @param biografia the biografia to set
     */
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

}
