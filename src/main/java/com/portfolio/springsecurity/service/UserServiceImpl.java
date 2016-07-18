package com.portfolio.springsecurity.service;

import com.portfolio.springsecurity.dao.ProfilesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.springsecurity.dao.UserDao;
import com.portfolio.springsecurity.model.Profiles;
import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ProfilesDao profilesDao;

    public User_1 findById(int id) {
        return userDao.findById(id);
    }

    public User_1 findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    
    public void registerUser(User_1 user) {
        Profiles profile = profilesDao.findById(1);

        Collection<Profiles> profiles = new HashSet<Profiles>();
        profiles.add(profile);
        user.setState("Active");
        user.setProfilesCollection(profiles);

        userDao.registerUser(user);

    }

   
    public void addProject(User_1 user, Project project) {
        userDao.addProjectToUser(user, project);
    }

    
    public void updateUser(User_1 user) {
        userDao.updateUser(user);
    }

    public List<User_1> findActiveUsers() {
        return userDao.findActiveUsers();
    }

    public List<User_1> findInactiveUsers() {
        return userDao.findInactiveUsers();
    }

}
