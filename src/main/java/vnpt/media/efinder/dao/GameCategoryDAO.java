/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.entity.GameCategory;
import vnpt.media.efinder.model.GameCategoryInfo;
import vnpt.media.efinder.model.PaginationResult;

/**
 *
 * @author vnpt2
 */
public interface GameCategoryDAO {

    public GameCategory findGameCategory(long gameCateId);

    public GameCategoryInfo findGameCategoryInfo(long gameCateId);

    public PaginationResult<GameCategoryInfo> queryGameCategorys(int page,
            int maxResult, int maxNavigationPage);

    public PaginationResult<GameCategoryInfo> queryGameCategorys(int page, int maxResult,
            int maxNavigationPage, String likeName);
    
    public List<GameCategoryInfo> queryGameCategorys();

    public void save(GameCategoryInfo gameCategoryInfo);
}
