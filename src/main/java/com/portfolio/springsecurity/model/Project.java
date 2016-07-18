/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portfolio.springsecurity.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author Dimitrije
 */
@Entity
@Table(name = "project")
//@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Project.findAll", query = "SELECT p FROM Project p"),
//    @NamedQuery(name = "Project.findById", query = "SELECT p FROM Project p WHERE p.id = :id"),
//    @NamedQuery(name = "Project.findByDescription", query = "SELECT p FROM Project p WHERE p.description = :description"),
//    @NamedQuery(name = "Project.findByLikeCount", query = "SELECT p FROM Project p WHERE p.likeCount = :likeCount"),
//    @NamedQuery(name = "Project.findByTitle", query = "SELECT p FROM Project p WHERE p.title = :title"),
//    @NamedQuery(name = "Project.findByViewCount", query = "SELECT p FROM Project p WHERE p.viewCount = :viewCount")})
public class Project implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "project_id")
    private int id;
    
    @Column(name = "description")
    private String description;
    @Column(name = "like_count")
    private Integer likeCount = 0;
    
    @Basic(optional = false)
    @Column(name = "title")
    private String title;
    
    @Column(name = "view_count")
    private Integer viewCount = 0;
    
    @JoinTable(name = "field_project", joinColumns = {
        @JoinColumn(name = "project_id")}, inverseJoinColumns = {
        @JoinColumn(name = "field_id")})
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Field> fieldCollection;
    
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "pROJECTid")
    @Fetch(value = FetchMode.SUBSELECT)
    private Collection<Image> imageCollection;
    
    @JoinColumn(name = "user_id")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    private User_1 uSERid;
    
    private boolean visible = true;
    
    private String coverImage;

    public Project() {
    }

    public Project(int id) {
        this.id = id;
    }

    public Project(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    @XmlTransient
    public Collection<Field> getFieldCollection() {
        return fieldCollection;
    }

    public void setFieldCollection(Collection<Field> fieldCollection) {
        this.fieldCollection = fieldCollection;
    }

    @XmlTransient
    public Collection<Image> getImageCollection() {
        return imageCollection;
    }

    public void setImageCollection(Collection<Image> imageCollection) {
        this.imageCollection = imageCollection;
    }

    public User_1 getUSERid() {
        return uSERid;
    }

    public void setUSERid(User_1 uSERid) {
        this.uSERid = uSERid;
    }
    
     public boolean isVisible() {
        return visible;
    }


    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Project)) {
            return false;
        }
        Project other = (Project) object;
        if ((this.id != other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.websystique.hibernate.model.Project[ id=" + id + " ]";
    }

    /**
     * @return the coverImage
     */
    public String getCoverImage() {
        return coverImage;
    }

    /**
     * @param coverImage the coverImage to set
     */
    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

   
   
    
}
