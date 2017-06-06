/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import vnpt.media.efinder.dao.DepartmentDAO;
import vnpt.media.efinder.model.DepartmentInfo;
import vnpt.media.efinder.util.Constants;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
public class DepartmentDAOImpl implements DepartmentDAO {

    @Autowired
    private Environment env;

    @Override
    public List<DepartmentInfo> queryDepartments(String comId) {
        String url = env.getProperty(Constants.API_DEPARTMENT) + "/info";
        url = url + "?comId=" + comId;
        String data = Utils.readUrl(url);
        System.out.println("DATA: " + data);
        List<DepartmentInfo> listDepartments = Utils.stringToArray(data, DepartmentInfo[].class);
        return listDepartments;
    }
}
