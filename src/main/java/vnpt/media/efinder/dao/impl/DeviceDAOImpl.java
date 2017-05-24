/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import vnpt.media.efinder.dao.DeviceDAO;
import vnpt.media.efinder.model.DeviceInfo;
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

}
