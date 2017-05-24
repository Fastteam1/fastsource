/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

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

}
