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
        clientes=new ClientesDAOJDBC();
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
     * Manejo del logeo y registro de usuarios
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
                boolean datosCorrectos = validarDatosRegistro(reg_usuario, reg_email, reg_pwd);
                boolean resultado_reg=false;
                if (validarDatosRegistro(reg_usuario, reg_email, reg_pwd)) {
                    resultado_reg = clientes.registrar(reg_usuario, reg_email, reg_pwd);
                }
                
                if (resultado_reg) {
                    int id = clientes.obtenerID(reg_email);
                    Cliente c;
                    c = clientes.buscaId(id);
                    request.getSession().setAttribute("clienteLog", c);
                    request.getSession().setAttribute("biografia", clientes.buscaId(id).getBiografia());
                    request.getSession().setAttribute("amigos", clientes.buscaId(id).getAmigos());
                    request.getSession().setAttribute("numamigos", clientes.buscaId(id).getAmigos().size());
                    request.getSession().setAttribute("log_usuario", reg_usuario);
                    request.getSession().setAttribute("log_pwd", reg_pwd);
                    response.sendRedirect("../app");
                    return;
                } else {
                    request.setAttribute("reg_usuario", reg_usuario);
                    request.setAttribute("reg_email", reg_email);
                    request.setAttribute("reg_pwd", reg_pwd);
                    request.setAttribute("error_reg", "Los datos introducidos son incorrectos.El correo ya existe o la contraseña/nombre son muy cortos");
                    rd = request.getRequestDispatcher("/WEB-INF/app/index.jsp");
                    rd.forward(request, response);
                    break;

                }

            }
            
            case "/login": {
                String log_email = request.getParameter("log_email"); //Nombre introducido en el formulario log_usuario
                String log_pwd = request.getParameter("log_pwd"); //Contraseña introducida en el formulario log_pwd
                boolean resultado_log=false;
                resultado_log = clientes.verificarCliente(log_email, log_pwd); //Llamada al método de comprobación de existencia del usuario

                if (resultado_log) {
                    int id = clientes.obtenerID(log_email);
                    Cliente c;
                    c = clientes.buscaId(id);
                    request.getSession().setAttribute("clienteLog", c);
                    request.getSession().setAttribute("biografia", clientes.buscaId(id).getBiografia());
                    request.getSession().setAttribute("amigos", clientes.buscaId(id).getAmigos());
                    request.getSession().setAttribute("numamigos", clientes.buscaId(id).getAmigos().size());
                    request.getSession().setAttribute("log_usuario", clientes.buscaId(id).getNombre());
                    request.getSession().setAttribute("log_pwd", log_pwd);
                    response.sendRedirect("../app");
                    return;

                } else {
                    request.setAttribute("log_email", log_email);
                    request.setAttribute("log_pwd", log_pwd);
                    request.setAttribute("error", "Los datos introducidos son incorrectos.Prueba usuario@gmail.com - usuario");
                    rd = request.getRequestDispatcher(srvViewPath+"/index.jsp");
                    rd.forward(request, response);
                    break;
                }
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
