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
public class GameServiceNumberInfo {

    private long gameServiceNumberId;
    private long gameId;
    private long serviceNumberId;
    private String serviceNumber;

    public GameServiceNumberInfo() {
    }

    public GameServiceNumberInfo(long gameServiceNumberId, long gameId, long serviceNumberId) {
        this.gameServiceNumberId = gameServiceNumberId;
        this.gameId = gameId;
        this.serviceNumberId = serviceNumberId;
    }

    public long getGameServiceNumberId() {
        return gameServiceNumberId;
    }

    public void setGameServiceNumberId(long gameServiceNumberId) {
        this.gameServiceNumberId = gameServiceNumberId;
    }

    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
    }

    public long getServiceNumberId() {
        return serviceNumberId;
    }

    public void setServiceNumberId(long serviceNumberId) {
        this.serviceNumberId = serviceNumberId;
    }

    public String getServiceNumber() {
        return serviceNumber;
    }

    public void setServiceNumber(String serviceNumber) {
        this.serviceNumber = serviceNumber;
    }

}
