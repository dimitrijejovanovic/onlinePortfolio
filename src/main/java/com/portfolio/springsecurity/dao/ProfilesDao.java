/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Profiles;


/**
 *
 * @author Dimitrije
 */
public interface ProfilesDao {
    Profiles findById(int id);   
}
