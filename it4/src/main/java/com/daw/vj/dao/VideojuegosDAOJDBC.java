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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Juan Béjar
 */
@Repository("VideojuegosDAOJDBC")
public class VideojuegosDAOJDBC implements VideojuegoDAO {

    private static final String SQL_BUSCAID = "SELECT * FROM Videojuegos where videojuegoID=?";
    private static final String SQL_BUSCANOMBRE = "SELECT * FROM Videojuegos WHERE UPPER(nombreVideojuego) LIKE ?";
    private static final String SQL_BUSCATODOS = "SELECT * FROM Videojuegos";
    private static final String SQL_BUSCAVIDEOJUEGOS = "SELECT cli_vjid FROM cliente,videojuegos,cliente_videojuego WHERE id=? AND id=cli_id AND cli_vjid=videojuegoID";
    private static final String SQL_BUSCAESTADOS = "SELECT estado FROM cliente,videojuegos,cliente_videojuego WHERE id=? AND id=cli_id AND cli_vjid=videojuegoID";
    private static final String SQL_COMPRAJUEGO = "INSERT INTO cliente_videojuego (cli_id,cli_vjid,estado) VALUES (?,?,'Desinstalado')";
    private static final String SQL_BUSCAPROMOCIONADOS = "SELECT * FROM videojuegos WHERE promocionado";
    private static final String SQL_BUSCAENOFERTA = "SELECT * FROM videojuegos WHERE enOferta";
    private static final String SQL_BUSCAMASVENDIDOS = "SELECT * FROM videojuegos ORDER BY numventas DESC";
    private static final String SQL_CAMBIAESTADO = "UPDATE cliente_videojuego set estado=? WHERE cli_id=? AND cli_vjid=?";

    @Autowired(required = false)
    private DataSource ds;

    public VideojuegosDAOJDBC() {
//        Context context;
//
//        try {
//            context = new InitialContext(); //Accedemos al contenedor de Servlets
//            ds = (DataSource) context.lookup("java:comp/env/jdbc/DAWpractica"); //Localizamos el pool
//        } catch (NamingException ex) {
//            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, null, ex);
//        }

    }

    private static Videojuego videojuegoMapper(ResultSet rs) throws SQLException {
        Videojuego v;
        v = new Videojuego(rs.getInt("videojuegoID"),
                rs.getString("nombreVideojuego"),
                rs.getString("desarrollador"),
                rs.getString("publicador"),
                rs.getFloat("precio"),
                rs.getInt("descuento")
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
    public boolean comprar(int cli_id, int cli_vjid) {
        boolean result = false;
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_COMPRAJUEGO);) {
            stmn.setInt(1, cli_id);
            stmn.setInt(2, cli_vjid);
            result = (stmn.executeUpdate() == 1);

        } catch (Exception ex) {
            Logger.getLogger(ClientesDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }

        return result;
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

    @Override
    public List<Videojuego> buscaJuegos(int id) {
        List<Integer> l = new ArrayList<>();
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_BUSCAVIDEOJUEGOS)) {
            stmn.setInt(1, id);
            ResultSet rs = stmn.executeQuery();
            while (rs.next()) {
                l.add(rs.getInt("cli_vjid"));

            }
        } catch (Exception ex) {
            Logger.getLogger(ClientesDAOJDBC.class
                    .getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }

        List<String> estados = new ArrayList<>();
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_BUSCAESTADOS)) {
            stmn.setInt(1, id);
            ResultSet rs = stmn.executeQuery();
            while (rs.next()) {
                estados.add(rs.getString("estado"));

            }
        } catch (Exception ex) {
            Logger.getLogger(ClientesDAOJDBC.class
                    .getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }

        List<Videojuego> juegos = new ArrayList<>();
        for (int i = 0; i < l.size(); i++) {
            Videojuego v = new Videojuego();
            v = buscaId(l.get(i));
            v.setEstado(estados.get(i));
            juegos.add(v);

        }

        return juegos;
    }

    @Override
    public List<Videojuego> buscaJuegosPromocionados() {

        List<Videojuego> videojuegos = new ArrayList<Videojuego>();
        try (
                Connection conn = ds.getConnection(); //Obtenemos conexión del pool de conexiones
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(SQL_BUSCAPROMOCIONADOS);) {
            while (rs.next()) {
                videojuegos.add(videojuegoMapper(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }
        return videojuegos;

    }

    @Override
    public List<Videojuego> buscaJuegosOferta() {
        List<Videojuego> videojuegos = new ArrayList<Videojuego>();
        try (
                Connection conn = ds.getConnection(); //Obtenemos conexión del pool de conexiones
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(SQL_BUSCAENOFERTA);) {
            while (rs.next()) {
                videojuegos.add(videojuegoMapper(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }
        return videojuegos;
    }

    @Override
    public List<Videojuego> buscaJuegosMasVendidos() {
        List<Videojuego> videojuegos = new ArrayList<Videojuego>();
        try (
                Connection conn = ds.getConnection(); //Obtenemos conexión del pool de conexiones
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(SQL_BUSCAMASVENDIDOS);) {
            while (rs.next()) {
                videojuegos.add(videojuegoMapper(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Devolver solo los 5 más vendidos
        return videojuegos.subList(0, 5);

    }

    @Override
    public boolean cambiarEstado(String estado, int cli_id, int cli_vjid) {

        boolean result = false;
        try (Connection conn = ds.getConnection();
                PreparedStatement stmn = conn.prepareStatement(SQL_CAMBIAESTADO);) {
            stmn.setString(1, estado);
            stmn.setInt(2, cli_id);
            stmn.setInt(3, cli_vjid);
            result = (stmn.executeUpdate() == 1);

        } catch (Exception ex) {
            Logger.getLogger(VideojuegosDAOJDBC.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
        return result;

    }

}
