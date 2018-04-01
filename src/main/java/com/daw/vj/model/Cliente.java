/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Juan Béjar
 */
public class Cliente implements Serializable{

    private int id;
    private String nombre;
    private String correo;
    private String biografia;
    private String pwd;
    private boolean online;
    private List<Cliente> amigos;

    //Constructor por defecto
    public Cliente() {
        id = 0;
        nombre = " ";
        correo = " ";
        biografia = " ";
        pwd = " ";
        amigos = new ArrayList<>();
        online = false;
    }

    public Cliente(int id, String nombre, String correo, String biografia, String pwd, List<Cliente> amigos, boolean online) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.biografia = biografia;
        this.pwd = pwd;
        this.amigos = amigos;
        this.online = online;

    }

    public Cliente(int id, String nombre, String correo, String biografia, String pwd, boolean online) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.biografia = biografia;
        this.pwd = pwd;
        this.online = online;

        amigos = new ArrayList<>();
    }

    //Constructor de copia
    public Cliente(Cliente c) {
        this.id = c.id;
        this.nombre = c.nombre;
        this.correo = c.correo;
        this.biografia = c.biografia;
        this.pwd = c.pwd;
        this.amigos = c.amigos;
        this.online = c.online;
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

    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    /**
     * @return the amigos
     */
    public List<Cliente> getAmigos() {
        return amigos;
    }

    /**
     * @param amigos the amigos to set
     */
    public void setAmigos(List<Cliente> amigos) {
        this.amigos = amigos;
    }

    /**
     * @return the online
     */
    public boolean isOnline() {
        return online;
    }

    /**
     * @param online the online to set
     */
    public void setOnline(boolean online) {
        this.online = online;
    }

}
