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
import vnpt.media.efinder.dao.DeviceDAO;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author Boss
 */
public class DeviceDAOImpl implements DeviceDAO {

    @Autowired
    private Environment env;

    @Override
    public List<DeviceInfo> getAllDeviceInfo(String comId, String page, String num) {
        String url = env.getProperty(Constants.API_ROOT) + "/info/device?action=getList";
        url = url + "&comId=" + comId + "&page=" + page + "&num=" + num;
        String data = Utils.readUrl(url);
        List<DeviceInfo> listDevices = Utils.stringToArray(data, DeviceInfo[].class);
        return listDevices;
    }

    @Override
    public List<DeviceInfo> findDeviceInfo(String comId, String deviceId) {
        String url = "http://10.1.36.17:8080/ApiBase/api/info/device?action=getInfo";
        url = url + "&comId=" + comId + "&deviceId=" + deviceId;
        String data = Utils.readUrl(url);
        List<DeviceInfo> listDevice = Utils.stringToArray(data, DeviceInfo[].class);
        return listDevice;
    }

    @Override
    public boolean updateDeviceInfo(DeviceInfo deviceInfo) {
        try {
            String url = env.getProperty(Constants.API_ROOT) + "/info/device/update?deviceId=" + deviceInfo.getId();

            String urlParameters = "type=" + deviceInfo.getType()+ "&name=" + deviceInfo.getName()
                    + "&os=" + deviceInfo.getOs() + "&imei=" + deviceInfo.getImei();

            String data = Utils.readUrlPOST(url, urlParameters);

            Gson gson = new Gson();
            JsonObject root = gson.fromJson(data, JsonObject.class);
            String errorCode = root.get("errorCode").toString();
            return errorCode.equalsIgnoreCase("0");
        } catch (Exception ex) {
            
            return false;
        }
    }

    @Override
    public boolean deleteDeviceInfo(String deviceId) {
        try {

            System.out.println("deviceId: " + deviceId);
            String url = env.getProperty(Constants.API_DEVICE) + "?action=deactive";
            url += "&deviceId=" + deviceId;
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
    public boolean insertDeviceInfo(DeviceInfo deviceInfo) {
        try {
            String url = env.getProperty(Constants.API_DEVICE) + "/insert";
            String urlParameters = "comId=" + deviceInfo.getCompanyId() + "&msisdn=" + deviceInfo.getMsisdn() + "&type=" + deviceInfo.getType()
                    + "&name=" + deviceInfo.getName() + "&os=" + deviceInfo.getOs()
                    + "&imei=" + deviceInfo.getImei();

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
    public List<EmployeeInfo> getListEmployeeManage(String deviceId) {
        String url = env.getProperty(Constants.API_ROOT) + "/handle/listemployee";
        url = url + "&deviceId=" + deviceId;
        String data = Utils.readUrl(url);
        List<EmployeeInfo> listEmployee = Utils.stringToArray(data, EmployeeInfo[].class);
        return listEmployee;
    }
    
    @Override
    public boolean addEmployeeManage(String deviceId,String employeeId,String startTime,String endTime) {
        try {
            String url = env.getProperty(Constants.API_ROOT) + "/handle/control/insert";
            url += "&employeeId=" + employeeId + "&deviceId=" + deviceId + "&startTime=" + startTime + "&endTime=" + endTime;
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

}
