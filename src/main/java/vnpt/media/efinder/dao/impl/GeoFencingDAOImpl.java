/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.net.URLEncoder;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.model.LogTrackingDeviceInfo;
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
        List<GeoFencingInfo> listGeofences = Utils.stringToArray(data, GeoFencingInfo[].class);
        return listGeofences;
    }

    @Override
    public List<GeoFencingInfo> queryGeoFencingByDeviceId(String id) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/detail/bydevice?id=" + id;
        String data = Utils.readUrl(url);
        List<GeoFencingInfo> listGeofences = Utils.stringToArray(data, GeoFencingInfo[].class);
        return listGeofences;
    }

    @Override
    public String queryDeviceByGeoFencingId(String id) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/detail/listdevice?id=" + id;
        String data = Utils.readUrl(url);
        return data;
    }

    @Override
    public boolean insertGeoFencingInCompany(GeoFencingInfo geoFencingInfo) {
        try {
            String url = env.getProperty(Constants.API_GEOFENCE) + "/create";
            String urlParameters = "comId=" + URLEncoder.encode(geoFencingInfo.getCompanyId(), "UTF-8")
                    + "&location=" + URLEncoder.encode(geoFencingInfo.getLocation(), "UTF-8")
                    + "&name=" + URLEncoder.encode(geoFencingInfo.getName(), "UTF-8")
                    + "&description=" + URLEncoder.encode(geoFencingInfo.getDescription(), "UTF-8");
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
    public boolean updateGeoFencing(GeoFencingInfo geoFencingInfo) {
        try {
            String url = env.getProperty(Constants.API_GEOFENCE) + "/control/update";
            String urlParameters = "geofenceId=" + URLEncoder.encode(geoFencingInfo.getId(), "UTF-8")
                    + "&name=" + URLEncoder.encode(geoFencingInfo.getName(), "UTF-8")
                    + "&location=" + URLEncoder.encode(geoFencingInfo.getLocation(), "UTF-8")
                    + "&description=" + URLEncoder.encode(geoFencingInfo.getDescription(), "UTF-8");
            String data = Utils.readUrlPOST(url, urlParameters);

            System.out.println("descriptionsadasdsa" + geoFencingInfo.getDescription());
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

    @Override
    public List<GeoFencingInfo> queryGeoFencingByGeoFencingId(String id) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/detail/geofending?id=" + id;
        String data = Utils.readUrl(url);
        System.out.println("DATa: " + data);
        List<GeoFencingInfo> listGeofences = Utils.stringToArray(data, GeoFencingInfo[].class);

        for (GeoFencingInfo geoFencingInfo : listGeofences) {
            String startJson = "{\n"
                    + "  \"type\": \"FeatureCollection\",\n"
                    + "  \"features\": [\n"
                    + "    {\n"
                    + "      \"type\": \"Feature\",\n"
                    + "      \"geometry\": {\n"
                    + "        \"type\": \"Polygon\",\n"
                    + "        \"coordinates\": [";
            String endJson = "        ]\n"
                    + "      },\n"
                    + "      \"properties\": {}\n"
                    + "    }\n"
                    + "  ]\n"
                    + "}";

            String json = startJson + geoFencingInfo.getLocation() + endJson;
            System.out.println("JSON:" + json);
            geoFencingInfo.setLocation(json);
        }

        return listGeofences;
    }

    @Override
    public List<LogTrackingDeviceInfo> queryLogTrackingByGeoFencingId(String id, String page, String num) {
        String url = env.getProperty(Constants.API_GEOFENCE) + "/history?geofenId=" + id + "&num=" + num + "&page=" + page;
        String data = Utils.readUrl(url);
        List<LogTrackingDeviceInfo> listTrackingDevices = Utils.stringToArray(data, LogTrackingDeviceInfo[].class);
        return listTrackingDevices;
    }

}
