package com.solution4future.models;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Offer {

    @Digits(integer = 5, fraction = 2)
    private Double totalDiscount;

    @NotNull
    private String title;

    @NotNull
    private String description;
}
