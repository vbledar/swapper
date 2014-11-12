package com.swapper.exception.communication

/**
 * Created with IntelliJ IDEA.
 * User: chalaris
 * Date: 5/21/12
 * Time: 11:25 AM
 * To change this template use File | Settings | File Templates.
 */
import com.swapper.exception.ServiceException

class SubscriptionNotFoundException extends ServiceException{
    public SubscriptionNotFoundException(String message){
        super(message)
    }
}
