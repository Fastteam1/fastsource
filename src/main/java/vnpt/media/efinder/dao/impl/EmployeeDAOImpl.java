/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class EmployeeDAOImpl implements EmployeeDAO {

    @Override
    public List<EmployeeInfo> queryEmployees(String comId, String page, String num) {
        String url = "http://10.1.36.36:8084/ApiBase/api/info/employee?action=getList";
        url = url + "&comId=" + comId + "&page=" + page + "&num=" + num;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public List<EmployeeInfo> findEmployeeInfo(String comId, String employeeId) {
        String url = "http://10.1.36.36:8084/ApiBase/api/info/employee?action=getInfo";
        url = url + "&comId=" + comId + "&employeeId=" + employeeId;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public boolean updateEmployeeInfo(EmployeeInfo employeeInfo) {
        try {
            String url = "http://10.1.36.36:8084/ApiBase/api/info/employee/update?employeeId=" + employeeInfo.getId();

            String urlParameters = "name=" + employeeInfo.getName() + "&phone=" + employeeInfo.getPhone()
                    + "&department=" + employeeInfo.getDepartment() + "&description=" + employeeInfo.getDescription()
                    + "&address=" + employeeInfo.getAddress() + "&email=" + employeeInfo.getEmail();

            String data = Utils.readUrlPOST(url, urlParameters);

            Gson gson = new Gson();
            JsonObject root = gson.fromJson(data, JsonObject.class);
            String errorCode = root.get("errorCode").toString();
            return errorCode.equalsIgnoreCase("0");
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static void main(String[] args) {
        EmployeeInfo e = new EmployeeInfo();
        e.setId("1");
        e.setName("TranLong");
        System.out.println(new EmployeeDAOImpl().updateEmployeeInfo(e));
    }

}
