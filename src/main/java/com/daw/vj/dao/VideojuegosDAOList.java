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
        videojuegos.add(new Videojuego(1, "Age of Empires II", "a", "b",50));
       
        videojuegos.add(new Videojuego(2, "Assassin's Creed I", "a", "b",50));
        videojuegos.add(new Videojuego(3, "Assassin's Creed II", "a", "b",50));
        videojuegos.add(new Videojuego(4, "Assassin's Creed IIII", "a", "b",50));
        videojuegos.add(new Videojuego(5, "Bioshock", "a", "b",50));
        videojuegos.add(new Videojuego(6, "Bioshock 2", "a", "b",50));
        videojuegos.add(new Videojuego(7, "Bioshock Infinite", "a", "b",50));
        videojuegos.add(new Videojuego(8, "Borderlands", "a", "b",50));
        videojuegos.add(new Videojuego(9, "Borderlands 2", "a", "b",50));
        videojuegos.add(new Videojuego(10, "Dark Souls", "a", "b",50));
        videojuegos.add(new Videojuego(11, "Dark Souls II", "a", "b",50));
        videojuegos.add(new Videojuego(12, "Dark Souls III", "a", "b",50));
        videojuegos.add(new Videojuego(13, "DOOM", "a", "b",50));
        videojuegos.add(new Videojuego(14, "Fallout 1", "a", "b",50));
        videojuegos.add(new Videojuego(15, "Fallout 2", "a", "b",50));
        videojuegos.add(new Videojuego(16, "Fallout 3", "a", "b",50));
        videojuegos.add(new Videojuego(17, "Fallout: New Vegas", "a", "b",50));
        videojuegos.add(new Videojuego(18, "Far Cry 1", "a", "b",50));
        videojuegos.add(new Videojuego(19, "Far Cry 2", "a", "b",50));
        videojuegos.add(new Videojuego(20, "Far Cry 3", "a", "b",50));
        videojuegos.add(new Videojuego(21, "Far Cry 4", "a", "b",50));
        videojuegos.add(new Videojuego(22, "Half Life", "a", "b",50));
        videojuegos.add(new Videojuego(23, "Half Life 2", "a", "b",50));
        videojuegos.add(new Videojuego(24, "Metro 2033", "a", "b",50));
        videojuegos.add(new Videojuego(25, "Metro 2034", "a", "b",50));
        videojuegos.add(new Videojuego(26, "TES: Skyrim", "a", "b",50));
        videojuegos.add(new Videojuego(27, "PUBG", "a", "b",50));
        videojuegos.add(new Videojuego(28, "Portal", "a", "b",50));
        videojuegos.add(new Videojuego(29, "Portal 2", "a", "b",50));
        videojuegos.add(new Videojuego(30, "Tomb Raider", "a", "b",50));
        videojuegos.add(new Videojuego(31, "The Witcher", "a", "b",50));
        videojuegos.add(new Videojuego(32, "The Witcher 2", "a", "b",50));
        videojuegos.add(new Videojuego(33, "The Witcher 3", "a", "b",50));

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
    public boolean comprar(Videojuego v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean instalar(Videojuego v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



}
