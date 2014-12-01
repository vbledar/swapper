package com.swapper.request

import com.swapper.domain.BaseRecord
import com.swapper.enums.request.RequestTypeEnum

abstract class Request extends BaseRecord {

    Date dateCreated
    Date lastUpdated

    RequestTypeEnum requestTypeEnum = RequestTypeEnum.SWAP_REQUEST

    static hasOne = [requestTxn: RequestTxn, respondTxn: RequestTxn]

    static constraints = {
        requestTxn nullable: false
        respondTxn nullable: false
    }
}
