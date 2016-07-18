/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Field;
import com.portfolio.springsecurity.model.User_1;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dimitrije
 */
@Repository("fieldDao")
public class FieldDaoImpl extends AbstractDao<Integer, Field> implements FieldDao {

    public List<Field> getAllFields() {
        ArrayList<Field> fieldList = (ArrayList<Field>) createEntityCriteria().list();
        return fieldList;
    }

    public Field findFieldByName(String fieldName) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", fieldName));
        return (Field) crit.uniqueResult();
    }

}
