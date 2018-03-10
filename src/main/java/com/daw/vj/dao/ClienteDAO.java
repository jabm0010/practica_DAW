/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Cliente;
import java.util.List;

/**
 *
 * @author Juan Béjar
 */
public interface ClienteDAO {
    
    
    public Cliente buscaId(int id); //Método para buscar un cliente por su id
    
    public List<Cliente> buscaNombre(String nombre); //Método que devuelve una lista de todos los clientes con el mismo nickname
    
    public boolean registrar(Cliente c); //Método para registrar un cliente
    
    public boolean modificar(Cliente c); //Método para modificar datos de un cliente
    
    public List<Cliente> buscaTodos(); //Método que devuelve todos los clientes
    
    
}
