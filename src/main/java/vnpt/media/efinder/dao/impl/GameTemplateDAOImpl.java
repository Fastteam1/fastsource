/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao.impl;

/**
 *
 * @author vnpt2
 */
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import vnpt.media.efinder.dao.GameCategoryDAO;
import vnpt.media.efinder.dao.GameTemplateDAO;
import vnpt.media.efinder.entity.GameCategory;
import vnpt.media.efinder.entity.GameServiceNumber;
import vnpt.media.efinder.entity.GameTemplate;
import vnpt.media.efinder.model.GameTemplateInfo;

// Transactional for Hibernate
@Transactional
public class GameTemplateDAOImpl implements GameTemplateDAO {

    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private GameCategoryDAO gameCategoryDAO;

    @Override
    public GameTemplate findGameTemplate(long gameTemplateId) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(GameTemplate.class);
        crit.add(Restrictions.eq("gameTempId", gameTemplateId));
        return (GameTemplate) crit.uniqueResult();
    }

    @Override
    public GameTemplateInfo findGameTemplateInfo(long gameTemplateId) {
        GameTemplate gameTemplate = this.findGameTemplate(gameTemplateId);
        if (gameTemplate == null) {
            return null;
        }
//        System.out.println("gameTemplate.getGameCategorys().getGameCateId()"+ gameTemplate.getGameCategorys().getGameCateId());
//        System.out.println("gameTemplate.getGameCategorys().getGameCateName()"+ gameTemplate.getGameCategorys().getGameCateName());
        return new GameTemplateInfo(gameTemplate.getGameTempId(), gameTemplate.getGameCategorys().getGameCateId(),
                gameTemplate.getGameCategorys().getGameCateName(), gameTemplate.getGameTempName(),
                gameTemplate.getDescription(), gameTemplate.getCreateTime(), gameTemplate.isStatus(), gameTemplate.isIsQuestion());
    }

    @Override
    public void save(GameTemplateInfo gameTemplateInfo) {
        long gameTemplateId = 0;
        gameTemplateId = gameTemplateInfo.getGameTempId();

        //System.out.println("gameTemplateId DAOimpl:" + gameTemplateId);
        GameTemplate gameTemplate = null;

        boolean isNew = false;
        if (gameTemplateId != 0) {
            //System.out.println("gameTemplateId != 0");
            gameTemplate = this.findGameTemplate(gameTemplateId);
        }
        if (gameTemplate == null) {
            isNew = true;
            gameTemplate = new GameTemplate();
            gameTemplate.setCreateTime(new Date());

        }

        gameTemplate.setDescription(gameTemplateInfo.getDescription());
        gameTemplate.setGameTempName(gameTemplateInfo.getGameTempName());
        gameTemplate.setStatus(gameTemplateInfo.isStatus());
        gameTemplate.setIsQuestion(gameTemplateInfo.isIsQuestion());

        GameCategory obj = gameCategoryDAO.findGameCategory(gameTemplateInfo.getGameCateId());
        System.out.println("GameTemplateInfo.getGameCateId()" + gameTemplateInfo.getGameCateId());
        gameTemplate.setGameCategorys(obj);

        if (isNew) {
            System.out.println("New");

            this.sessionFactory.getCurrentSession().persist(gameTemplate);
        }
        this.sessionFactory.getCurrentSession().flush();
    }

    @Override
    public List<GameTemplateInfo> queryGameTemplates() {
        String sql = "Select new " + GameTemplateInfo.class.getName() //
                + "(p.gameTempId, p.gameCategorys.gameCateId, p.gameCategorys.gameCateName, p.gameTempName, p.description, p.createTime, p.status, p.isQuestion)  " + " from "//
                + GameTemplate.class.getName() + " p order by p.createTime desc ";
        //
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery(sql);
        return query.list();
    }

}
