package com.swapper.exception

class ServiceException extends Exception {

    public ServiceException(){
        super()
    }

    public ServiceException(String message){
        super(message)
    }

    String getErrorCode() {
        return this.class.simpleName
    }
}
