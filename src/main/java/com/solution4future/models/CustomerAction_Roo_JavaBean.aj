// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.solution4future.models;

import com.solution4future.models.CustomerAction;
import java.util.Date;

privileged aspect CustomerAction_Roo_JavaBean {
    
    public Date CustomerAction.getActionDate() {
        return this.actionDate;
    }
    
    public void CustomerAction.setActionDate(Date actionDate) {
        this.actionDate = actionDate;
    }
    
    public String CustomerAction.getDescription() {
        return this.description;
    }
    
    public void CustomerAction.setDescription(String description) {
        this.description = description;
    }
    
}