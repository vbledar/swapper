package com.swapper.exception.communication

import com.swapper.exception.ServiceException

class SubscriptionDeleteException extends ServiceException{
    public SubscriptionDeleteException(String message){
        super(message)
    }
}
