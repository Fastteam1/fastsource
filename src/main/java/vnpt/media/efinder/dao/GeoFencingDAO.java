/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.GeoFencingInfo;

/**
 *
 * @author vnpt2
 */
public interface GeoFencingDAO {
    public List<GeoFencingInfo> queryGeoFencingByCompanyId(String id);
    
    public List<GeoFencingInfo> queryGeoFencingByDeviceId(String id);
    
    public List<GeoFencingInfo> queryGeoFencingByGeoFencingId(String id);
}
