/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.DeviceInfo;

/**
 *
 * @author Boss
 */
public interface DeviceDAO {
    public List<DeviceInfo> getAllDeviceInfo(String comId,String page,String num);
    
    public List<DeviceInfo> findDeviceInfo(String comId,String employeeId);
    
    public boolean updateDeviceInfo(DeviceInfo deviceInfo);
}
