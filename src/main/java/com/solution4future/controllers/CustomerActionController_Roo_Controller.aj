// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.solution4future.controllers;

import com.solution4future.controllers.CustomerActionController;
import com.solution4future.enums.ActionType;
import com.solution4future.models.Customer;
import com.solution4future.models.CustomerAction;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CustomerActionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CustomerActionController.create(@Valid CustomerAction customerAction, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, customerAction);
            return "customeractions/create";
        }
        uiModel.asMap().clear();
        customerAction.persist();
        return "redirect:/customeractions/" + encodeUrlPathSegment(customerAction.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CustomerActionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CustomerAction());
        return "customeractions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CustomerActionController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("customeraction", CustomerAction.findCustomerAction(id));
        uiModel.addAttribute("itemId", id);
        return "customeractions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CustomerActionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("customeractions", CustomerAction.findCustomerActionEntries(firstResult, sizeNo));
            float nrOfPages = (float) CustomerAction.countCustomerActions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("customeractions", CustomerAction.findAllCustomerActions());
        }
        addDateTimeFormatPatterns(uiModel);
        return "customeractions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CustomerActionController.update(@Valid CustomerAction customerAction, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, customerAction);
            return "customeractions/update";
        }
        uiModel.asMap().clear();
        customerAction.merge();
        return "redirect:/customeractions/" + encodeUrlPathSegment(customerAction.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CustomerActionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, CustomerAction.findCustomerAction(id));
        return "customeractions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CustomerActionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CustomerAction customerAction = CustomerAction.findCustomerAction(id);
        customerAction.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/customeractions";
    }
    
    void CustomerActionController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("customerAction_actiondate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void CustomerActionController.populateEditForm(Model uiModel, CustomerAction customerAction) {
        uiModel.addAttribute("customerAction", customerAction);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("actiontypes", Arrays.asList(ActionType.values()));
        uiModel.addAttribute("customers", Customer.findAllCustomers());
    }
    
    String CustomerActionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
