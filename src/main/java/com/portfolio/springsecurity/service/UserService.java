package com.portfolio.springsecurity.service;

import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import java.util.List;

public interface UserService {

	User_1 findById(int id);
	
	User_1 findByUsername(String sso);
        
        void registerUser(User_1 user);
        
        void addProject(User_1 user, Project project);
        
        void updateUser(User_1 user);
        
        List<User_1> findActiveUsers();
        
        List<User_1> findInactiveUsers();
	
}