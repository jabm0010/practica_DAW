/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Cliente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Juan Béjar
 */
public class ClientesDAOJDBC implements ClienteDAO {

    private static final String SQL_BUSCATODOS = "SELECT * FROM Cliente";
      private static final String SQL_BUSCANOMBRE = "SELECT * FROM Cliente WHERE nombre LIKE ?";

    private static final String connPoolName = "java:comp/env/jdbc/practicaDAW";
    private DataSource ds = null;

    public ClientesDAOJDBC() {
        if (ds == null) {
            try {
                Context context = new InitialContext();
                ds = (DataSource) context.lookup(connPoolName);
            } catch (NamingException ex) {
                Logger.getLogger(ClientesDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
    }

    /**
     * Recupera un Cliente del registro actual del RS (MAPPING)
     */
    private static Cliente clienteMapper(ResultSet rs) throws SQLException {
        Cliente c;
        c = new Cliente(rs.getInt("id"),
                rs.getString("nombre"),
                rs.getString("correo"),
                rs.getString("biografia"),
                rs.getString("pwd"),
                rs.getBoolean("online")
        );
        return c;
    }

    @Override
    public List<Cliente> buscaNombre(String nombre) {

        List<Cliente> clientes = new ArrayList<Cliente>();
        Cliente c=null;
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_BUSCANOMBRE)) {
            stmn.setString(1, "%" + nombre + "%");
            try (ResultSet rs = stmn.executeQuery()) {
                while (rs.next()) {
                    clientes.add(clienteMapper(rs));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }

        return clientes;

    }

    @Override
    public boolean registrar(Cliente c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrar(String nombre, String email, String pwd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean modificar(Cliente c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean verificarCliente(String email, String pwd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obtenerID(String nombre, String pwd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obtenerID(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizarCliente(Cliente c, String nombre, String biografia, String pwd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cliente buscaId(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cliente> buscaTodos() {

        List<Cliente> l = new ArrayList<>();
        try (Connection conn = ds.getConnection();
                Statement stmn = conn.createStatement();
                ResultSet rs = stmn.executeQuery(SQL_BUSCATODOS);) {
            while (rs.next()) {
                l.add(clienteMapper(rs));
            }
        } catch (Exception ex) {
            Logger.getLogger(ClientesDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
        return l;

    }

}
