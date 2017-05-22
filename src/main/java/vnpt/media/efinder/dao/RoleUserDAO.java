/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import vnpt.media.efinder.entity.RoleUser;

/**
 *
 * @author vnpt2
 */
public interface RoleUserDAO {

    public RoleUser findAccount(String userName);
}
