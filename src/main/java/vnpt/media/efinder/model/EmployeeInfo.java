/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.model;

/**
 *
 * @author vnpt2
 */
public class EmployeeInfo {

    private String id;
    private String phone;
    private String address;
    private String email;
    private String description;
    private String department;
    private String name;
    private String nameAscII;
    private String image;
    private String companyId;
    private String createDate;
    private String updateDate;

    public EmployeeInfo() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNameAscII() {
        return nameAscII;
    }

    public void setNameAscII(String nameAscII) {
        this.nameAscII = nameAscII;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public String toString() {
        return "Employee [id = " + id + ", phone = " + phone + ", address = " + address + ", email = " + email + ", description = " + description + ", department = " + department + ", name = " + name + ", nameAscII = " + nameAscII + ", image = " + image + ", companyId = " + companyId + ", createDate = " + createDate + ", updateDate = " + updateDate + "]";
    }

}
