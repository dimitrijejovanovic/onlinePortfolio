/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.dao;

import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dimitrije
 */
@Repository("projectDao")
public class ProjectDaoImpl extends AbstractDao<Integer, Project> implements ProjectDao{

    public List<Project> findAllProjects() {
        ArrayList<Project> projectList = (ArrayList<Project>) createEntityCriteria().add(Restrictions.eq("visible", true)).list();
        return projectList;
    }
    
    public List<Project> findInactiveProjects() {
        ArrayList<Project> projectList = (ArrayList<Project>) createEntityCriteria().add(Restrictions.eq("visible", false)).list();
        return projectList;
    }

    public List<Project> findProjectsByAuthor(User_1 user) {
        ArrayList<Project> projectList = (ArrayList<Project>) createEntityCriteria().add(Restrictions.eq("uSERid", user)).list();
        return projectList;
    }

    public void addNewProject(Project project) {
        persist(project);
    }

    public void hide(int projectId) {
        Project project = getByKey(projectId);
        project.setVisible(false);
        update(project);
    }
    
    public void show(int projectId) {
        Project project = getByKey(projectId);
        project.setVisible(true);
        update(project);
    }

  

    public Project findProjectById(int projectId) {
       return getByKey(projectId);
    }

  

  
    
}
