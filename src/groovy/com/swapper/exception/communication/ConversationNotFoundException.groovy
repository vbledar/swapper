package com.swapper.exception.communication

import com.swapper.exception.ServiceException

class ConversationNotFoundException extends ServiceException {
    public ConversationNotFoundException(String message){
        super(message)
    }
}

