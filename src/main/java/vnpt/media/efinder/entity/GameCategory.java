/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author vnpt2
 */
@Entity
@Table(name = "GAME_CATEGORYS")
public class GameCategory implements Serializable {

    private long gameCateId;
    private String gameCateName;
    private Boolean status;
    private String description;
    private Date createTime;
    private List<GameTemplate> gameTemplates;

    public GameCategory() {
    }

    @Id
    @Column(name = "GAME_CATE_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GameCategory")
    @SequenceGenerator(name = "GameCategory", sequenceName = "s_game_cate")
    public long getGameCateId() {
        return gameCateId;
    }

    public void setGameCateId(long gameCateId) {
        this.gameCateId = gameCateId;
    }

    @Column(name = "GAME_CATE_NAME", length = 100)
    public String getGameCateName() {
        return gameCateName;
    }

    public void setGameCateName(String gameCateName) {
        this.gameCateName = gameCateName;
    }

    @Column(name = "STATUS", length = 1)
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
    @Column(name = "CREATE_TIME", nullable = false)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @OneToMany(mappedBy = "gameCategorys")
    public List<GameTemplate> getGameTemplates() {
        return gameTemplates;
    }

    public void setGameTemplates(List<GameTemplate> gameTemplates) {
        this.gameTemplates = gameTemplates;
    }

}
