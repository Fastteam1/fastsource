/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author vnpt2
 */
@Entity
@Table(name = "SERVICE_NUMBERS")
public class ServiceNumbers implements Serializable {

    private long serviceNumberId;
    private String serviceNumber;
    private boolean status;
    private String description;
    private Date createTime;
    private String ipAddress;
    private String port;

    public ServiceNumbers() {
    }

    @Id
    @Column(name = "SERVICE_NUMBER_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "serviceNumber")
    @SequenceGenerator(name = "serviceNumber", sequenceName = "S_SERVICE_NUMBER")
    public long getServiceNumberId() {
        return serviceNumberId;
    }

    public void setServiceNumberId(long serviceNumberId) {
        this.serviceNumberId = serviceNumberId;
    }

    @Column(name = "SERVICE_NUMBER", length = 10)
    public String getServiceNumber() {
        return serviceNumber;
    }

    public void setServiceNumber(String serviceNumber) {
        this.serviceNumber = serviceNumber;
    }

    @Column(name = "STATUS", length = 1)
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Column(name = "DESCRIPTION", length = 500)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_TIME")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "IP_ADDRESS", length = 50)
    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    @Column(name = "PORT", length = 10)
    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }


}
