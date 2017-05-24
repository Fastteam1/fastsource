/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.GeoFencingInfo;

/**
 *
 * @author vnpt2
 */
public interface GeoFencingDAO {
    public List<GeoFencingInfo> queryGeoFencingByCompanyId(String id);
    
    public List<GeoFencingInfo> queryGeoFencingByDeviceId(String id);
    
    public List<DeviceInfo> queryDeviceByGeoFencingId(String id);
    
    public boolean insertGeoFencingInCompany(String comId, String location, String name);
    
    public boolean updateGeoFencing(String geoFenceId, String name, String location);
    
    public boolean insertDeviceInGeoFencing(String deviceId, String geoFencingId);
    
    public boolean deleteDeviceInGeoFencing(String deviceId, String geoFencingId);
    
    public boolean deleteGeoFencingInList(String geoFencingId);
}
