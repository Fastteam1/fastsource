/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
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
import vnpt.media.efinder.dao.DeviceDAO;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
@Controller
@EnableWebMvc
public class DeviceController {

    @Autowired
    private DeviceDAO deviceDAO;

    @Autowired
    private Environment env;

    @Autowired
    private EmployeeDAO employeeDAO;

    @Autowired
    private GeoFencingDAO geoFencingDAO;

    @RequestMapping({"/deviceList"})
    public String getListDevice(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            @RequestParam(value = "page", defaultValue = "1") String page,
            @RequestParam(value = "num", defaultValue = "999999999") String num,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
        }

        List<DeviceInfo> listDevices = deviceDAO.getAllDeviceInfo(comId, page, num);
        // EmployeeInfo
        List<EmployeeInfo> listEmployees = employeeDAO.queryEmployees(comId, page, num);
        // Xử lý GEoFencingINFo
        List<GeoFencingInfo> listGeoFences = geoFencingDAO.queryGeoFencingByCompanyId(comId);

        //  List<EmployeeInfo> listDevice = deviceDAO.getListEmployeeManage(comId, page, num);
        model.addAttribute("arrGeoFences", "Vùng địa lý");
        model.addAttribute("listDevices", listDevices);
        model.addAttribute("listGeoFences", listGeoFences);
        model.addAttribute("listEmployees", listEmployees);
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/device");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        return "/device/device_list";
    }

    @RequestMapping({"/device/getdetail"})
    public @ResponseBody
    List<DeviceInfo> getDeviceById(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            @RequestParam(value = "deviceId", defaultValue = "0") String deviceId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
            //System.out.println(comId);
        }
        List<DeviceInfo> listDevices = deviceDAO.findDeviceInfo(comId, deviceId);

        // GEOFencingInfo
        List<GeoFencingInfo> listGeoFences = geoFencingDAO.queryGeoFencingByDeviceId(deviceId);
        String[] arrGeoFences = new String[listGeoFences.size()];
        for (int i = 0; i < listGeoFences.size(); i++) {
            arrGeoFences[i] = listGeoFences.get(i).getId();
        }
        for (DeviceInfo device : listDevices) {
            device.setArrGeoFences(arrGeoFences);
        }

        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/device");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        return listDevices;
    }

    @RequestMapping(value = {"/device/update"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String updateDevice(@RequestBody DeviceInfo deviceInfo, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }

        // System.out.println("ARRR: " + Arrays.toString(deviceInfo.getArrGeoFences()));
        System.out.println("OKKKKKKKKKKKK--->" + deviceInfo);
        model.addAttribute("deviceInfo", deviceInfo);
        boolean result = false;
        try {
            result = deviceDAO.updateDeviceInfo(deviceInfo);
            System.out.println("Luu thanh cong du lieu ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình lưu dữ liệu!";
        }
        if (result) {
            return "Cập nhật dữ liệu thành công. |success";
        } else {
            return "Cập nhật dữ liệu thất bại. |error";
        }
    }

    @RequestMapping(value = {"/device/deactive"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String deActiveDevice(@RequestParam(value = "deviceId", defaultValue = "0") String deviceId, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }
        boolean result = false;
        try {
            result = deviceDAO.deleteDeviceInfo(deviceId);
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

    @RequestMapping(value = {"/device/insert"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String insertDevice(@RequestBody DeviceInfo deviceInfo, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        String comId = "0";
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
            //System.out.println(comId);
        }

        deviceInfo.setCompanyId(comId);

        System.out.println("OKKKKKKKKKKKK--->" + deviceInfo);
        model.addAttribute("deviceInfo", deviceInfo);
        boolean result = false;
        try {
            result = deviceDAO.insertDeviceInfo(deviceInfo);
            System.out.println("Insety thanh cong du lieu ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình insert dữ liệu!";
        }
        if (result) {
            return "Thêm mới dữ liệu thành công. |success";
        } else {
            return "Thêm mới dữ liệu thất bại. |error";
        }
    }

    // @RequestMapping({"/device/employeeList"})
    public List<EmployeeInfo> getListEmployee(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            @RequestParam(value = "page", defaultValue = "1") String page,
            @RequestParam(value = "num", defaultValue = "999999999") String num,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
        }

        List<EmployeeInfo> listEmployees = employeeDAO.queryEmployees(comId, page, num);

        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/device");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return listEmployees;
    }

    @RequestMapping({"/device/insertEmployee"})
    public @ResponseBody
    String insertEmployee(Model model, @RequestParam(value = "employeeId", defaultValue = "0") String employeeId,
            @RequestParam(value = "deviceId", defaultValue = "0") String deviceId,
            @RequestParam(value = "startTime", defaultValue = "0") String startTime,
            @RequestParam(value = "endTime", defaultValue = "0") String endTime,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }

        boolean result = false;
        try {
            result = deviceDAO.addEmployeeManage(deviceId, employeeId, startTime, endTime);
            System.out.println("Insety thanh cong du lieu ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình insert dữ liệu!";
        }
        if (result) {
            return "Thêm mới dữ liệu thành công. |success";
        } else {
            return "Thêm mới dữ liệu thất bại. |error";
        }
    }

    @RequestMapping({"/device/employeeList"})
    public @ResponseBody
    String getListDeviceByGeofenId(Model model,
            @RequestParam(value = "id", defaultValue = "0") String deviceId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        }

        String strListEmployees = deviceDAO.queryEmployeeByDeviceId(deviceId);
        //System.out.println(listDevices);

        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/device");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));
        return strListEmployees;
    }

}
