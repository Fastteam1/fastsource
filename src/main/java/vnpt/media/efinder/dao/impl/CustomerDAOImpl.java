/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vnpt.media.efinder.dao.CustomerDAO;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class CustomerDAOImpl implements CustomerDAO {

    @Override
    public List<CustomerInfo> queryCustomers(String username, String password) {
        try {
            String url = "http://10.1.36.36:8084/ApiBase/api/login";
            String urlParameters = "username=" + username + "&password=" + password;
            
            String dataPost = Utils.readUrlPOST(url, urlParameters);
            List<CustomerInfo> listCustomers = Utils.stringToArray(dataPost, CustomerInfo[].class);
            return listCustomers;
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList<>();
        }
    }
}
