/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj;

import org.glassfish.jersey.server.ResourceConfig;

import javax.ws.rs.ApplicationPath;

/**
 *
 * @author Juan Béjar
 */
@ApplicationPath("webservice")  //  Service URL: /webservice/*
public class TiendaRESTServiceInitializer extends ResourceConfig{

    public TiendaRESTServiceInitializer() {
        super();
        property("jersey.config.beanValidation.enableOutputValidationErrorEntity.server", true);
    }
;
}
