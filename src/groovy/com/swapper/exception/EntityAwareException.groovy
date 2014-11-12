package com.swapper.exception

import com.swapper.domain.BaseRecord

class EntityAwareException extends ServiceException {

    BaseRecord entity

    public EntityAwareException(){
        super()
    }

    public EntityAwareException(BaseRecord entity){
        super()
        this.entity = entity
    }
}
