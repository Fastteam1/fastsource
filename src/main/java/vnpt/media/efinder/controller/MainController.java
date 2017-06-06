/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.util.Constants;

/**
 *
 * @author vnpt2
 */
@Controller
// Cần thiết cho Hibernate Transaction.
@Transactional
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class MainController {

    @Autowired
    private Environment env;

    @RequestMapping(value = {"/login1"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return "/login";
    }
}
