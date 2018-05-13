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
public interface ClienteDAO extends GenericDAO<Cliente, Integer> {

    public List<Cliente> buscaNombre(String nombre); //Método que devuelve una lista de todos los clientes con el mismo nickname

    public boolean registrar(Cliente c); //Método para registrar un cliente

    public boolean modificar(Cliente c); //Método para modificar datos de un cliente

    public boolean verificarCliente(String email, String pwd); //Método para autentificar a un cliente

    public int obtenerID(String email);

    public boolean guardaCliente(Cliente c);

    public List<Cliente> buscaAmigos(int id);
    
    public boolean agregarAmigo(int id1,int id2);
    
    public boolean borrarAmigo(int id1,int id2);
    
    public boolean mostrarOnline(int id);
    
    public boolean mostrarOffline(int id);


}
