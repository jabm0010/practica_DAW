/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.controller;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.VideojuegoDAO;
import com.daw.vj.model.Videojuego;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author Juan Béjar
 */
@Controller
@RequestMapping("/app")
@SessionAttributes("cliente")
public class SpringController {

    @Autowired
    @Qualifier("ClientesDAOJDBC")
    private ClienteDAO clientes;

    @Autowired
    @Qualifier("VideojuegosDAOJDBC")
    private VideojuegoDAO videojuegos;

    public SpringController() {

    }

    @ModelAttribute
    private void configView(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        //Common variables for Views
        model.addAttribute("srvUrl", request.getContextPath() + request.getServletPath() + "/app");

    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String bienvenida() {

        return "app/index";
    }

    @RequestMapping(value = "/biblioteca", method = RequestMethod.GET)
    public String accederBiblioteca() {

        return "app/biblioteca";
    }

    @RequestMapping(value = "/comunidad", method = RequestMethod.GET)
    public String accederComunidad() {

        return "app/comunidad";
    }

    @RequestMapping(value = "/tienda", method = RequestMethod.GET)
    public String accederTienda() {

        return "app/tienda";
    }
//
//    @RequestMapping(value = "/busqueda", method = RequestMethod.GET)
//    public String busqueda(ModelMap model) {
//        List<Videojuego> vjuegos=this.videojuegos.buscaTodos();
//        model.addAttribute("vjuegos", vjuegos);
//
//        
//        
//        return "app/busqueda";
//    }
//
////
//    @RequestMapping(value = "/identificador", method = RequestMethod.POST)
//    public String cambiarIdentificadorForm(
//            @RequestParam(value = "identificador", required = true) String identificador, ModelMap model) {
//        //save attribute on (session) context!
//        model.addAttribute("identificador", identificador);
//        return "redirect:mensajes";
//    }
}
