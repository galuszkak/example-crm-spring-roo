package com.solution4future.controllers;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solution4future.models.Customer;

@RequestMapping("/customers")
@Controller
@RooWebScaffold(path = "customers", formBackingObject = Customer.class)
public class CustomerController {
}
