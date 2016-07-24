package com.portfolio.springsecurity.model;

import com.portfolio.springsecurity.model.Project;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-12T11:24:59")
@StaticMetamodel(Image.class)
public class Image_ { 

    public static volatile SingularAttribute<Image, String> src;
    public static volatile SingularAttribute<Image, Integer> id;
    public static volatile SingularAttribute<Image, Project> pROJECTid;
    public static volatile SingularAttribute<Image, String> title;

}