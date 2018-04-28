/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.controller;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.VideojuegoDAO;
import com.daw.vj.model.Cliente;
import com.daw.vj.model.Videojuego;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

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

    //DAO de clientes
    @Autowired
    @Qualifier("ClientesDAOJDBC")
    private ClienteDAO clientes;

    //DAO de videojuegos
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

    /**
     * Salida de la aplicación con invalidación de los credenciales de sesión
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String salir(HttpServletRequest request) {

        request.getSession().invalidate();
        return "app/salir";
    }

    /**
     * Acceso a la biblioteca de videojuegos
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/biblioteca", method = RequestMethod.GET)
    public String accederBiblioteca(ModelMap model) {


        return "app/biblioteca";
    }

    /**
     * Acceso a la sección de comunidad
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/comunidad", method = RequestMethod.GET)
    public String accederComunidad(ModelMap model) {

        return "app/comunidad";
    }

    /**
     * Acceso a la vista de tienda, página por defecto al iniciar la aplicación,
     * se cogen los datos del usuario obtenidos de su logeo.
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/tienda", method = RequestMethod.GET)
    public String accederTienda(ModelMap model, HttpServletRequest request) {

        request.getSession();
        String log_email = request.getRemoteUser();

        int id = clientes.obtenerID(log_email);
        Cliente c;
        c = clientes.buscaId(id);

        List<Cliente> amigos = clientes.buscaAmigos(id);
        List<Videojuego> videojuegos = this.videojuegos.buscaJuegos(id);
        c.setAmigos(amigos);
        c.setVideojuegos(videojuegos);

        model.addAttribute("cliente", c);

        List<Videojuego> promocionados = this.videojuegos.buscaJuegosPromocionados();
        model.addAttribute("promocionados", promocionados);

        List<Videojuego> enOferta = this.videojuegos.buscaJuegosOferta();
        model.addAttribute("enOferta", enOferta);

        List<Videojuego> masVendidos = this.videojuegos.buscaJuegosMasVendidos();
        model.addAttribute("masVendidos", masVendidos);

        return "app/tienda";
    }

    /**
     * Implementación inicial del método de compra. 
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/comprar", method = RequestMethod.POST)
    public String comprarVideojuego(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {

        Cliente c = (Cliente) model.get("cliente");

        
        if (videojuegos.comprar(c.getId(), id)) {
            c.setVideojuegos(videojuegos.buscaJuegos(c.getId()));
            model.addAttribute("cliente", c);

            return "redirect:biblioteca";

        } else {
            //En caso de que ya tenga comprado el juego.
            return "redirect:tienda";
        }
    }

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/agregaramigo", method = RequestMethod.POST)
    public String agregarAmigo(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        Cliente c = (Cliente) model.get("cliente");

        if (clientes.agregarAmigo(c.getId(), id)) {

            c.setAmigos(clientes.buscaAmigos(c.getId()));
            model.addAttribute("cliente", c);

            return "redirect:comunidad";

        } else {
            //En caso de que ya tenga agregado a ese usuario
            return "redirect:tienda";
        }

    }
    
 
    /**
     * EL usuario puede borrar a un amigo que ya tenga agregado.
     * @param id
     * @param model
     * @return 
     */
    @RequestMapping(value = "/borraramigo", method = RequestMethod.POST)
    public String borrarAmigo(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        Cliente c = (Cliente) model.get("cliente");

        if (clientes.borrarAmigo(c.getId(), id)) {

            c.setAmigos(clientes.buscaAmigos(c.getId()));
            model.addAttribute("cliente", c);

            return "redirect:comunidad";

        } else {
            //En caso de que ya tenga agregado a ese usuario
            return "redirect:tienda";
        }

    }

    
    
    
    /**
     * Búsqueda de usuarios y videojuegos
     *
     * @param busca_nombre
     * @param model
     * @return
     */
    @RequestMapping(value = "/busqueda", method = RequestMethod.POST)
    public String busquedaNombre(@RequestParam(value = "busca_nombre") String busca_nombre, ModelMap model) {

        List<Videojuego> videojuegos;
        List<Cliente> usuarios;

        //Por algún motivo el parámetro de busca_nombre añade una ',' al final del string
        //con esta línea se lo quito para que la busqueda tenga el valor que de verdad se quiere
        busca_nombre = busca_nombre.substring(0, busca_nombre.length() - 1);

        model.addAttribute("busca_nombre", busca_nombre);
        //Si se pasa cadena vacía, se muestran todos
        if (busca_nombre.trim().equals("")) {
            videojuegos = this.videojuegos.buscaTodos();
            model.addAttribute("videojuegos", videojuegos);

            usuarios = this.clientes.buscaTodos();
            model.addAttribute("usuarios", usuarios);

        } else {
            //En caso contrario que se muestren aquellos elementos que contengan en su nombre la cadena que se ha pasado
            videojuegos = this.videojuegos.buscaNombre(busca_nombre);
            model.addAttribute("videojuegos", videojuegos);

            usuarios = this.clientes.buscaNombre(busca_nombre);
            model.addAttribute("usuarios", usuarios);
        }

        return "app/busqueda";
    }

    /**
     * Acceso a la página de un juego específico seleccionado
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/juego", method = RequestMethod.GET)
    public String accederJuego(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        model.addAttribute("videojuegoElegido", videojuegos.buscaId(id));
        return "app/juego";
    }

    /**
     * Modificación del perfil
     *
     * @return
     */
    @RequestMapping(value = "/modificarperfil", method = RequestMethod.GET)
    public String modificarPerfilGET() {
        return "app/comunidad";
    }

    @RequestMapping(value = "/modificarperfil", method = RequestMethod.POST)
    public String modificarPerfil(
            @ModelAttribute("cliente")
            @Valid Cliente cliente,
            BindingResult result,
            ModelMap model) {
        String view;

        if (!result.hasErrors()) {
            clientes.guardaCliente(cliente);

            view = "redirect:modificarperfil";
        } else {
            //Show message form with original text and bean validation error message

            view = "app/comunidad";
        }

        return view;

    }

    /**
     * Método GET para redirección de registro de usuarios
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/registrarusuario", method = RequestMethod.GET)
    public String registrarusuarioGET(ModelMap model) {

        model.clear();
        Cliente c = new Cliente();
        c.setNombre("");
        c.setPwd("");
        model.addAttribute("cliente", c);
        return "app/registrar";
    }

    /**
     * Registro de usuarios
     *
     * @param cliente
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/registrarusuario", method = RequestMethod.POST)
    public String registrarusuario(
            @ModelAttribute("cliente")
            @Valid Cliente cliente,
            BindingResult result,
            ModelMap model) {
        String view;

        if (!result.hasErrors()) {
//
//            // model.clear();
//            clientes.registrar(cliente);
//            model.addAttribute("cliente", cliente);

            clientes.registrar(cliente);
            view = "redirect:tienda";
        } else {

            view = "app/registrar";
        }

        return view;

    }

////
////
//    @RequestMapping(value = "/identificador", method = RequestMethod.POST)
//    public String cambiarIdentificadorForm(
//            @RequestParam(value = "identificador", required = true) String identificador, ModelMap model) {
//        //save attribute on (session) context!
//        model.addAttribute("identificador", identificador);
//        return "redirect:mensajes";
//    }
}
