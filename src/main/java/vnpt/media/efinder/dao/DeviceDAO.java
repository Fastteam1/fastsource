/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;

/**
 *
 * @author Boss
 */
public interface DeviceDAO {
    public List<DeviceInfo> getAllDeviceInfo(String comId,String page,String num);
    
    public List<DeviceInfo> findDeviceInfo(String comId,String deviceId);
    
    public boolean updateDeviceInfo(DeviceInfo deviceInfo);
    public boolean deleteDeviceInfo(String employeeId);
    
    public boolean insertDeviceInfo(DeviceInfo employeeInfo);
    
    public List<EmployeeInfo> getListEmployeeManage(String deviceId);
    
    public boolean addEmployeeManage(String deviceId,String employeeId, String startTime, String endTime);
}
