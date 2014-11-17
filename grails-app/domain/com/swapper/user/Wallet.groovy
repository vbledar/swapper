package com.swapper.user

import com.swapper.domain.BaseRecord

class Wallet extends BaseRecord {

    Integer availablePoints = 0
    Integer reservedPoints = 0
    Integer consumedPoints = 0

    static belongsTo = [person: Person]

    static constraints = {
    }
}
