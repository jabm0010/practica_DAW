/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.controller;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.VideojuegoDAO;
import com.daw.vj.model.Cliente;
import com.daw.vj.model.Tarjeta;
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
@SessionAttributes(value = {"cliente", "tarjeta", "primerJuego"})
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

        //Obtener datos del usuario y añadirlo a los atributos de sesión
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

        //Obtener los videojuegos que se mostrarán en las secciones de la tienda
        List<Videojuego> promocionados = this.videojuegos.buscaJuegosPromocionados();
        model.addAttribute("promocionados", promocionados);

        List<Videojuego> enOferta = this.videojuegos.buscaJuegosOferta();
        model.addAttribute("enOferta", enOferta);

        List<Videojuego> masVendidos = this.videojuegos.buscaJuegosMasVendidos();
        model.addAttribute("masVendidos", masVendidos);

        if (!c.getVideojuegos().isEmpty()) {
            //Si tiene videojuegos, coger el primero para mostrarlo en grande
            model.addAttribute("primerJuego", c.getVideojuegos().get(0));
        }

        //Creación de una tarjeta por defecto para temas de validación posteriores
        Tarjeta t = new Tarjeta();
        model.addAttribute("tarjeta", t);

        return "app/tienda";
    }

    /**
     * Variante GET de comprar
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/comprar", method = RequestMethod.GET)
    public String comprarVideojuegoGET(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {

        return "app/juego?id=id";

    }

    /**
     * Implementación inicial del método de compra.
     *
     * @param id
     * @param tarjeta
     * @param model
     * @param result
     * @return
     */
    @RequestMapping(value = "/comprar", method = RequestMethod.POST)
    public String comprarVideojuego(@RequestParam(value = "id", defaultValue = "0") Integer id,
            @ModelAttribute("tarjeta") @Valid Tarjeta tarjeta,
            BindingResult result,
            ModelMap model) {

        Cliente c = (Cliente) model.get("cliente");

        if (!result.hasErrors()) {

            if (videojuegos.comprar(c.getId(), id)) {
                //Sin errores de validación y juego no comprado
                c.setVideojuegos(videojuegos.buscaJuegos(c.getId()));
                model.addAttribute("cliente", c);

                return "redirect:tienda";

            } else {
                //En caso de que ya tenga comprado el juego.

                String yacomprado = "Ya habías adquirido este videojuego "
                        + "previamente";
                model.addAttribute("yaComprado", yacomprado);
                model.addAttribute("videojuegoElegido", videojuegos.buscaId(id));
                return "app/juego";
            }
        } else {

            //Errores de validación en la tarjeta
            model.addAttribute("videojuegoElegido", videojuegos.buscaId(id));
            return "app/juego";
        }
    }

    /**
     * Agregar amigos desde la sección de búsqueda
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/agregaramigo", method = RequestMethod.POST)
    public String agregarAmigo(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        Cliente c = (Cliente) model.get("cliente");

        if (clientes.agregarAmigo(c.getId(), id)) {

            //Actualización del cliente con la nueva lista de amigos incluyendo
            //el amigo agregado nuevo
            c.setAmigos(clientes.buscaAmigos(c.getId()));
            model.addAttribute("cliente", c);

            return "redirect:comunidad";

        } else {

            //En caso de que ya tenga agregado a ese usuario se invalida la operación
            //y se muestra un error
            String errorAgregar = "Has intentado agregar a un usuario que ya es tu amigo";
            model.addAttribute("errorAg", errorAgregar);;
            return "app/comunidad";
        }

    }

    /**
     * EL usuario puede borrar a un amigo que ya tenga agregado.
     *
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

        //El parámetro de busca_nombre añade una ',' al final del string
        //con esta línea se lo quito para que la busqueda tenga el valor que de verdad se quiere
        busca_nombre = busca_nombre.substring(0, busca_nombre.length() - 1);

        model.addAttribute("busca_nombre", busca_nombre);
        //Si se pasa cadena vacía, se muestran todos
        if (busca_nombre.trim().equals("")) {
            videojuegos = this.videojuegos.buscaTodos();

            model.addAttribute("videojuegos", videojuegos);

            usuarios = this.clientes.buscaTodos();

            //Eliminar del vector usuarios al propio usuario que ha hecho login en la aplicación
            for (int i = 0; i < usuarios.size(); i++) {
                Cliente c = (Cliente) model.get("cliente");
                if (usuarios.get(i).getId() == c.getId()) {
                    usuarios.remove(i);
                }
            }

            model.addAttribute("usuarios", usuarios);

        } else {
            //En caso contrario que se muestren aquellos elementos que contengan en su nombre la cadena que se ha pasado
            videojuegos = this.videojuegos.buscaNombre(busca_nombre);
            model.addAttribute("videojuegos", videojuegos);

            usuarios = this.clientes.buscaNombre(busca_nombre);

            //Eliminar del vector usuarios al propio usuario que ha hecho login en la aplicación
            for (int i = 0; i < usuarios.size(); i++) {
                Cliente c = (Cliente) model.get("cliente");
                if (usuarios.get(i).getId() == c.getId()) {
                    usuarios.remove(i);
                }
            }
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

    @RequestMapping(value = "/juego/{id}", method = RequestMethod.GET)
    public String accederJuegoId(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        model.addAttribute("videojuegoElegido", videojuegos.buscaId(id));
        return "app/juego";
    }

    /**
     * Método para seleccionar un juego de tu biblioteca y poder interactuar con
     * él
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/seleccionarJuego", method = RequestMethod.GET)
    public String seleccionarJuego(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        model.addAttribute("primerJuego", this.videojuegos.buscaId(id));
        return "app/biblioteca";
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

    /**
     * Modificación de perfil
     *
     * @param cliente
     * @param result
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/modificarperfil", method = RequestMethod.POST)
    public String modificarPerfil(
            @ModelAttribute("cliente")
            @Valid Cliente cliente,
            BindingResult result,
            ModelMap model, HttpServletRequest request) {
        String view;

        if (!result.hasErrors()) {
            //Si los datos son válidos
            clientes.guardaCliente(cliente);

            view = "redirect:modificarperfil";
        } else {

            //Aquí como la modificación de perfil esta en una ventana modal, además de los
            //propios errores de bean validation que se verán cuando se abra de nuevo 
            //el modal, he puesto un mensaje adicional en el perfil del usuario
            //indicando que los datos no son correctos y se restaurarán cuando
            //cambie de página
            String error = "Datos no válidos. Se restaurarán los datos previos si no modificas tu perfil de nuevo";
            model.addAttribute("errorMod", error);
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
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)
    public String registrarusuarioGET(ModelMap model) {

        // model.clear();
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
    @RequestMapping(value = "/registrar", method = RequestMethod.POST)
    public String registrarusuario(
            @ModelAttribute("cliente")
            @Valid Cliente cliente,
            BindingResult result,
            ModelMap model) {
        String view;

        if (!clientes.registrar(cliente)) {
            result.rejectValue("correo", "error.cliente.correoduplicado", "El correo ya existe");
        }

        if (!result.hasErrors()) {

            //Registro satisfactorio, se redirige a tienda + login
            view = "redirect:tienda";

        } else {

            //Erroes debidos a bean validation
            view = "app/registrar";
        }

        return view;

    }

    /**
     * Simulación de instalación, se cambia el estado del juego en la lista de
     * la biblioteca
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/instalar", method = RequestMethod.POST)
    public String instalar(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        Cliente c = (Cliente) model.get("cliente");
        videojuegos.cambiarEstado("Instalado", c.getId(), id);

        //Actualizar datos del cliente logeado
        c.setVideojuegos(videojuegos.buscaJuegos(c.getId()));
        model.addAttribute("cliente", c);

        return "redirect:biblioteca";
    }

    /**
     * SImulación de desinstalado, se cambia el estado del juego en la lista de
     * la biblioteca
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/desinstalar", method = RequestMethod.POST)
    public String desinstalar(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        Cliente c = (Cliente) model.get("cliente");
        videojuegos.cambiarEstado("Desinstalado", c.getId(), id);

        //Actualizar datos del cliente logeado
        c.setVideojuegos(videojuegos.buscaJuegos(c.getId()));
        model.addAttribute("cliente", c);

        return "redirect:biblioteca";
    }

    /**
     * Simulación de jugar, se cambia el estado del juego en la lista de la
     * biblioteca
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/jugar", method = RequestMethod.POST)
    public String jugar(@RequestParam(value = "id", defaultValue = "0") Integer id, ModelMap model) {
        Cliente c = (Cliente) model.get("cliente");
        videojuegos.cambiarEstado("Jugando", c.getId(), id);

        //Actualizar datos del cliente logeado
        c.setVideojuegos(videojuegos.buscaJuegos(c.getId()));
        model.addAttribute("cliente", c);

        return "redirect:biblioteca";
    }

}
