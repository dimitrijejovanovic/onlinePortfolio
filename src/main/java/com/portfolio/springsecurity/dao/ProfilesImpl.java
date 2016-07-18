/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Profiles;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dimitrije
 */
@Repository("ProfilesDao")
public class ProfilesImpl extends AbstractDao<Integer, Profiles> implements ProfilesDao{

    public Profiles findById(int id) {
        return getByKey(id);
    }
    
}
