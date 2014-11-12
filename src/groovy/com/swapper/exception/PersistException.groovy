package com.swapper.exception

import com.swapper.domain.BaseRecord

class PersistException extends EntityAwareException {

    public PersistException(){
        super()
    }

    public PersistException(BaseRecord entity){
        super(entity)
    }
}
