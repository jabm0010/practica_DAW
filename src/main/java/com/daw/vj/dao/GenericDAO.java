/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.vj.dao;

import java.util.List;

/**
 *
 * @author Juan Béjar
 */

public interface GenericDAO<T,K> {
    
    public T buscaId(K id);
    public List<T> buscaTodos();

}
