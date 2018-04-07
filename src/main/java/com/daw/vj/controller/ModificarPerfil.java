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
import com.daw.vj.otros.Util;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ModificarPerfil", urlPatterns = {"/modificarperfil"})
@ServletSecurity(@HttpConstraint(rolesAllowed={"USUARIOS"}))
public class ModificarPerfil extends HttpServlet {

    private ClienteDAO clientes;  //Lista con los clientes
    private String srvUrl;

    @Override
    public void init(ServletConfig servletConfig)
            throws ServletException {

        super.init(servletConfig);
        //Select DAO implementation
        clientes = new ClientesDAOList();
        clientes = new ClientesDAOJDBC();

        srvUrl = servletConfig.getServletContext().getContextPath() + "/modificarperfil";

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

        request.setAttribute("srvUrl", srvUrl);
        
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Expires", "0"); //Avoid browser caching response

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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

        request.setCharacterEncoding("UTF-8");

        
        
        Cliente cl= (Cliente)request.getSession().getAttribute("cliente");
        
        
        String user = request.getParameter("user");
        String new_pwd = request.getParameter("new-pwd");
        String biografia = request.getParameter("biografia");
  

        cl.setBiografia(biografia);
        cl.setNombre(user);
        cl.setPwd(new_pwd);

        clientes.guardaCliente(cl);

        response.sendRedirect("app/comunidad");
        return;
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
