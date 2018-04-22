/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import com.daw.vj.model.Videojuego;
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
public class VideojuegosDAOJDBC implements VideojuegoDAO {

    private static final String SQL_BUSCAID = "SELECT * FROM Videojuegos where videojuegoID=?";
    private static final String SQL_BUSCANOMBRE = "SELECT * FROM Videojuegos WHERE UPPER(nombreVideojuego) LIKE ?";
    private static final String SQL_BUSCATODOS = "SELECT * FROM Videojuegos";
    private DataSource ds;

    public VideojuegosDAOJDBC() {
        Context context;

        try {
            context = new InitialContext(); //Accedemos al contenedor de Servlets
            ds = (DataSource) context.lookup("java:comp/env/jdbc/DAWpractica"); //Localizamos el pool
        } catch (NamingException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private static Videojuego videojuegoMapper(ResultSet rs) throws SQLException {
        Videojuego v;
        v = new Videojuego(rs.getInt("videojuegoID"),
                rs.getString("nombreVideojuego"),
                rs.getString("desarrollador"),
                rs.getString("publicador"),
                rs.getFloat("precio")
        );
        return v;
    }

    @Override
    public List<Videojuego> buscaNombre(String nombre) {
        List<Videojuego> videojuegos = new ArrayList<Videojuego>();
        Videojuego v = null;
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_BUSCANOMBRE)) {
            stmn.setString(1, ("%" + nombre + "%").toUpperCase());
            try (ResultSet rs = stmn.executeQuery()) {
                while (rs.next()) {
                    videojuegos.add(videojuegoMapper(rs));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }

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

    @Override
    public Videojuego buscaId(Integer id) {
        Videojuego v = null;
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_BUSCAID)) {
            stmn.setInt(1, id);
            try (ResultSet rs = stmn.executeQuery()) {
                rs.next();
                v = videojuegoMapper(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
        return v;

    }

    @Override
    public List<Videojuego> buscaTodos() {

        List<Videojuego> videojuegos = new ArrayList<Videojuego>();
        try (
                Connection conn = ds.getConnection(); //Obtenemos conexión del pool de conexiones
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(SQL_BUSCATODOS);) {
            while (rs.next()) {
                videojuegos.add(videojuegoMapper(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }
        return videojuegos;

    }

}
