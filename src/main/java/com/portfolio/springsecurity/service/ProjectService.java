/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.service;

import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Dimitrije
 */
public interface ProjectService {
    
    List<Project> findAllProjects();
    
    List<Project> findProjectsByAuthor(User_1 user);
    
    List<Project> findInactiveProjects();
    
    void addNewProject(Project project, String[] fieldNames, User_1 user, MultipartFile[] projectImages);
    
    void hideProjectById(int id);
    
    void showProjectById(int id);
    
    Project findById(int id);
}
