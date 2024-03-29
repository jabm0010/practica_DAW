/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 *
 * @author Juan Béjar
 */
public class TiendaWebApplicationInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext container) {
        // Create the 'root' Spring application context
        AnnotationConfigWebApplicationContext rootContext
                = new AnnotationConfigWebApplicationContext();
        rootContext.register(SpringMvcConfig.class);

        // Manage the lifecycle of the Spring root application context
        container.addListener(new ContextLoaderListener(rootContext));

        // Create and map the Spring dispatcher servlet
        ServletRegistration.Dynamic dispatcher
                = container.addServlet("springMvcFrontDispatcher",
                        new DispatcherServlet(rootContext));
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/main/*"); //SpringMVC route map

        // UTF-8 request param fix
        FilterRegistration.Dynamic fr = container.addFilter("encodingFilter",
                new CharacterEncodingFilter());
        fr.setInitParameter("encoding", "UTF-8");
        fr.setInitParameter("forceEncoding", "true");
        fr.addMappingForUrlPatterns(null, true, "/*");
    }
}
