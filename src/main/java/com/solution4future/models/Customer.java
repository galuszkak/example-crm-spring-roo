package com.solution4future.models;

import com.solution4future.enums.Status;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Customer {

    @NotNull
    @Size(min = 4, max = 30)
    private String firstName;

    @NotNull
    @Size(min = 4, max = 30)
    private String lastName;

    private String phone;

    @Enumerated(EnumType.STRING)
    private Status status;

    @NotNull
    private Boolean isSpecialOffer;

    @ManyToOne
    private Organization organization;

    @ManyToOne
    private Offer offer;
    
    @OneToMany(mappedBy="customer")
    private Set<CustomerAction> customersActions = new HashSet<CustomerAction>();
}
