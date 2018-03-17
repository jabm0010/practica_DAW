/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.controller;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.ClientesDAOList;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ClienteController", urlPatterns = {"/cliente"})
public class ClienteController extends HttpServlet {

    private final String srvViewPath = "/WEB-INF/app";
    private ClienteDAO clientes;  //Lista con los clientes
    private String srvUrl;

    //Iniciación
    @Override
    public void init(ServletConfig servletConfig)
            throws ServletException {

        super.init(servletConfig);
        //Select DAO implementation
        clientes = new ClientesDAOList();
       // srvUrl = servletConfig.getServletContext().getContextPath() + "/cliente";

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
     * Handles the HTTP <code>POST</code> method.
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

        String log_usuario = request.getParameter("log_usuario"); //Nombre introducido en el formulario log_usuario
        String log_pwd = request.getParameter("log_pwd"); //Contraseña introducida en el formulario log_pwd
        boolean resultado = clientes.verificarCliente(log_usuario, log_pwd); //Llamada al método de comprobación de existencia del usuario

        if (resultado) {
            int id = clientes.obtenerID(log_usuario, log_pwd);
            request.getSession().setAttribute("biografia", clientes.buscaId(id).getBiografia());

            request.getSession().setAttribute("log_usuario", log_usuario);
            request.getSession().setAttribute("log_pwd", log_pwd);
            response.sendRedirect("app");
            return;


        } else {
            request.setAttribute("log_usuario", log_usuario);
            request.setAttribute("log_pwd", log_pwd);
            request.setAttribute("error", "Los datos introducidos son incorrectos");

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/app/index.jsp");
            rd.forward(request, response);
        }

        /*
        String reg_usuario = request.getParameter("reg_usuario"); //Nombre introducido en el formulario log_usuario
        String reg_pwd = request.getParameter("reg_pwd"); //Contraseña introducida en el formulario log_pwd
        String reg_email=request.getParameter("reg_email");
        clientes.registrar(reg_nombre, reg_email,reg_pwd);
   

        if (resultado) {
            request.getSession().setAttribute("log_usuario", log_usuario);
            request.getSession().setAttribute("log_pwd", log_pwd);
            response.sendRedirect("comunidad.jsp");
        } else {
            request.setAttribute("log_usuario", log_usuario);
            request.setAttribute("log_pwd", log_pwd);
            request.setAttribute("error", "Los datos introducidos son incorrectos");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
         */
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

}
