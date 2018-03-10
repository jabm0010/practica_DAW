/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Videojuego;
import java.util.List;

/**
 *
 * @author Juan Béjar
 */
public interface VideojuegoDAO {

    public Videojuego buscaID(int videojuegoID);

    public List<Videojuego> buscaNombre(String nombre);

    public List<Videojuego> buscaTodos();

    public boolean comprar(Videojuego v);

    public boolean instalar(Videojuego v);

}
