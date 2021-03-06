/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class EmployeeDAOImpl implements EmployeeDAO {

    @Autowired
    private Environment env;

    @Override
    public List<EmployeeInfo> queryEmployees(String comId, String page, String num) {
        String url = env.getProperty(Constants.API_EMPLOYEE) + "?action=getList";
        url = url + "&comId=" + comId + "&page=" + page + "&num=" + num;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public List<EmployeeInfo> findEmployeeInfoById(String comId, String employeeId) {
        String url = env.getProperty(Constants.API_EMPLOYEE) + "?action=getInfo";
        url = url + "&comId=" + comId + "&employeeId=" + employeeId;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public boolean updateEmployeeInfo(EmployeeInfo employeeInfo) {
        try {
            String url = env.getProperty(Constants.API_EMPLOYEE) + "/update?employeeId=" + employeeInfo.getId();

            String urlParameters = "name=" + URLEncoder.encode(employeeInfo.getName(), "UTF-8")
                    + "&phone=" + URLEncoder.encode(employeeInfo.getPhone(), "UTF-8")
                    + "&departmentId=" + URLEncoder.encode(employeeInfo.getDepartmentId(), "UTF-8")
                    + "&description=" + URLEncoder.encode(employeeInfo.getDescription(), "UTF-8")
                    + "&address=" + URLEncoder.encode(employeeInfo.getAddress(), "UTF-8")
                    + "&email=" + URLEncoder.encode(employeeInfo.getEmail(), "UTF-8");

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
            String url = env.getProperty(Constants.API_EMPLOYEE) + "/insert";
            String urlParameters = "comId=" + URLEncoder.encode(employeeInfo.getCompanyId(), "UTF-8")
                    + "&name=" + URLEncoder.encode(employeeInfo.getName(), "UTF-8")
                    + "&phone=" + URLEncoder.encode(employeeInfo.getPhone(), "UTF-8")
                    + "&departmentId=" + URLEncoder.encode(employeeInfo.getDepartmentId(), "UTF-8")
                    + "&description=" + URLEncoder.encode(employeeInfo.getDescription(), "UTF-8")
                    + "&address=" + URLEncoder.encode(employeeInfo.getAddress(), "UTF-8")
                    + "&email=" + URLEncoder.encode(employeeInfo.getEmail(), "UTF-8");

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
    public boolean deleteEmployeeInfo(String employeeId) {
        try {

            System.out.println("EmployeeId: " + employeeId);
            String url = env.getProperty(Constants.API_EMPLOYEE) + "?action=deactive";
            url += "&employeeId=" + employeeId;
            String data = Utils.readUrl(url);

            System.out.println("URL: " + url);
            Gson gson = new Gson();
            JsonObject root = gson.fromJson(data, JsonObject.class);
            String errorCode = root.get("errorCode").toString();
            System.out.println("DATA: " + data);
            System.out.println("Error: " + errorCode);
            return errorCode.equalsIgnoreCase("0");
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<EmployeeInfo> searchEmployeeInfo(EmployeeInfo employeeInfo) {
        try {
            String url = env.getProperty(Constants.API_EMPLOYEE) + "/search";
            url += "?comId=" + employeeInfo.getCompanyId() + "&name=" + employeeInfo.getName() + "&msisdn=" + employeeInfo.getPhone();
            String urlParameters = "";

            String data = Utils.readUrlPOST(url, urlParameters);
            List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
            return listEmployees;
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList<>();
        }
    }

    @Override
    public List<EmployeeInfo> queryEmployeesByDeviceId(String deviceId) {
        String url = env.getProperty(Constants.API_ROOT) + "/handle/listemployee";
        url = url + "?deviceId=" + deviceId;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployees = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployees;
    }

    @Override
    public boolean insertEmployeeInDevice(String employeeId, String deviceId, String startTime, String endTime) {
        try {
            String url = env.getProperty(Constants.API_ROOT) + "/handle/control/insert";
            url += "?employeeId=" + employeeId + "&deviceId=" + deviceId
                    + "&starTime=" + startTime + "endTime=" + endTime;
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
    public boolean updateTimeEmployeeInDevice(String employeeDeviceId, String startTime, String endTime) {
        try {
            String url = env.getProperty(Constants.API_ROOT) + "/handle/control/update";
            url += "?id=" + employeeDeviceId + "&starTime=" + startTime + "endTime=" + endTime;
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
    public boolean deleteEmployeeInDevice(String employeeDeviceId) {
        try {
            String url = env.getProperty(Constants.API_ROOT) + "/handle/control/deactive";
            url += "?id=" + employeeDeviceId;
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
