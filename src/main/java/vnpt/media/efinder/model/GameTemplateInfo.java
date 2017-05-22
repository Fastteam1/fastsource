/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.model;

import java.util.Date;

/**
 *
 * @author vnpt2
 */
public class GameTemplateInfo {

    private long gameTempId;
    private long gameCateId;
    private String gameCateName;
    private String gameTempName;
    private String description;
    private Date createTime;
    private boolean status;
    private boolean isQuestion;

    public GameTemplateInfo() {
    }

    public GameTemplateInfo(long gameTempId, long gameCateId, String gameCateName, String gameTempName, String description, Date createTime, boolean status, boolean isQuestion) {
        this.gameTempId = gameTempId;
        this.gameCateId = gameCateId;
        this.gameCateName = gameCateName;
        this.gameTempName = gameTempName;
        this.description = description;
        this.createTime = createTime;
        this.status = status;
        this.isQuestion = isQuestion;
    }

    public long getGameTempId() {
        return gameTempId;
    }

    public void setGameTempId(long gameTempId) {
        this.gameTempId = gameTempId;
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

    public String getGameTempName() {
        return gameTempName;
    }

    public void setGameTempName(String gameTempName) {
        this.gameTempName = gameTempName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isIsQuestion() {
        return isQuestion;
    }

    public void setIsQuestion(boolean isQuestion) {
        this.isQuestion = isQuestion;
    }

}
