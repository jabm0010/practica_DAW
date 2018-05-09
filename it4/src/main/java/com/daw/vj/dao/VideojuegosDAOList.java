/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Cliente;
import com.daw.vj.model.Videojuego;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Juan Béjar
 */
public class VideojuegosDAOList implements VideojuegoDAO {

    private static List<Videojuego> videojuegos;
    public static int contador = 0;

    public VideojuegosDAOList() {
        videojuegos = new ArrayList<>();


    }

    @Override
    public Videojuego buscaId(Integer videojuegoID) {
        Videojuego encontrado=null;
        for (Videojuego v: videojuegos) {
               if (v.getVideojuegoID()==videojuegoID) encontrado=v;
        }
        return encontrado;
    }
    

    
    

    @Override
    public List<Videojuego> buscaNombre(String nombre) {
        List<Videojuego> vj = new ArrayList<>();
        for (int i = 0; i < videojuegos.size(); i++) {
            if (videojuegos.get(i).getNombreVideojuego().toLowerCase().contains(nombre.toLowerCase())) {
                vj.add(videojuegos.get(i));
            }
        }

        
        return vj;
    }

    @Override
    public List<Videojuego> buscaTodos() {
        return videojuegos;
    }

    @Override
    public boolean comprar(int cli_id, int cli_vjid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    @Override
    public List<Videojuego> buscaJuegos(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Videojuego> buscaJuegosPromocionados() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Videojuego> buscaJuegosOferta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Videojuego> buscaJuegosMasVendidos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean cambiarEstado(String estado, int cli_id, int cli_vjid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



}
