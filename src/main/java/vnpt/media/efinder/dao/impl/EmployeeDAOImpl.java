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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class EmployeeDAOImpl implements EmployeeDAO {

    @Autowired
    Environment env;

    @Override
    public List<EmployeeInfo> queryEmployees(String comId, String page, String num) {
        String url = "http://10.1.36.17:8080/ApiBase/api/info/employee?action=getList";
        url = url + "&comId=" + comId + "&page=" + page + "&num=" + num;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public List<EmployeeInfo> findEmployeeInfo(String comId, String employeeId) {
        String url = "http://10.1.36.17:8080/ApiBase/api/info/employee?action=getInfo";
        url = url + "&comId=" + comId + "&employeeId=" + employeeId;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public boolean updateEmployeeInfo(EmployeeInfo employeeInfo) {
        try {
            String url = "http://10.1.36.17:8080/ApiBase/api/info/employee/update?employeeId=" + employeeInfo.getId();

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

    @Override
    public boolean insertEmployeeInfo(EmployeeInfo employeeInfo) {
        try {
            String url = env.getProperty("API_ROOT") + "info/employee/insert" + employeeInfo.getId();

            url += "?comId=" + employeeInfo.getCompanyId() + "&name=" + employeeInfo.getName() + "&phone=" + employeeInfo.getPhone()
                    + "&department=" + employeeInfo.getDepartment() + "&description=" + employeeInfo.getDescription()
                    + "&address=" + employeeInfo.getAddress() + "&email=" + employeeInfo.getEmail();

            String data = Utils.readUrl(url);

            Gson gson = new Gson();
            JsonObject root = gson.fromJson(data, JsonObject.class);
            String errorCode = root.get("errorCode").toString();
            return errorCode.equalsIgnoreCase("0");
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public boolean deleteEmployeeInfo(String employeeId) {
        try {
            String url = env.getProperty("API_ROOT") + "info/employee?action=deactive";
            url += "&employeeId=" + employeeId;
            String data = Utils.readUrl(url);

            Gson gson = new Gson();
            JsonObject root = gson.fromJson(data, JsonObject.class);
            String errorCode = root.get("errorCode").toString();
            return errorCode.equalsIgnoreCase("0");
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

}
