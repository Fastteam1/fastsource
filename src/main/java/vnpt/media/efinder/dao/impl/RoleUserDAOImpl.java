/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import vnpt.media.efinder.dao.RoleUserDAO;
import vnpt.media.efinder.entity.RoleUser;


/**
 *
 * @author vnpt2
 */
// Transactional for Hibernate
@Transactional
public class RoleUserDAOImpl implements RoleUserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public RoleUser findAccount(String userName) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(RoleUser.class);
        crit.add(Restrictions.eq("userName", userName));
        return (RoleUser) crit.uniqueResult();
    }

}
