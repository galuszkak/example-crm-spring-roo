package com.solution4future.controllers;

import com.solution4future.models.Organization;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/organizations")
@Controller
@RooWebScaffold(path = "organizations", formBackingObject = Organization.class)
public class OrganizationController {
}
