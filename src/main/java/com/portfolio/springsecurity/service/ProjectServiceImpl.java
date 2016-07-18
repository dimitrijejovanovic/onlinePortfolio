/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.service;

import com.portfolio.springsecurity.dao.FieldDao;
import com.portfolio.springsecurity.dao.ProjectDao;
import com.portfolio.springsecurity.dao.UserDao;
import com.portfolio.springsecurity.model.Field;
import com.portfolio.springsecurity.model.Image;
import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Dimitrije
 */
@Transactional
@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ServletContext context;

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private FieldDao fieldDao;

    @Autowired
    private UserDao userDao;

    public List<Project> findAllProjects() {
        return projectDao.findAllProjects();
    }

    public List<Project> findInactiveProjects() {
        return projectDao.findInactiveProjects();
    }

    public List<Project> findProjectsByAuthor(User_1 user) {
        return projectDao.findProjectsByAuthor(user);
    }

    public void addNewProject(Project project, String[] fieldNames, User_1 user, MultipartFile[] projectImages) {
        Collection<Field> fields = new HashSet<Field>();
        for (String fieldName : fieldNames) {
            fields.add(fieldDao.findFieldByName(fieldName));
        }
        project.setFieldCollection(fields);

        User_1 userFromDao = userDao.findById(user.getId());
        project.setUSERid(userFromDao);

        List<Image> imageList = new ArrayList<Image>();

        MultipartFile coverImage = projectImages[0];

        for (int i = 1; i < projectImages.length; i++) {

            if (!projectImages[i].isEmpty()) {

                try {
                    String filepath = context.getRealPath("/static/");
                    System.out.println(filepath);
                    FileOutputStream fos;

                    String[] multipartParts = projectImages[i].getOriginalFilename().split("\\.");
                    String extension = multipartParts[multipartParts.length - 1];
                    if (extension.equals("png") || extension.equals("jpg") || extension.equals("jpeg")) {

                        imageList.add(new Image());

                        String imageName = generateUniqueFileName() + "." + extension;
                        String filename = filepath + "\\" + imageName;
                        fos = new FileOutputStream(filename);
                        fos.write(projectImages[i].getBytes());
                        fos.close();

                        imageList.get(imageList.size() - 1).setPROJECTid(project);
                        imageList.get(imageList.size() - 1).setSrc(imageName);

                    } else {
                        System.out.println("nije dobra extenzija");
                    }

                } catch (FileNotFoundException ex) {
                    Logger.getLogger(ProjectServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(ProjectServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }
        project.setImageCollection(imageList);

        if (!coverImage.isEmpty()) {
            try {

                String filepath = context.getRealPath("/static/");
                System.out.println(filepath);
                FileOutputStream fos;
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                String[] multipartParts = coverImage.getOriginalFilename().split("\\.");
                String extension = multipartParts[multipartParts.length - 1];
                if (extension.equals("png") || extension.equals("jpg") || extension.equals("jpeg")) {

                    String imageName = generateUniqueFileName() + "." + extension;
                    String filename = filepath + "\\" + imageName;
                    fos = new FileOutputStream(filename);
                    fos.write(coverImage.getBytes());
                    fos.close();

                    project.setCoverImage(imageName);

                } else {
                    System.out.println("nije dobra extenzija");
                }

            } catch (FileNotFoundException ex) {
                Logger.getLogger(ProjectServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ProjectServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        projectDao.addNewProject(project);
    }

    public void hideProjectById(int id) {

        projectDao.hide(id);
    }

    public void showProjectById(int id) {

        projectDao.show(id);
    }

    public Project findById(int id) {
        return projectDao.findProjectById(id);
    }

    String generateUniqueFileName() {
        String filename = "";
        long millis = System.currentTimeMillis();

        String rndchars = RandomStringUtils.randomAlphanumeric(8);
        filename = rndchars + millis;
        return filename;
    }

}
