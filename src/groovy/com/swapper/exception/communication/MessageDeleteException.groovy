package com.swapper.exception.communication

import com.swapper.exception.ServiceException

class MessageDeleteException extends ServiceException {
    public MessageDeleteException(String message){
        super(message)
    }
}
