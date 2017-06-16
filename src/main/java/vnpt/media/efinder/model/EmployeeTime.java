/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.model;

/**
 *
 * @author Boss
 */
public class EmployeeTime {
    
    private String name;
    private String startTime;
    private String endTime;
    
    private String deviceEmployeeId;

    public String getDeviceEmployeeId() {
        return deviceEmployeeId;
    }

    public void setDeviceEmployeeId(String deviceEmployeeId) {
        this.deviceEmployeeId = deviceEmployeeId;
    }
    
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

}
