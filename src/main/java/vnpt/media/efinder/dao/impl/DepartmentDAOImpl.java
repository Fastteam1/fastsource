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
import vnpt.media.efinder.dao.DepartmentDAO;
import vnpt.media.efinder.model.DepartmentInfo;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class DepartmentDAOImpl implements DepartmentDAO {

    @Autowired
    private Environment env;

    @Override
    public List<DepartmentInfo> queryDepartments(String comId) {
        String url = env.getProperty(Constants.API_DEPARTMENT) + "/info";
        url = url + "?comId=" + comId;
        String data = Utils.readUrl(url);
        System.out.println("DATA: " + data);
        List<DepartmentInfo> listDepartments = Utils.stringToArray(data, DepartmentInfo[].class);
        return listDepartments;
    }

    @Override
    public boolean insertDepartmentInfo(DepartmentInfo departmentInfo) {
        try {
            String url = env.getProperty(Constants.API_DEPARTMENT) + "/insert";
            String urlParameters = "comId=" + departmentInfo.getCompanyId() + "&name=" + departmentInfo.getName()+ "&description=" + departmentInfo.getDescription();

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
    public boolean updateDepartmentInfo(DepartmentInfo departmentInfo) {
        
        try {
            String url = env.getProperty(Constants.API_DEPARTMENT) + "/update?department=" + departmentInfo.getId();
            url += "&name=" + departmentInfo.getName() + "&description=" + departmentInfo.getDescription();

            String data = Utils.readUrlPOST(url, "");
            Gson gson = new Gson();
            JsonObject root = gson.fromJson(data, JsonObject.class);
            String errorCode = root.get("errorCode").toString();
            return errorCode.equalsIgnoreCase("0");
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean deleteDepartmentInfo(String departmentId) {
        try {

            System.out.println("departmentId: " + departmentId);
            String url = env.getProperty(Constants.API_DEPARTMENT)+"/delete";
            url += "?department=" + departmentId;
            String data = Utils.readUrlPOST(url,"");
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
    public List<DepartmentInfo> findDepartmentInfo(String departmentId) {
        
        String url = env.getProperty(Constants.API_DEPARTMENT) +"/info"+ "?action=byDepartmentId";
        url = url + "&departmentId=" + departmentId;
        String data = Utils.readUrl(url);
        List<DepartmentInfo> listDepartment = Utils.stringToArray(data, DepartmentInfo[].class);
        return listDepartment;
    }
    
    
    
    
    
    
    
    
}
