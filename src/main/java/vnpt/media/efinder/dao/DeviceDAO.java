/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.DeviceInfo;
import vnpt.media.efinder.model.EmployeeInfo;
import vnpt.media.efinder.model.EmployeeTime;

/**
 *
 * @author Boss
 */
public interface DeviceDAO {

    public List<DeviceInfo> getAllDeviceInfo(String comId, String page, String num);

    public List<DeviceInfo> findDeviceInfo(String comId, String deviceId);

    public boolean updateDeviceInfo(DeviceInfo deviceInfo);

    public boolean deleteDeviceInfo(String deviceId);

    public boolean insertDeviceInfo(DeviceInfo deviceInfo);

    public List<EmployeeInfo> getListEmployeeManage(String deviceId);

    public boolean addEmployeeManage(String deviceId, String employeeId, String startTime, String endTime);
    
        // Lay Json tra ve phuc vu cho DataTable
    public String queryEmployeeByDeviceId(String id);
    
    public List<EmployeeTime> getEmployeeTimeByDeviceId(String deviceId);
    
    public boolean deleteDeviceEmployee(String deviceEmployeeId);
}
