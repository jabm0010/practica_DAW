/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Cliente;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Juan Béjar
 */
public class ClientesDAOList implements ClienteDAO {

    private static List<Cliente> clientes; //clientes registrados en el sistema;
    private static int contador; //Variable contador para clave primaria

    public ClientesDAOList() {
        contador = 1;
        clientes = new ArrayList<>();
        clientes.add(new Cliente(1, "AntonioR", "antonio99@gmail.com", "Hola!"));
        clientes.add(new Cliente(2, "Pepe1997", "pepepepe@gmail.com", "Hola!"));


    }

    @Override
    public Cliente buscaId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cliente> buscaNombre(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrar(Cliente c) {
        
        clientes.add(c);
        return true;
    }

    @Override
    public boolean modificar(Cliente c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cliente> buscaTodos() {
        
        return clientes;
        
    }

}
