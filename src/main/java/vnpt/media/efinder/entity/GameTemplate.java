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
@Table(name = "GAME_TEMPLATES")
public class GameTemplate implements Serializable {

    private long gameTempId;
    private GameCategory gameCategorys;
    private String gameTempName;
    private boolean status;
    private String description;
    private Date createTime;
    private boolean isQuestion;

    public GameTemplate() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "s_game_template")
    @SequenceGenerator(name = "s_game_template", sequenceName = "S_GAME_TEMPLATE")
    @Column(name = "GAME_TEMP_ID", nullable = false)
    public long getGameTempId() {
        return gameTempId;
    }

    public void setGameTempId(long gameTempId) {
        this.gameTempId = gameTempId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "GAME_CATE_ID", nullable = false)
    public GameCategory getGameCategorys() {
        return gameCategorys;
    }

    public void setGameCategorys(GameCategory gameCategorys) {
        this.gameCategorys = gameCategorys;
    }

    @Column(name = "GAME_TEMP_NAME", length = 100)
    public String getGameTempName() {
        return gameTempName;
    }

    public void setGameTempName(String gameTempName) {
        this.gameTempName = gameTempName;
    }

    @Column(name = "STATUS", length = 1)
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
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
    @Column(name = "CREATE_TIME", nullable = false)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "IS_QUESTION", length = 1)
    public boolean isIsQuestion() {
        return isQuestion;
    }

    public void setIsQuestion(boolean isQuestion) {
        this.isQuestion = isQuestion;
    }
    
    
}
