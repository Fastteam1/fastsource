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
public class GameInfo {

    private long gameId;
    private int gameInProcess;
    private long gameTempId;
    private String gameTempName;
    private String gameName;
    private Boolean status;
    private String description;
    private String gameCode;
    private Date createTime;
    private String serviceNumber;
    private long serviceNumberId;


    public GameInfo() {
    }

    public GameInfo(long gameId, int gameInProcess, long gameTempId, String gameTempName, String gameName, Boolean status, String description, String gameCode, Date createTime) {
        this.gameId = gameId;
        this.gameInProcess = gameInProcess;
        this.gameTempId = gameTempId;
        this.gameTempName = gameTempName;
        this.gameName = gameName;
        this.status = status;
        this.description = description;
        this.gameCode = gameCode;
        this.createTime = createTime;
    }

    public GameInfo(long gameId, int gameInProcess, long gameTempId, String gameTempName, String gameName, Boolean status, String description, String gameCode, Date createTime, String serviceNumber) {
        this.gameId = gameId;
        this.gameInProcess = gameInProcess;
        this.gameTempId = gameTempId;
        this.gameTempName = gameTempName;
        this.gameName = gameName;
        this.status = status;
        this.description = description;
        this.gameCode = gameCode;
        this.createTime = createTime;
        this.serviceNumber = serviceNumber;
    }

    public GameInfo(long gameId, int gameInProcess, long gameTempId, String gameTempName, String gameName, Boolean status, String description, String gameCode, Date createTime, String serviceNumber, long serviceNumberId) {
        this.gameId = gameId;
        this.gameInProcess = gameInProcess;
        this.gameTempId = gameTempId;
        this.gameTempName = gameTempName;
        this.gameName = gameName;
        this.status = status;
        this.description = description;
        this.gameCode = gameCode;
        this.createTime = createTime;
        this.serviceNumber = serviceNumber;
        this.serviceNumberId = serviceNumberId;
    }


    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
    }

    public int getGameInProcess() {
        return gameInProcess;
    }

    public void setGameInProcess(int gameInProcess) {
        this.gameInProcess = gameInProcess;
    }

    public long getGameTempId() {
        return gameTempId;
    }

    public void setGameTempId(long gameTempId) {
        this.gameTempId = gameTempId;
    }

    public String getGameTempName() {
        return gameTempName;
    }

    public void setGameTempName(String gameTempName) {
        this.gameTempName = gameTempName;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGameCode() {
        return gameCode;
    }

    public void setGameCode(String gameCode) {
        this.gameCode = gameCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getServiceNumber() {
        return serviceNumber;
    }

    public void setServiceNumber(String serviceNumber) {
        this.serviceNumber = serviceNumber;
    }

    public long getServiceNumberId() {
        return serviceNumberId;
    }

    public void setServiceNumberId(long serviceNumberId) {
        this.serviceNumberId = serviceNumberId;
    }

   

}
