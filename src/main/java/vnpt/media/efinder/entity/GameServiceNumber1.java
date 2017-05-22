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
public class GameServiceNumber1 implements Serializable {

    private long gameServiceNumberId;
    private Game1 game1;
    private ServiceNumbers1 serviceNumbers1;

    public GameServiceNumber1() {
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

    @OneToOne
    @JoinColumn(name = "GAME_ID")
    public Game1 getGame1() {
        return game1;
    }

    public void setGame1(Game1 game1) {
        this.game1 = game1;
    }

    @OneToOne
    @JoinColumn(name = "SERVICE_NUMBER_ID")

    public ServiceNumbers1 getServiceNumbers1() {
        return serviceNumbers1;
    }

    public void setServiceNumbers1(ServiceNumbers1 serviceNumbers1) {
        this.serviceNumbers1 = serviceNumbers1;
    }

}
