/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
@Controller
@EnableWebMvc
public class GeoFencingController {
    @Autowired
    private GeoFencingDAO geoFencingDAO;
    
    @RequestMapping({"/geoFenceList"})
    public @ResponseBody String getListEmployee(Model model,
            @RequestParam(value = "id", defaultValue = "0") String id,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "/forms/login";
        }

        List<GeoFencingInfo> listGeofences = geoFencingDAO.queryGeoFencingByGeoFencingId(id);
        model.addAttribute("listGeofences", listGeofences);
        return "/employee/employee_list";
    }
}
