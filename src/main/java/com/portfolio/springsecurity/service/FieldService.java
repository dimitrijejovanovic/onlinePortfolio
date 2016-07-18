/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.service;

import com.portfolio.springsecurity.model.Field;
import java.util.List;

/**
 *
 * @author Dimitrije
 */
public interface FieldService {
    List<Field> findAllFields();
    Field findFieldByName(String fieldName);
}
