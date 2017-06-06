/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.dao.CustomerDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
@Controller
// Cần thiết cho Hibernate Transaction.
@Transactional
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class CustomerController {

    @Autowired
    private Environment env;
    
    @Autowired
    private CustomerDAO customerDAO;
    
    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);

    }

    @RequestMapping(value = {"/login", "/"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return "/login";
    }

    @RequestMapping({"/logout"})
    public String logout(HttpServletRequest request) {
        Utils.removeCustomerListInSession(request);
        return "redirect:/login";
    }

    @RequestMapping("/403")
    public String accessDenied() {
        return "/403";
    }

    @RequestMapping("/register")
    public String register() {
        return "/forms/register";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    List<CustomerInfo> checkLogin(@RequestParam("username") String username,
            @RequestParam("password") String password, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = customerDAO.queryCustomers(username, password);
        request.getSession().setAttribute("customerInfo", listCustomers);
        return listCustomers;
    }

}
