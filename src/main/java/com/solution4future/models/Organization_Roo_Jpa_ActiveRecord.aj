// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.solution4future.models;

import com.solution4future.models.Organization;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Organization_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Organization.entityManager;
    
    public static final EntityManager Organization.entityManager() {
        EntityManager em = new Organization().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Organization.countOrganizations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Organization o", Long.class).getSingleResult();
    }
    
    public static List<Organization> Organization.findAllOrganizations() {
        return entityManager().createQuery("SELECT o FROM Organization o", Organization.class).getResultList();
    }
    
    public static Organization Organization.findOrganization(Long id) {
        if (id == null) return null;
        return entityManager().find(Organization.class, id);
    }
    
    public static List<Organization> Organization.findOrganizationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Organization o", Organization.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Organization.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Organization.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Organization attached = Organization.findOrganization(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Organization.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Organization.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Organization Organization.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Organization merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
