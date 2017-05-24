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
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.dao.DeviceDAO;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;
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
    public String getListDevice(Model model,
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

        List<DeviceInfo> listDevice = deviceDAO.getAllDeviceInfo(comId, page, num);
        model.addAttribute("listDevice", listDevice);
        return "/device/device_list";
    }
    
     @Autowired
    private EmployeeDAO employeeDAO;

    @RequestMapping({"/employeeList2"})
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

        List<EmployeeInfo> listEmployees = employeeDAO.queryEmployees(comId, page, num);
        model.addAttribute("listEmployees", listEmployees);
        return "/employee/employee_list";
    }

//    @RequestMapping({"/employee"})
//    public @ResponseBody
//    List<EmployeeInfo> getEmployeeById(Model model,
//            @RequestParam(value = "comId", defaultValue = "1") String comId,
//            @RequestParam(value = "employeeId", defaultValue = "0") String employeeId,
//            HttpServletRequest request) {
//
//        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
//        if (listCustomers.isEmpty()) {
//            return null;
//        } else {
//            CustomerInfo customerInfo = listCustomers.get(0);
//            comId = customerInfo.getCompanyId();
//            //System.out.println(comId);
//        }
//        List<EmployeeInfo> listEmployees = employeeDAO.findEmployeeInfo(comId, employeeId);
//
//        return listEmployees;
//    }
//    @RequestMapping(value = {"/employee/update"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
//    @Transactional(propagation = Propagation.NEVER)
//    public @ResponseBody
//    String checkLogin(@RequestBody EmployeeInfo obj, Model model, HttpServletRequest request) throws Exception {
//
//        String fdf = employeeDAO.updateEmployeeInfo(employeeInfo);
//        request.getSession().setAttribute("customerInfo", listCustomers);
//        return "";
//    }
}
