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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.model.LogTrackingDeviceInfo;
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

    /**
     * Controller lay danh sach tat ca GeoFencing
     *
     * @param model
     * @param comId
     * @param request
     * @return
     */
    @RequestMapping({"/geoFenceList"})
    public String getListGeoFence(Model model,
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
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return "/geofence/geofence_list";
    }

    /**
     * Lay chi tiet 1 GeoFencing
     *
     * @param model
     * @param geoFenceId
     * @param request
     * @return
     */
    @RequestMapping(value = {"/geoFence/update"}, method = RequestMethod.GET)
    public String getGeoFenceById(Model model,
            @RequestParam(value = "id", defaultValue = "0") String geoFenceId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        // Truyen vao Frame
        model.addAttribute("geoFenceId", geoFenceId);

        if (geoFenceId.equalsIgnoreCase("0")) {
            // Them moi
            return "/geofence/geofence_add";
        }
        return "/geofence/geofence_edit";
    }

    /**
     * Update GeoFencing
     *
     * @param geoFencingInfo
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = {"/geoFence/update"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String updateGeoFence(@RequestBody GeoFencingInfo geoFencingInfo, Model model, HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        //System.out.println("geFencingInfo" + geoFencingInfo.getLocation());
        JSONObject obj1 = new JSONObject(geoFencingInfo.getLocation());
        JSONArray ar1 = obj1.getJSONArray("features");
        JSONObject obj2 = ar1.getJSONObject(0).getJSONObject("geometry");
        JSONArray ar2 = obj2.getJSONArray("coordinates").getJSONArray(0);
        geoFencingInfo.setLocation(ar2.toString());

        boolean result = false;
        try {
            result = geoFencingDAO.updateGeoFencing(geoFencingInfo);
            //System.out.println("Luu thanh cong du lieu ------>");
        } catch (Exception e) {
            //System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình lưu dữ liệu!";
        }
        if (result) {
            return "Cập nhật dữ liệu thành công. |success";
        } else {
            return "Cập nhật dữ liệu thất bại. |error";
        }
    }

    /**
     * Them moi GeoFencing
     *
     * @param geoFencingInfo
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = {"/geoFence/insert"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String insertGeoFence(@RequestBody GeoFencingInfo geoFencingInfo, Model model, HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            geoFencingInfo.setCompanyId(customerInfo.getCompanyId());
        }

        //System.out.println("geFencingInfo" + geoFencingInfo.getLocation());
        JSONObject obj1 = new JSONObject(geoFencingInfo.getLocation());
        JSONArray ar1 = obj1.getJSONArray("features");
        JSONObject obj2 = ar1.getJSONObject(0).getJSONObject("geometry");
        JSONArray ar2 = obj2.getJSONArray("coordinates").getJSONArray(0);
        geoFencingInfo.setLocation(ar2.toString());

        boolean result = false;
        try {
            result = geoFencingDAO.insertGeoFencingInCompany(geoFencingInfo);
            System.out.println("Them moi thanh cong du lieu ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình thêm mới dữ liệu!";
        }
        if (result) {
            return "Thêm mới dữ liệu thành công. |success";
        } else {
            return "Thêm mới dữ liệu thất bại. |error";
        }
    }

    /**
     * Chen google map vao luc insert or update
     *
     * @param model
     * @param geoFenceId
     * @param request
     * @return
     */
    @RequestMapping({"/geoFence/map"})
    public String googleMap(Model model, @RequestParam(value = "id", defaultValue = "0") String geoFenceId, HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        List<GeoFencingInfo> listGeofences = geoFencingDAO.queryGeoFencingByGeoFencingId(geoFenceId);
        //System.out.println("IDDD: " + geoFenceId);
        if (listGeofences.size() > 0) {
            model.addAttribute("editGeofence", listGeofences.get(0));
            System.out.println("DES: " + listGeofences.get(0).getDescription());
        } else {
            model.addAttribute("editGeofence", new GeoFencingInfo());
        }

        model.addAttribute("addGeofenceTitle", "Bạn có muốn thêm vùng địa lý?");
        model.addAttribute("editGeofenceTitle", "Bạn có muốn cập nhật vùng địa lý?");
        model.addAttribute("deleteGeofenceTitle", "Bạn có muốn xóa vùng địa lý này ko?");
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        if (geoFenceId.equalsIgnoreCase("0")) {
            return "/geofence/map_geofence_add";
        }
        return "/geofence/map_geofence_edit";
    }

    /**
     * Danh sach thiet bi theo GeoFencingId
     *
     * @param model
     * @param geofenceId
     * @param request
     * @return
     */
    @RequestMapping({"/geoFence/deviceList"})
    public @ResponseBody
    String getListDeviceByGeofenId(Model model,
            @RequestParam(value = "id", defaultValue = "0") String geofenceId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        }

        String strListDevices = geoFencingDAO.queryDeviceByGeoFencingId(geofenceId);
        //System.out.println(listDevices);

        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return strListDevices;
    }

    /**
     * DeActive 1 GeoFencing
     *
     * @param geoFenceId
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = {"/geoFence/deactive"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String deActiveGeoFence(@RequestParam(value = "geofenceId", defaultValue = "0") String geoFenceId, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }
        boolean result = false;
        try {
            result = geoFencingDAO.deleteGeoFencingInList(geoFenceId);
            System.out.println("DeActive thanh cong ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình xử lý!";
        }

        if (result) {
            return "Xóa dữ liệu thành công. |success";
        } else {
            return "Xóa dữ liệu thất bại. |error";
        }
    }

    /**
     * Get Danh sach GeoFencing (theo doi thiet bi)
     *
     * @param model
     * @param comId
     * @param request
     * @return
     */
    @RequestMapping({"/geoFence/trackingDevice"})
    public String getLisTrackingDevice(Model model,
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
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        return "/geofence/geofence_device_list";
    }

    /**
     * theo doi và hien thi chi tiet cac thiet bi trong 1 vung
     *
     * @param model
     * @param geoFenceId
     * @param page
     * @param num
     * @param request
     * @return
     */
    @RequestMapping(value = {"/geoFence/tracking_detail"}, method = RequestMethod.GET)
    public String viewDetailDeviceTracking(Model model,
            @RequestParam(value = "id", defaultValue = "0") String geoFenceId,
            @RequestParam(value = "page", defaultValue = "1") String page,
            @RequestParam(value = "num", defaultValue = "999999999") String num,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        List<LogTrackingDeviceInfo> listTrackingDevices = geoFencingDAO.queryLogTrackingByGeoFencingId(geoFenceId, page, num);

        // Truyen vao Frame
        model.addAttribute("geoFenceId", geoFenceId);
        model.addAttribute("listTrackingDevices", listTrackingDevices);
        model.addAttribute("deleteConfirmMessage", "Bạn có chắc chắn muốn xóa?");
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        if (geoFenceId.equalsIgnoreCase("0")) {
            // Them moi
            return "redirect:/geoFence/trackingDevice";
        }
        return "/geofence/geofence_device_detail";
    }

    /**
     * Chen map vao theo doi thiet bi
     *
     * @param model
     * @param geoFenceId
     * @param request
     * @return
     */
    @RequestMapping({"/geoFence/map_tracking_detail"})
    public String getMapDetailTrackingDevice(Model model, @RequestParam(value = "id", defaultValue = "0") String geoFenceId, HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        }

        List<GeoFencingInfo> listGeofences = geoFencingDAO.queryGeoFencingByGeoFencingId(geoFenceId);
        //System.out.println("IDDD: " + geoFenceId);
        if (listGeofences.size() > 0) {
            model.addAttribute("geoFenceInfo", listGeofences.get(0));
        } else {
            model.addAttribute("geoFenceInfo", new GeoFencingInfo());
        }

        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/geoFence");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        return "/geofence/map_geofence_device_detail";
    }

}
