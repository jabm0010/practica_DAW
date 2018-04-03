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
    public static int contador = 10; //Variable contador para clave primaria
    List<Cliente> amigos = new ArrayList<>();

    public ClientesDAOList() {
        contador = 1;

        amigos.add(new Cliente(5, "Jose", "d@gmail.com", "Hola!", "d", amigos, true));
        amigos.add(new Cliente(6, "miguel", "f@gmail.com", "Hola!", "f", amigos, true));
        amigos.add(new Cliente(7, "Luis", "e@gmail.com", "Hola!", "e", amigos, false));

        clientes = new ArrayList<>();
        clientes.add(new Cliente(0, "usuario", "usuario@gmail.com", "Esta es mi biografia", "usuario", amigos, true));
        clientes.add(new Cliente(1, "AntonioRe", "antonio99@gmail.com", "Hola!", "1234", amigos, false));
        clientes.add(new Cliente(2, "Pepe1997", "pepepepe@gmail.com", "Hola!", "abcd", amigos, false));
        clientes.add(new Cliente(3, "b", "b@gmail.com", "Hola!", "b", amigos, false));
        clientes.add(new Cliente(4, "e", "c@gmail.com", "Hola!", "e", amigos, false));

    }

    @Override
    public Cliente buscaId(Integer id) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getId() == id);
            return clientes.get(i);
        }
        return null;
    }

    @Override
    public List<Cliente> buscaNombre(String nombre) {
        List<Cliente> clientesCoinciden = new ArrayList<>();
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getNombre().toLowerCase().contains(nombre.toLowerCase())) {
                clientesCoinciden.add(clientes.get(i));
            }
        }

        return clientesCoinciden;
    }

    @Override
    public boolean registrar(Cliente c) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getCorreo().equals(c.getCorreo())) {
                return false;
            }
        }
        clientes.add(c);
        return true;
    }

    public void actualizarCliente(Cliente c, String nombre, String biografia, String pwd) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getId() == c.getId()) {
                c.setNombre(nombre);
                c.setBiografia(biografia);
                c.setPwd(pwd);
            }
        }

    }

    @Override
    public boolean modificar(Cliente c) {

        return true;
    }

    @Override
    public List<Cliente> buscaTodos() {

        return clientes;

    }

    /**
     * Comrpueba si el cliente que se la pasa tiene los mismos credenciales que
     * alguno de los clientes ya registrados
     *
     * @param nombre
     * @param pwd
     * @return
     */
    @Override
    public boolean verificarCliente(String email, String pwd) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getCorreo().equals(email) && clientes.get(i).getPwd().equals(pwd)) {

                return true;

            }

        }

        return false;
    }

    /**
     * Si el correo no existe, se admite el registro de usuario
     *
     * @param nombre
     * @param email
     * @param pwd
     * @return
     */
    @Override
    public boolean registrar(String nombre, String email, String pwd) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getCorreo().equals(email)) {
                return false;
            }
        }

        Cliente c = new Cliente(contador, nombre, email, "Escribe aquí tu biografía", pwd, amigos, true);
        contador++;
        clientes.add(c);
        return true;

    }

    @Override
    public int obtenerID(String nombre, String pwd) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getNombre().equals(nombre) && clientes.get(i).getPwd().equals(pwd)) {

                return clientes.get(i).getId();

            }

        }

        return -1;
    }
    @Override
    public int obtenerID(String email) {
        for (int i = 0; i < clientes.size(); i++) {
            if (clientes.get(i).getCorreo().equals(email)) {
                return clientes.get(i).getId();
            }
        }

        return -1;
    }

    @Override
    public boolean guardaCliente(Cliente c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cliente> buscaAmigos(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
