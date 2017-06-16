/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.DepartmentInfo;
import vnpt.media.efinder.model.DeviceInfo;

/**
 *
 * @author vnpt2
 */
public interface DepartmentDAO {

    public List<DepartmentInfo> queryDepartments(String comId);
    
    public boolean insertDepartmentInfo(DepartmentInfo departmentInfo);
    
    public boolean updateDepartmentInfo(DepartmentInfo departmentInfo);
    
    public boolean deleteDepartmentInfo(String departmentId);
    
    public List<DepartmentInfo> findDepartmentInfo(String deviceId);
}
