package com.swapper.exception.communication

import com.swapper.exception.ServiceException

class ConversationDeleteException extends ServiceException {
    public ConversationDeleteException(String message){
        super(message)
    }
}