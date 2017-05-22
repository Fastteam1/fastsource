/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.model;


/**
 *
 * @author vnpt2
 */

public class GameTemplateInfo1 {

    private long gameTempId;
    private long gameCateId;
    private String gameTempName;
    private String description;

    public GameTemplateInfo1() {
    }

    public GameTemplateInfo1(GameTemplateInfo1 gameTemp) {
        this.gameTempId = gameTemp.getGameTempId();
        this.gameCateId = gameTemp.getGameCateId();
        this.gameTempName = gameTemp.getGameTempName();
        this.description = gameTemp.getDescription();
    }
    
    public GameTemplateInfo1(long gameTempId, long gameCateId, String gameTempName, String description) {
        this.gameTempId = gameTempId;
        this.gameCateId = gameCateId;
        this.gameTempName = gameTempName;
        this.description = description;
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
    

}
