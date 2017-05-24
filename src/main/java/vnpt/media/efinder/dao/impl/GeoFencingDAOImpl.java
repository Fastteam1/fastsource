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
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class GeoFencingDAOImpl implements GeoFencingDAO {

    @Autowired
    private Environment env;

    @Override
    public List<GeoFencingInfo> queryGeoFencingByCompanyId(String id) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/detail/bycompany?id=" + id;
        String data = Utils.readUrl(url);
        List<GeoFencingInfo> listEmployees = Utils.stringToArray(data, GeoFencingInfo[].class);
        return listEmployees;
    }

    @Override
    public List<GeoFencingInfo> queryGeoFencingByDeviceId(String id) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/detail/bydevice?id=" + id;
        String data = Utils.readUrl(url);
        List<GeoFencingInfo> listEmployees = Utils.stringToArray(data, GeoFencingInfo[].class);
        return listEmployees;
    }

    @Override
    public List<GeoFencingInfo> queryGeoFencingByGeoFencingId(String id) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/detail/listdevice?id=" + id;
        String data = Utils.readUrl(url);
        List<GeoFencingInfo> listEmployees = Utils.stringToArray(data, GeoFencingInfo[].class);
        return listEmployees;
    }

    @Override
    public boolean insertGeoFencingInCompany(String comId, String location, String name) {
        try {
            String url = env.getProperty(Constants.API_GEOFENCE) + "/create";
            String urlParameters = "comId=" + comId + "&location=" + location
                    + "&name=" + name;
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
    public boolean updateGeoFencing(String geoFenceId, String name, String location) {
        try {
            String url = env.getProperty(Constants.API_GEOFENCE) + "/update";
            String urlParameters = "geofenceId=" + geoFenceId + "&name=" + name
                    + "&location=" + location;
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
    public boolean insertDeviceInGeoFencing(String deviceId, String geoFencingId) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/control";
        url += "?action=adddevice" + "&deviceId=" + deviceId + "&geofenceId=" + geoFencingId;
        String data = Utils.readUrl(url);

        Gson gson = new Gson();
        JsonObject root = gson.fromJson(data, JsonObject.class);
        String errorCode = root.get("errorCode").toString();
        return errorCode.equalsIgnoreCase("0");
    }

    @Override
    public boolean deleteDeviceInGeoFencing(String deviceId, String geoFencingId) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/control";
        url += "?action=removedevice" + "&deviceId=" + deviceId + "&geofenceId=" + geoFencingId;
        String data = Utils.readUrl(url);

        Gson gson = new Gson();
        JsonObject root = gson.fromJson(data, JsonObject.class);
        String errorCode = root.get("errorCode").toString();
        return errorCode.equalsIgnoreCase("0");
    }

    @Override
    public boolean deleteGeoFencingInList(String geoFencingId) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/control";
        url += "?action=deactivegeofen" + "&geofenceId=" + geoFencingId;
        String data = Utils.readUrl(url);

        Gson gson = new Gson();
        JsonObject root = gson.fromJson(data, JsonObject.class);
        String errorCode = root.get("errorCode").toString();
        return errorCode.equalsIgnoreCase("0");
    }

}
