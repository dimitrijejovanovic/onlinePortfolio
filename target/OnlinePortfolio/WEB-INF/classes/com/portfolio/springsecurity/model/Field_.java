package com.portfolio.springsecurity.model;

import com.portfolio.springsecurity.model.Project;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-12T11:24:59")
@StaticMetamodel(Field.class)
public class Field_ { 

    public static volatile SingularAttribute<Field, String> name;
    public static volatile SingularAttribute<Field, Integer> id;
    public static volatile CollectionAttribute<Field, Project> projectCollection;

}