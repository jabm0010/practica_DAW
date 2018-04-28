/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Cliente;
import com.daw.vj.model.Videojuego;
import java.util.List;

/**
 *
 * @author Juan Béjar
 */
public interface VideojuegoDAO extends GenericDAO<Videojuego, Integer> {

    public List<Videojuego> buscaNombre(String nombre);

    public boolean comprar(int cli_id, int cli_vjid);

    public boolean instalar(Videojuego v);

    public List<Videojuego> buscaJuegos(int id);

    public List<Videojuego> buscaJuegosPromocionados();

    public List<Videojuego> buscaJuegosOferta();

    public List<Videojuego> buscaJuegosMasVendidos();

}
