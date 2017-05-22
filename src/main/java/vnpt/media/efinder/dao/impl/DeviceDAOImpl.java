/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import java.util.List;
import vnpt.media.efinder.dao.DeviceDAO;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author Boss
 */
public class DeviceDAOImpl implements DeviceDAO{

    @Override
    public List<DeviceInfo> getAllDeviceInfo(String comID, String page, String num) {
        String url = "http://10.1.36.17:8080/ApiBase/api/info/device?action=getList";
        url = url + "&comId=" + comID + "&page=" + page + "&num=" + num;
        String data = Utils.readUrl(url);
        List<DeviceInfo> listEmployees = Utils.stringToArray(data, DeviceInfo[].class);
        return listEmployees;
    }
    
    
    
}
