/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.EmployeeInfo;

/**
 *
 * @author vnpt2
 */
public interface EmployeeDAO {

    public List<EmployeeInfo> queryEmployees(String comId, String page, String num);

    public List<EmployeeInfo> findEmployeeInfoById(String comId, String employeeId);

    public boolean updateEmployeeInfo(EmployeeInfo employeeInfo);

    public boolean insertEmployeeInfo(EmployeeInfo employeeInfo);

    public boolean deleteEmployeeInfo(String employeeId);

    public List<EmployeeInfo> searchEmployeeInfo(EmployeeInfo employeeInfo);

    public List<EmployeeInfo> queryEmployeesByDeviceId(String deviceId);

    public boolean insertEmployeeInDevice(String employeeId, String deviceId, String startTime, String endTime);

    public boolean updateTimeEmployeeInDevice(String employeeDeviceId, String startTime, String endTime);
    
    public boolean deleteEmployeeInDevice(String employeeDeviceId);
}
