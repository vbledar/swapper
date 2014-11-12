package com.swapper.exception.communication


import com.swapper.exception.ServiceException

class MessageNotFoundException extends ServiceException{
    public MessageNotFoundException(String message){
        super(message)
    }
}
