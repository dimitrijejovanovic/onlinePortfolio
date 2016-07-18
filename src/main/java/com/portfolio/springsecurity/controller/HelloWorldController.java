package com.portfolio.springsecurity.controller;

import com.portfolio.springsecurity.model.Field;
import com.portfolio.springsecurity.model.Project;
import com.portfolio.springsecurity.model.User_1;
import com.portfolio.springsecurity.model.User_1;
import com.portfolio.springsecurity.service.FieldService;
import com.portfolio.springsecurity.service.ProjectService;
import com.portfolio.springsecurity.service.UserService;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.validation.BindingResult;

@Controller
public class HelloWorldController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private FieldService fieldService;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        model.addAttribute("greeting", "Hi, Welcome to mysite");

        List<Project> projectList = projectService.findAllProjects();
        Collections.reverse(projectList);

        model.addAttribute("projects", projectList);

        List<Field> fieldList = fieldService.findAllFields();
        model.addAttribute("fields", fieldList);

        return "welcome";
    }

    @RequestMapping("/field/{fieldName}")
    public String getRegister(ModelMap model, @PathVariable("fieldName") String fieldName) {
        List<Project> projectList = projectService.findAllProjects();
        Collections.reverse(projectList);
        Field chosenField = fieldService.findFieldByName(fieldName);
        List<Project> projectResults = new ArrayList<Project>();

        for (Project project : projectList) {
            for (Field fieldInProject : project.getFieldCollection()) {
                if (fieldInProject.equals(chosenField)) {
                    projectResults.add(project);
                }
            }
        }
        model.addAttribute("projects", projectResults);
        model.addAttribute("chosenField", chosenField);

        List<Field> fieldList = fieldService.findAllFields();
        model.addAttribute("fields", fieldList);

        return "projectsByField";
    }

    @RequestMapping("/{projectId}")
    public String project(ModelMap model, @PathVariable("projectId") int projectId) {
        Project project = projectService.findById(projectId);
        User_1 user = project.getUSERid();
        model.addAttribute("project", project);
        model.addAttribute("user", user);

        return "projectDetails";
    }

    @RequestMapping("/register")
    public String getRegister(ModelMap model) {

        model.addAttribute("newUser", new User_1());

        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(@Valid @ModelAttribute("newUser") User_1 user, BindingResult bindingResult, ModelMap model) {

        if (bindingResult.hasErrors()) {
            return "/register";
        }
        String usernameError = "";

        List<User_1> allUsers = userService.findActiveUsers();
        allUsers.addAll(userService.findInactiveUsers());

        for (User_1 existingUser : allUsers) {
            if (existingUser.getUsername().equals(user.getUsername())) {
                usernameError = "username " + user.getUsername() + " already exists.";
                model.addAttribute("usernameError", usernameError);
                return "/register";
            }
        }

        userService.registerUser(user);

        return "newUserWellcome";
    }

    @RequestMapping("/myProfile/edit")
    public String editUserGet(ModelMap model) {

        User_1 user = getUser();
        model.addAttribute("oldUser", user);
        model.addAttribute("updatedUser", user);

        return "editUser";
    }

    @RequestMapping(value = "/myProfile/edit", method = RequestMethod.POST)
    public String editUserPost(ModelMap model, @ModelAttribute("updatedUser") User_1 newUser, @ModelAttribute("oldUser") User_1 olduser, @RequestParam("p1") String pass1, @RequestParam("p2") String pass2, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "/myProfile/edit";
        }

        if (pass1 != null && !pass1.equals("")) {
            if (pass1.equals(pass2)) {
                newUser.setPassword(pass1);
            } else {
                model.addAttribute("message", "invalid password change");
                return "userChanges";
            }
        }
        model.addAttribute("message", "your profile is successfully updated");
        userService.updateUser(newUser);

        return "userChanges";
    }

    @RequestMapping(value = "/myProfile", method = RequestMethod.GET)
    public String myProfilePage(ModelMap model) {

        User_1 u = getUser();
        Set<Project> projects = new HashSet<Project>();
        projects.addAll(projectService.findProjectsByAuthor(u));

        model.addAttribute("user", u);
        model.addAttribute("projects", projects);

        return "myProfile";
    }

    @RequestMapping(value = "/myProfile/newProject", method = RequestMethod.GET)
    public String newProject(ModelMap model) {

        Set<Field> fieldSet = new HashSet<Field>();
        fieldSet.addAll(fieldService.findAllFields());

        model.addAttribute("fieldList", fieldSet);
        model.addAttribute("newProject", new Project());
        model.addAttribute("user1", getUser());
        return "newProject";
    }

    @RequestMapping(value = "/myProfile/newProject", method = RequestMethod.POST)
    public String postProject(
            ModelMap model,
            @ModelAttribute("newProject") Project project,
            @RequestParam("fieldNames") String[] fieldNames,
            @RequestParam("projectImages") MultipartFile[] projectImages)
            throws FileNotFoundException, IOException {

        User_1 user = getUser();
        projectService.addNewProject(project, fieldNames, user, projectImages);

        model.addAttribute("message", "successfully uploaded project");
        return "userChanges";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {

        model.addAttribute("user", getUser());

        Set<Project> projectSet = new HashSet<Project>();
        projectSet.addAll(projectService.findAllProjects());
        model.addAttribute("projects", projectSet);

        Set<Project> inactiveProjectSet = new HashSet<Project>();
        inactiveProjectSet.addAll(projectService.findInactiveProjects());
        model.addAttribute("nprojects", inactiveProjectSet);

        Set<User_1> userSet = new HashSet<User_1>();
        userSet.addAll(userService.findActiveUsers());
        model.addAttribute("users", userSet);

        Set<User_1> inactiveUserSet = new HashSet<User_1>();
        inactiveUserSet.addAll(userService.findInactiveUsers());
        model.addAttribute("nusers", inactiveUserSet);

        return "admin";
    }

    @RequestMapping(value = "/admin/hide/{id}", method = RequestMethod.GET)
    public String adminPageHideProject(ModelMap model, @PathVariable("id") int id) {
        projectService.hideProjectById(id);

        return "adminChanges";
    }

    @RequestMapping(value = "/myProfile/hide/{id}", method = RequestMethod.GET)
    public String myProfilePageHideProject(ModelMap model, @PathVariable("id") int id) {
        projectService.hideProjectById(id);

        return "userChanges";
    }

    @RequestMapping(value = "/admin/show/{id}", method = RequestMethod.GET)
    public String adminPageShowProject(ModelMap model, @PathVariable("id") int id) {
        projectService.showProjectById(id);

        return "adminChanges";
    }

    @RequestMapping(value = "/admin/deactivate/{id}", method = RequestMethod.GET)
    public String adminPageDeactivate(ModelMap model, @PathVariable("id") int id) {

        System.out.println("user for deleting: " + id);
        User_1 user = userService.findById(id);
        user.setState("Inactive");
        userService.updateUser(user);
        return "adminChanges";
    }

    @RequestMapping(value = "/admin/activate/{id}", method = RequestMethod.GET)
    public String adminPageActivate(ModelMap model, @PathVariable("id") int id) {

        System.out.println("user for deleting: " + id);
        User_1 user = userService.findById(id);
        user.setState("Active");
        userService.updateUser(user);
        return "adminChanges";
    }

    @RequestMapping(value = "/db", method = RequestMethod.GET)
    public String dbaPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "dba";
    }

    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    private User_1 getUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userName = null;
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        }
        User_1 user = userService.findByUsername(userName);
        return user;
    }

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

}
