/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.service;

import com.portfolio.springsecurity.dao.FieldDao;
import com.portfolio.springsecurity.model.Field;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dimitrije
 */
@Transactional
@Service("fieldService")
public class FieldServiceImpl implements FieldService{
    
     @Autowired
    private FieldDao fieldDao;

    public List<Field> findAllFields() {
        return fieldDao.getAllFields();
    }

    public Field findFieldByName(String fieldName) {
        return fieldDao.findFieldByName(fieldName);
    }
    
}
