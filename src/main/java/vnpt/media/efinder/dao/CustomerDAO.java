/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.model.CustomerInfo;

/**
 *
 * @author vnpt2
 */
public interface CustomerDAO {

    public List<CustomerInfo> queryCustomers(String username, String password);
}
