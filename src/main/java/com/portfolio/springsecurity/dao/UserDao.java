package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import com.portfolio.springsecurity.model.User_1;
import java.util.List;

public interface UserDao {

	User_1 findById(int id);
	
	User_1 findByUsername(String username);
        
        void registerUser(User_1 user);
        
        public void addProjectToUser(User_1 user, Project project);
        
        void updateUser(User_1 user);
        
        List<User_1> findActiveUsers();
        
        List<User_1> findInactiveUsers();
        
}

