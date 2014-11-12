package com.swapper.item.criteria

class BooleanSearchCriteria extends SearchCriteria {

    static constraints = {

    }

    static mapping = {
        cache usage: 'nonstrict-read-write'
        category cache:  'nonstrict-read-write'
    }
}
