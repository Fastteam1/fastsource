/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.model.LogTrackingDeviceInfo;

/**
 *
 * @author vnpt2
 */
public interface GeoFencingDAO {

    public List<GeoFencingInfo> queryGeoFencingByCompanyId(String id);

    public List<GeoFencingInfo> queryGeoFencingByDeviceId(String id);

    // Lay Json tra ve phuc vu cho DataTable
    public String queryDeviceByGeoFencingId(String id);

    public boolean insertGeoFencingInCompany(GeoFencingInfo geoFencingInfo);

    public boolean updateGeoFencing(GeoFencingInfo geoFencingInfo);

    public boolean insertDeviceInGeoFencing(String deviceId, String geoFencingId);

    public boolean deleteDeviceInGeoFencing(String deviceId, String geoFencingId);

    public boolean deleteGeoFencingInList(String geoFencingId);

    public List<GeoFencingInfo> queryGeoFencingByGeoFencingId(String id);
    
    public List<LogTrackingDeviceInfo> queryLogTrackingByGeoFencingId(String id, String page, String num);
}
