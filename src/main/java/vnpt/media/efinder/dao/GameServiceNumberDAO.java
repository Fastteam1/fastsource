/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.dao;

import vnpt.media.efinder.entity.GameServiceNumber;
import vnpt.media.efinder.entity.GameServiceNumber1;
import vnpt.media.efinder.model.GameServiceNumberInfo;

/**
 *
 * @author vnpt2
 */
public interface GameServiceNumberDAO {

    public GameServiceNumber findGameServiceNumber(long gameId);
    public GameServiceNumber1 findGameServiceNumber1(long gameId);
    public GameServiceNumberInfo findGameServiceNumberInfo(long gameServiceNumberId);;
    public void save(GameServiceNumberInfo gameServiceNumberInfo);
}
