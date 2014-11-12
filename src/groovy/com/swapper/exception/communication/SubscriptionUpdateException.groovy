package com.swapper.exception.communication

import com.swapper.exception.ServiceException

class SubscriptionUpdateException extends ServiceException{
    public SubscriptionUpdateException(String message){
        super(message)
    }
}
