package com.swapper.user

import com.swapper.domain.BaseRecord

class Address extends BaseRecord {

    String firstAddress
    String secondAddress

    String city
    String country

    String postalCode

    String furtherInformation

    Boolean mainAddress = Boolean.FALSE

    static belongsTo = [person: Person]

    static constraints = {
        firstAddress nullable: false
        secondAddress nullable: true

        city nullable: false
        country nullable: false

        postalCode nullable: true

        furtherInformation nullable: true

        mainAddress nullable: false

        person nullable: false
    }
}
