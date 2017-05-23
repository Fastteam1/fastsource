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
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
@Controller
@EnableWebMvc
public class EmployeeController {

    @Autowired
    private EmployeeDAO employeeDAO;

    @RequestMapping({"/employeeList"})
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

    @RequestMapping({"/employee"})
    public @ResponseBody
    List<EmployeeInfo> getEmployeeById(Model model,
            @RequestParam(value = "comId", defaultValue = "1") String comId,
            @RequestParam(value = "employeeId", defaultValue = "0") String employeeId,
            HttpServletRequest request) {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return null;
        } else {
            CustomerInfo customerInfo = listCustomers.get(0);
            comId = customerInfo.getCompanyId();
            //System.out.println(comId);
        }
        List<EmployeeInfo> listEmployees = employeeDAO.findEmployeeInfo(comId, employeeId);

        return listEmployees;
    }

    @RequestMapping(value = {"/employee/update"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String updateEmployee(@RequestBody EmployeeInfo employeeInfo, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }

        System.out.println("OKKKKKKKKKKKK--->" + employeeInfo);
        model.addAttribute("employeeInfo", employeeInfo);
        boolean result = false;
        try {
            result = employeeDAO.updateEmployeeInfo(employeeInfo);
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

    @RequestMapping("/employee/deactive")
    public @ResponseBody
    String deActiveEmployee(@RequestParam(value = "employeeId", defaultValue = "0") String employeeId, Model model, HttpServletRequest request) throws Exception {

        List<CustomerInfo> listCustomers = Utils.getCustomerListInSession(request);
        if (listCustomers.isEmpty()) {
            return "Chưa đăng nhập";
        }
        boolean result = false;
        try {
            result = employeeDAO.deleteEmployeeInfo(employeeId);
            System.out.println("DeActive thanh cong ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình xử lý!";
        }

        if (result) {
            return "Cập nhật dữ liệu thành công. |success";
        } else {
            return "Cập nhật dữ liệu thất bại. |error";
        }
    }
}
