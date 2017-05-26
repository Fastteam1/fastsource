/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.util.Constants;
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
    @Autowired
    private Environment env;

    @RequestMapping({"/geoFenceList"})
    public String getListEmployee(Model model,
            @RequestParam(value = "id", defaultValue = "0") String comId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
        }

        List<GeoFencingInfo> listGeofences = geoFencingDAO.queryGeoFencingByCompanyId(comId);
        System.out.println(listGeofences);
        model.addAttribute("listGeofences", listGeofences);

        model.addAttribute("deleteConfirmMessage", "Bạn có chắc chắn muốn xóa?");
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/employee");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return "/geofence/geofence_list";
    }

    @RequestMapping({"/editGeoFence"})
    public String editGeoFence(Model model,
            @RequestParam(value = "id", defaultValue = "0") String geoFenceId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        model.addAttribute("geoFenceId", geoFenceId);
        return "/geofence/geofence_edit";
    }

    @RequestMapping({"/update"})
    public String updateGeoFence(Model model,
            @RequestBody GeoFencingInfo geoFencingInfo,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        JSONObject obj1 = new JSONObject(geoFencingInfo.getLocation());
        JSONArray ar1 = obj1.getJSONArray("features");
        JSONObject obj2 = ar1.getJSONObject(0).getJSONObject("geometry");
        JSONArray ar2 = obj2.getJSONArray("coordinates").getJSONArray(0);
        
        

        return "/geofence/geofence_edit";
    }

    @RequestMapping({"/map"})
    public String googleMap(Model model, @RequestParam(value = "id", defaultValue = "0") String geoFenceId, HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        List<GeoFencingInfo> listGeofences = geoFencingDAO.queryGeoFencingByGeoFencingId(geoFenceId);
        //System.out.println("IDDD: " + geoFenceId);
        if (listGeofences.size() > 0) {
            model.addAttribute("editGeofence", listGeofences.get(0));
        } else {
            model.addAttribute("editGeofence", new GeoFencingInfo());
        }

        model.addAttribute("deleteConfirmMessage", "Bạn có chắc chắn muốn xóa?");
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/employee");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return "/include/google_map";
    }
}
