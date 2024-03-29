/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.controller;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.ClientesDAOJDBC;
import com.daw.vj.dao.ClientesDAOList;
import com.daw.vj.model.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Juan Béjar
 */
@WebServlet(name = "ClienteController", urlPatterns = {"/cliente/*"})
public class ClienteController extends HttpServlet {

    private final String srvViewPath = "/WEB-INF/app";
    private ClienteDAO clientes;  //Lista con los clientes
    private String srvUrl;

    //Iniciación
    @Override
    public void init(ServletConfig servletConfig)
            throws ServletException {

        super.init(servletConfig);

        //  clientes = new ClientesDAOList();
        clientes = new ClientesDAOJDBC();
        srvUrl = servletConfig.getServletContext().getContextPath() + "/cliente";

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
     * Handles the HTTP <code>GET</code> method.
     *
     * // * @param request servlet request
     *
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        RequestDispatcher rd;
        rd = request.getRequestDispatcher("/WEB-INF/app/index.jsp");
        rd.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method. Manejo del logeo y registro de
     * usuarios
     *
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

        RequestDispatcher rd;
        String action = (request.getPathInfo() != null ? request.getPathInfo() : "");
        switch (action) {

            case "/registro": {
                String reg_usuario = request.getParameter("reg_usuario"); //Nombre introducido en el formulario reg_usuario
                String reg_pwd = request.getParameter("reg_pwd"); //Contraseña introducida en el formulario reg_pwd
                String reg_email = request.getParameter("reg_email");//Contraseña introducida en el formulario reg_email
                
                request.setAttribute("reg_usuario", reg_usuario);
                request.setAttribute("reg_pwd", reg_pwd);
                request.setAttribute("reg_email", reg_email);
                Cliente c = new Cliente(0, reg_usuario, reg_email, "Aún no has modificado tu biografía", reg_pwd, true);
                if (clientes.registrar(c)) {
                    
                    request.setAttribute("inf_reg", "Se ha registrado de forma correcta. Pruebe a introducir sus datos en el formulario de login. ");

                } else {
                    request.setAttribute("inf_reg", "El registro no se pudo realizar. El correo introducido ya existe. ");
                }

                rd = request.getRequestDispatcher("/WEB-INF/app/index.jsp");
                rd.forward(request, response);
                break;

            }

        }
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

    public boolean validarDatosRegistro(String nombre, String email, String pwd) {
        if (nombre.trim().length() > 3 && nombre.trim().length() < 50 && pwd.trim().length() > 3 && pwd.trim().length() < 50) {
            return true;
        }
        return false;
    }

}
