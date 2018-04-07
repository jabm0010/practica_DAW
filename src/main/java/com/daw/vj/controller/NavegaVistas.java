/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.controller;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.ClientesDAOJDBC;
import com.daw.vj.dao.ClientesDAOList;
import com.daw.vj.dao.VideojuegoDAO;
import com.daw.vj.dao.VideojuegosDAOJDBC;
import com.daw.vj.dao.VideojuegosDAOList;
import com.daw.vj.model.Cliente;
import com.daw.vj.model.Videojuego;
import com.daw.vj.otros.Util;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Juan Béjar
 */
@WebServlet(name = "NavegaVistas", urlPatterns = {"/app/*"})
@ServletSecurity(
 @HttpConstraint(rolesAllowed = {"USUARIOS"}))
public class NavegaVistas extends HttpServlet {

    private final String srvViewPath = "/WEB-INF/app";
    private String srvUrl;
    private static final Logger Log = Logger.getLogger(NavegaVistas.class.getName());
    private ClienteDAO clientes;  //Lista con los clientes
    private VideojuegoDAO videojuegos;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
        Log.info("Iniciando NavegaVistasController");
        srvUrl = servletConfig.getServletContext().getContextPath() + "/app";

        //clientes = new ClientesDAOList();
        clientes = new ClientesDAOJDBC();

        //videojuegos = new VideojuegosDAOList();
        videojuegos = new VideojuegosDAOJDBC();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("srvUrl", srvUrl);

        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Expires", "0"); //Avoid browser caching response

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method. Acceso a las diferentes vistas
     * de la aplicación
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        RequestDispatcher rd;
        String action = (request.getPathInfo() != null ? request.getPathInfo() : "");
        switch (action) {
            case "/biblioteca": {
                
                rd = request.getRequestDispatcher(srvViewPath + "/biblioteca.jsp");
                break;
            }
            case "/comunidad": {
                datosSesion(request);
                rd = request.getRequestDispatcher(srvViewPath + "/comunidad.jsp");
                break;
            }
            case "/tienda": {

                datosSesion(request);
                rd = request.getRequestDispatcher(srvViewPath + "/tienda.jsp");
                break;
            }
            case "/index": {

                request.logout();

                request.getSession().invalidate();

                rd = request.getRequestDispatcher("/bienvenida.jsp");
                break;
            }
            case "/busqueda": {

                rd = request.getRequestDispatcher(srvViewPath + "/busqueda.jsp");
                break;
            }
            case "/juego": {
                Videojuego v;
                int id = Integer.parseInt(Util.getParam(request.getParameter("videojuegoID"), "0"));
                v = videojuegos.buscaId(id);
                request.setAttribute("videojuegoElegido", v);
                rd = request.getRequestDispatcher(srvViewPath + "/juego.jsp");
                break;
            }
            default: {
                rd = request.getRequestDispatcher(srvViewPath + "/tienda.jsp");
                break;
            }
        }

        rd.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method. Formulario de búsqueda, tanto
     * para videojuegos como usuarios
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String busca_nombre = request.getParameter("busca_nombre"); //Valor introducido en la barra de busqueda

        //En caso de que no se introduzca nada, se mostrarán todo el contenido
        if (busca_nombre.trim().isEmpty()) {
            request.getSession().setAttribute("busca_nombre", "Todos");
            request.getSession().setAttribute("usuarios", clientes.buscaTodos());
            request.getSession().setAttribute("videojuegos", videojuegos.buscaTodos());
        } else {

            request.getSession().setAttribute("busca_nombre", busca_nombre);
            request.getSession().setAttribute("usuarios", clientes.buscaNombre(busca_nombre));
            request.getSession().setAttribute("videojuegos", videojuegos.buscaNombre(busca_nombre));
        }
        response.sendRedirect("busqueda");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void datosSesion(HttpServletRequest request) {

        //Obtener los datos del cliente logeado desde la BD
        request.getSession();
        String log_email = request.getRemoteUser();

        int id = clientes.obtenerID(log_email);
        Cliente c;
        c = clientes.buscaId(id);

        List<Cliente> amigos = clientes.buscaAmigos(id);

        c.setAmigos(amigos);
        request.getSession().setAttribute("cliente", c);

    }

}
