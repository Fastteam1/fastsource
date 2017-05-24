/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.model;

import java.util.Date;

/**
 *
 * @author vnpt2
 */
public class GeoFencingInfo {

    private String id;
    private String location;
    private String companyId;
    private Date createTime;
    private Date updateTime;
    private String status;
    private String name;
    private String description;
    private int countDeviceInGeofence;
    private int countDeviceOutGeofence;

    public GeoFencingInfo() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCountDeviceInGeofence() {
        return countDeviceInGeofence;
    }

    public void setCountDeviceInGeofence(int countDeviceInGeofence) {
        this.countDeviceInGeofence = countDeviceInGeofence;
    }

    public int getCountDeviceOutGeofence() {
        return countDeviceOutGeofence;
    }

    public void setCountDeviceOutGeofence(int countDeviceOutGeofence) {
        this.countDeviceOutGeofence = countDeviceOutGeofence;
    }

}
