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
    private String createTime;
    private String updateTime;
    private String status;
    private String name;
    private String description;
    private int deviceIn;
    private int deviceOut;

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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
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

    public int getDeviceIn() {
        return deviceIn;
    }

    public void setDeviceIn(int deviceIn) {
        this.deviceIn = deviceIn;
    }

    public int getDeviceOut() {
        return deviceOut;
    }

    public void setDeviceOut(int deviceOut) {
        this.deviceOut = deviceOut;
    }

}
