package com.portfolio.springsecurity.model;

import com.portfolio.springsecurity.model.Field;
import com.portfolio.springsecurity.model.Image;
import com.portfolio.springsecurity.model.User_1;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-12T11:24:59")
@StaticMetamodel(Project.class)
public class Project_ { 

    public static volatile SingularAttribute<Project, Boolean> visible;
    public static volatile CollectionAttribute<Project, Image> imageCollection;
    public static volatile SingularAttribute<Project, String> coverImage;
    public static volatile SingularAttribute<Project, String> description;
    public static volatile SingularAttribute<Project, Integer> likeCount;
    public static volatile SingularAttribute<Project, Integer> id;
    public static volatile SingularAttribute<Project, Integer> viewCount;
    public static volatile SingularAttribute<Project, String> title;
    public static volatile CollectionAttribute<Project, Field> fieldCollection;
    public static volatile SingularAttribute<Project, User_1> uSERid;

}