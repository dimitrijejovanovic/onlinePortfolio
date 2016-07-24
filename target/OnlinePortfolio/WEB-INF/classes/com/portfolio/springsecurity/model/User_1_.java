package com.portfolio.springsecurity.model;

import com.portfolio.springsecurity.model.Profiles;
import com.portfolio.springsecurity.model.Project;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-12T11:24:59")
@StaticMetamodel(User_1.class)
public class User_1_ { 

    public static volatile SingularAttribute<User_1, String> country;
    public static volatile SingularAttribute<User_1, String> lastName;
    public static volatile SingularAttribute<User_1, String> city;
    public static volatile SingularAttribute<User_1, String> aboutMe;
    public static volatile SingularAttribute<User_1, String> webSite;
    public static volatile SingularAttribute<User_1, String> firstName;
    public static volatile SingularAttribute<User_1, String> password;
    public static volatile CollectionAttribute<User_1, Profiles> profilesCollection;
    public static volatile SingularAttribute<User_1, String> phone;
    public static volatile SingularAttribute<User_1, Integer> id;
    public static volatile SingularAttribute<User_1, String> state;
    public static volatile CollectionAttribute<User_1, Project> projectCollection;
    public static volatile SingularAttribute<User_1, String> email;
    public static volatile SingularAttribute<User_1, String> username;

}