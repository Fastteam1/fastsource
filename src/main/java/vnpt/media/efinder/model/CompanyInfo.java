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
public class CompanyInfo {

    private String id;
    private String phone;
    private String address;
    private String name;
    private String packageId;
    private String companySize;
    private String regisstration;
    private String taxcode;

    public CompanyInfo() {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public String getCompanySize() {
        return companySize;
    }

    public void setCompanySize(String companySize) {
        this.companySize = companySize;
    }

    public String getRegisstration() {
        return regisstration;
    }

    public void setRegisstration(String regisstration) {
        this.regisstration = regisstration;
    }

    public String getTaxcode() {
        return taxcode;
    }

    public void setTaxcode(String taxcode) {
        this.taxcode = taxcode;
    }

    @Override
    public String toString() {
        return "CompanyInfo [id = " + id + ", phone = " + phone + ", address = " + address + ", name = " + name + ", packageId = " + packageId + ", companySize = " + companySize + ", regisstration = " + regisstration + ", taxcode = " + taxcode + "]";
    }
}
