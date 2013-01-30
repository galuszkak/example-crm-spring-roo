package com.solution4future.controllers;

import com.solution4future.models.CustomerAction;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/customeractions")
@Controller
@RooWebScaffold(path = "customeractions", formBackingObject = CustomerAction.class)
public class CustomerActionController {
}
