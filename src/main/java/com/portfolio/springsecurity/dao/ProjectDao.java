/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Dimitrije
 */
public interface ProjectDao {
    
    List<Project> findAllProjects();
    
    List<Project> findInactiveProjects();
    
    List<Project> findProjectsByAuthor(User_1 user);
   
    Project findProjectById(int projectId);
    
    void addNewProject(Project project);
    
    void hide(int projectId);
    
    void show(int projectId);
    
}
