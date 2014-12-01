package com.swapper.request

import com.swapper.enums.request.RequestTxnStatusEnum
import com.swapper.item.Item
import com.swapper.user.Person

class RequestTxn {

    RequestTxnStatusEnum requestTxnStatusEnum = RequestTxnStatusEnum.OPEN

    static belongsTo = [person: Person, item: Item]

    static constraints = {
        person nullable: false
        item nullable: true
    }
}
