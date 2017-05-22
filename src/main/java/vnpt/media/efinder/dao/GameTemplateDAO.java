/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import java.util.List;
import vnpt.media.efinder.entity.GameTemplate;
import vnpt.media.efinder.model.GameTemplateInfo;
import vnpt.media.efinder.model.PaginationResult;

/**
 *
 * @author vnpt2
 */
public interface GameTemplateDAO {

    public GameTemplate findGameTemplate(long gameTemplateId);

    public GameTemplateInfo findGameTemplateInfo(long gameTemplateId);;

    public void save(GameTemplateInfo gameTemplateInfo);
    
    public List<GameTemplateInfo> queryGameTemplates();
}
