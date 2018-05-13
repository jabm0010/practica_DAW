/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.webservices;

import com.daw.vj.dao.ClienteDAO;
import com.daw.vj.dao.VideojuegoDAO;
import com.daw.vj.model.Cliente;
import com.daw.vj.model.Videojuego;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;

/**
 *
 * @author Juan Béjar
 */
@Path("/clientes")
@Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
public class clientesJSONService {

    @Autowired
    @Qualifier("ClientesDAOJDBC")
    private ClienteDAO clientes;

    @GET
    public List<Cliente> obtenClientes() {
        return clientes.buscaTodos();
    }

    @GET
    @Path("/{id}")
    public Response getCliente(@PathParam("id") int id) {
        Response response;
        Cliente c = clientes.buscaId(id);
        if (c != null) {
            response = Response.ok(c).build();
        } else {
            List<Map<String, Object>> errores = new ArrayList<>();
            Map<String, Object> err = new HashMap<>();
            err.put("message", "El cliente no existe");
            errores.add(err);
            response = Response.status(Response.Status.BAD_REQUEST)
                    .entity(errores).build();
        }

        return response;
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response pasaOnline(@PathParam("id") int id) {
        
        
        Response response;
        Cliente c = clientes.buscaId(id);
        if (clientes.mostrarOnline(id)) {
            response = Response.ok(c).build();
        } else {
            //Error messages
            List<Map<String, Object>> errores = new ArrayList<>();
            Map<String, Object> err = new HashMap<>(); //Error messages
            err.put("message", "No se ha podido modificar el cliente");
            err.put("cliente", c);
            response = Response.status(Response.Status.BAD_REQUEST)
                    .entity(errores).build();
        }
        return response;

    }
//    
//    @PUT
//    @Path("/{id}")
//    @Consumes(MediaType.APPLICATION_JSON + ";charset=utf-8")
//    public Response pasaOffline(@PathParam("id") int id) {
//        
//        
//        Response response;
//        Cliente c = clientes.buscaId(id);
//        if (clientes.mostrarOffline(id)) {
//            response = Response.ok(c).build();
//        } else {
//            //Error messages
//            List<Map<String, Object>> errores = new ArrayList<>();
//            Map<String, Object> err = new HashMap<>(); //Error messages
//            err.put("message", "No se ha podido modificar el cliente");
//            err.put("cliente", c);
//            response = Response.status(Response.Status.BAD_REQUEST)
//                    .entity(errores).build();
//        }
//        return response;
//
//    }

}
