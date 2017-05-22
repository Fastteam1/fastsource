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
public class MyGeneric<T> {

    private T tobject;

    public MyGeneric(Class<T> tclass)
            throws InstantiationException, IllegalAccessException {

        this.tobject = (T) tclass.newInstance();

    }

    public T getTObject() {
        return this.tobject;
    }
}
