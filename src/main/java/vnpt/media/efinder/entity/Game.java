/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author vnpt2
 */
@Entity
@Table(name = "GAMES")
public class Game implements Serializable {

    private long gameId;
    private int gameInProcess;
    private GameTemplate gameTemplate;
    private String gameName;
    private Boolean status;
    private String description;
    private Date createTime;
    private String gameCode;

    public Game() {
    }

    @Id
    @Column(name = "GAME_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Game")
    @SequenceGenerator(name = "Game", sequenceName = "S_GAME")
    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
    }

    @Column(name = "GAME_IN_PROCESS")
    public int getGameInProcess() {
        return gameInProcess;
    }

    public void setGameInProcess(int gameInProcess) {
        this.gameInProcess = gameInProcess;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "GAME_TEMP_ID")
    public GameTemplate getGameTemplate() {
        return gameTemplate;
    }

    public void setGameTemplate(GameTemplate gameTemplate) {
        this.gameTemplate = gameTemplate;
    }

    @Column(name = "GAME_NAME", length = 100)
    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    @Column(name = "STATUS", length = 100)
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Column(name = "DESCRIPTION", length = 100)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_TIME")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "GAME_CODE", length = 100)
    public String getGameCode() {
        return gameCode;
    }

    public void setGameCode(String gameCode) {
        this.gameCode = gameCode;
    } 

}
