package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Project;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.portfolio.springsecurity.model.User_1;
import com.portfolio.springsecurity.model.User_1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User_1> implements UserDao {

    public User_1 findById(int id) {
        return getByKey(id);
    }

    public User_1 findByUsername(String username) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("username", username));
        return (User_1) crit.uniqueResult();
    }

    
    public void registerUser(User_1 user) {
        persist(user);
    }

    public void addProjectToUser(User_1 user, Project project) {
        
    }

    public void updateUser(User_1 user) {
        update(user);
    }

    public List<User_1> findActiveUsers() {
        return (ArrayList<User_1>) createEntityCriteria().add(Restrictions.eq("state", "Active")).list();
    }
    
    public List<User_1> findInactiveUsers() {
        return (ArrayList<User_1>) createEntityCriteria().add(Restrictions.eq("state", "Inactive")).list();
    }

}
