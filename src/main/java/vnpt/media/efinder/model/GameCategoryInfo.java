/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.model;

import java.util.Date;
import vnpt.media.efinder.entity.GameCategory;

/**
 *
 * @author vnpt2
 */
public class GameCategoryInfo {

    private long gameCateId;
    private String gameCateName;
    private String description;
    private Date createTime;

    private boolean newGameCate = false;

    public GameCategoryInfo() {
    }

    public GameCategoryInfo(GameCategory gameCategory) {
        this.gameCateId = gameCategory.getGameCateId();
        this.gameCateName = gameCategory.getGameCateName();
        this.description = gameCategory.getDescription();
    }

    public GameCategoryInfo(long gameCateId, String gameCateName, String description, Date createTime) {
        this.gameCateId = gameCateId;
        this.gameCateName = gameCateName;
        this.description = description;
        this.createTime = createTime;
    }

    public long getGameCateId() {
        return gameCateId;
    }

    public void setGameCateId(long gameCateId) {
        this.gameCateId = gameCateId;
    }

    public String getGameCateName() {
        return gameCateName;
    }

    public void setGameCateName(String gameCateName) {
        this.gameCateName = gameCateName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isNewGameCate() {
        return newGameCate;
    }

    public void setNewGameCate(boolean newGameCate) {
        this.newGameCate = newGameCate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
