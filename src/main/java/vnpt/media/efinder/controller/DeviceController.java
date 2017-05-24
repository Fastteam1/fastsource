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
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.DeviceInfo;
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

    @RequestMapping({"/deviceList"})
    public String getListEmployee(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            @RequestParam(value = "page", defaultValue = "1") String page,
            @RequestParam(value = "num", defaultValue = "999999999") String num,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "/forms/login";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
        }
        
        List<DeviceInfo> listDevices = deviceDAO.getAllDeviceInfo(comId, page, num);
        model.addAttribute("listDevices", listDevices);
        return "/device/device_list";
    }
    
    @RequestMapping({"/device"})
    public @ResponseBody
    List<DeviceInfo> getDeviceById(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            @RequestParam(value = "deviceId", defaultValue = "0") String employeeId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
            //System.out.println(comId);
        }
        List<DeviceInfo> listDevice = deviceDAO.findDeviceInfo(comId, employeeId);

        return listDevice;
    }
    
    @RequestMapping(value = {"/device/update"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String updateDevice(@RequestBody DeviceInfo deviceInfo, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }

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


}
