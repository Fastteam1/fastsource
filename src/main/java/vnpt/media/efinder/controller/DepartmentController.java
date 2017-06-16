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
import vnpt.media.efinder.dao.DepartmentDAO;
import vnpt.media.efinder.dao.DeviceDAO;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.DepartmentInfo;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.model.EmployeeTime;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
@Controller
@EnableWebMvc
public class DepartmentController {

    @Autowired
    private DepartmentDAO departmentDAO;

    @Autowired
    private Environment env;


    @RequestMapping({"/departmentList"})
    public String getListDevice(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "redirect:/login";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
        }

        List<DepartmentInfo> listDepartment = departmentDAO.queryDepartments(comId);

      
        model.addAttribute("listDepartment", listDepartment);
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/department");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        return "/department/department_list";
    }
    
    @RequestMapping(value = {"/department/insert"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String insertDepartment(@RequestBody DepartmentInfo departmentInfo, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        String comId = "0";
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
            //System.out.println(comId);
        }

        departmentInfo.setCompanyId(comId);

        System.out.println("OKKKKKKKKKKKK--->" + departmentInfo);
        model.addAttribute("departmentInfo", departmentInfo);
        boolean result = false;
        try {
            result = departmentDAO.insertDepartmentInfo(departmentInfo);
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
    
    @RequestMapping(value = {"/department/delete"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String deactiveDepartment(@RequestParam(value = "departmentId", defaultValue = "0") String departmentId, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }
        boolean result = false;
        try {
            result = departmentDAO.deleteDepartmentInfo(departmentId);
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
    
    @RequestMapping({"/department/getdetail"})
    public @ResponseBody
    List<DepartmentInfo> getDepartmentById(Model model,
            @RequestParam(value = "departmentId", defaultValue = "0") String departmentId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        } else {
            
            //System.out.println(comId);
        }
        List<DepartmentInfo> listDepartment = departmentDAO.findDepartmentInfo(departmentId);

        // GEOFencingInfo
        model.addAttribute("urlInfo", env.getProperty(Constants.URL_PROJECT) + "/department");
        model.addAttribute("urlProject", env.getProperty(Constants.URL_PROJECT));

        return listDepartment;
    }
    
    @RequestMapping(value = {"/department/update"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String updateDepartment(@RequestBody DepartmentInfo departmentInfo, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }

        // System.out.println("ARRR: " + Arrays.toString(deviceInfo.getArrGeoFences()));
        System.out.println("OKKKKKKKKKKKK--->" + departmentInfo);
        model.addAttribute("deviceInfo", departmentInfo);
        boolean result = false;
        try {
            result = departmentDAO.updateDepartmentInfo(departmentInfo);
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
