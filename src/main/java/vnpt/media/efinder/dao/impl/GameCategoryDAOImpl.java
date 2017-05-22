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
import vnpt.media.efinder.entity.GameCategory;
import vnpt.media.efinder.model.GameCategoryInfo;
import vnpt.media.efinder.model.PaginationResult;

// Transactional for Hibernate
@Transactional
public class GameCategoryDAOImpl implements GameCategoryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public GameCategory findGameCategory(long gameCategoryId) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(GameCategory.class);
        crit.add(Restrictions.eq("gameCateId", gameCategoryId));
        return (GameCategory) crit.uniqueResult();
    }

    @Override
    public GameCategoryInfo findGameCategoryInfo(long gameCategoryId) {
        GameCategory gameCategory = this.findGameCategory(gameCategoryId);
        if (gameCategory == null) {
            return null;
        }
        return new GameCategoryInfo(gameCategoryId, gameCategory.getGameCateName(), gameCategory.getDescription(), gameCategory.getCreateTime());
    }

    @Override
    public void save(GameCategoryInfo GameCategoryInfo) {

        System.out.println("GameCategoryInfo.getGameCateName()" + GameCategoryInfo.getGameCateName());
        System.out.println("GameCategoryInfo.getDescription()" + GameCategoryInfo.getDescription());
        System.out.println("GameCategoryInfo.gameCategoryId()" + GameCategoryInfo.getGameCateId());

        long gameCategoryId = 0;
        gameCategoryId = GameCategoryInfo.getGameCateId();

        GameCategory gameCategory = null;

        boolean isNew = false;
        if (gameCategoryId != 0) {
            gameCategory = this.findGameCategory(gameCategoryId);
            System.out.println("fsdfsdfsd");
        } else {
            
        }

        System.out.println("gameCategoryId-------------" + gameCategoryId);
        if (gameCategory == null) {
            System.out.println("Nulll");
            isNew = true;
            gameCategory = new GameCategory();
            gameCategory.setCreateTime(new Date());
            gameCategory.setStatus(true);
        }
        
        gameCategory.setGameCateName(GameCategoryInfo.getGameCateName());
        gameCategory.setDescription(GameCategoryInfo.getDescription());
        //GameCategory.setPrice(GameCategoryInfo.getPrice());

        if (isNew) {
            System.out.println("Newwwwww");
            this.sessionFactory.getCurrentSession().persist(gameCategory);
        }
        // If error in DB, Exceptions will be thrown out immediately
        // Nếu có lỗi tại DB, ngoại lệ sẽ ném ra ngay lập tức
        this.sessionFactory.getCurrentSession().flush();
    }

    @Override
    public PaginationResult<GameCategoryInfo> queryGameCategorys(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String sql = "Select new " + GameCategoryInfo.class.getName() //
                + "(p.gameCateId, p.gameCateName, p.description, p.createTime) " + " from "//
                + GameCategory.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            sql += " Where lower(p.gameCateName) like :likeName ";
        }
        sql += " order by p.createTime desc ";
        //
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery(sql);
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<>(query, page, maxResult, maxNavigationPage);
    }

    @Override
    public PaginationResult<GameCategoryInfo> queryGameCategorys(int page, int maxResult, int maxNavigationPage) {
        return queryGameCategorys(page, maxResult, maxNavigationPage, null);
    }

    @Override
    public List<GameCategoryInfo> queryGameCategorys() {
        String sql = "Select new " + GameCategoryInfo.class.getName() //
                + "(p.gameCateId, p.gameCateName, p.description, p.createTime) " + " from "//
                + GameCategory.class.getName() + " p order by p.createTime desc ";
        //
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery(sql);
        return query.list();
    }

}
