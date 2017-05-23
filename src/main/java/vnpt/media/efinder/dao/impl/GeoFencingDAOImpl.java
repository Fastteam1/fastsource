/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import java.util.List;
import vnpt.media.efinder.dao.GeoFencingDAO;
import vnpt.media.efinder.model.GeoFencingInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class GeoFencingDAOImpl implements GeoFencingDAO {

    @Override
    public List<GeoFencingInfo> queryGeoFencingByCompanyId(String id) {
        String url = "http://10.1.36.17:8080/ApiBase/api/igeofence/detail/bycompany?id=" + id;
        String data = Utils.readUrl(url);
        List<GeoFencingInfo> listEmployees = Utils.stringToArray(data, GeoFencingInfo[].class);
        return listEmployees;
    }

    @Override
    public List<GeoFencingInfo> queryGeoFencingByDeviceId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<GeoFencingInfo> queryGeoFencingByGeoFencingId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
