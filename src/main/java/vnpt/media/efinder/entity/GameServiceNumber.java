/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author vnpt2
 */
@Entity
@Table(name = "GAME_SERVICENUMBERS")
public class GameServiceNumber implements Serializable {

    private long gameServiceNumberId;
    private long gameId;
    private ServiceNumbers serviceNumbers;

    public GameServiceNumber() {
    }

    @Id
    @Column(name = "GAME_SERVICENUMBER_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GameServiceNumber")
    @SequenceGenerator(name = "GameServiceNumber", sequenceName = "S_GAME_SERVICE_NUMBER")
    public long getGameServiceNumberId() {
        return gameServiceNumberId;
    }

    public void setGameServiceNumberId(long gameServiceNumberId) {
        this.gameServiceNumberId = gameServiceNumberId;
    }

    @Column(name = "GAME_ID")
    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
    }

    @OneToOne
    @JoinColumn(name = "SERVICE_NUMBER_ID")
    public ServiceNumbers getServiceNumbers() {
        return serviceNumbers;
    }

    public void setServiceNumbers(ServiceNumbers serviceNumbers) {
        this.serviceNumbers = serviceNumbers;
    }

}
