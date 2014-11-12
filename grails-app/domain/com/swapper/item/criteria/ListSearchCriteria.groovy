package com.swapper.item.criteria

class ListSearchCriteria extends SearchCriteria {

    static hasMany = [searchCriteriaAttributes: SearchCriteriaAttribute]

    static constraints = {
    }

    static mapping = {
        searchCriteriaAttributes(sort: "ordering", order: "asc",cache:  true)
        cache usage: 'nonstrict-read-write'
        category cache:  'nonstrict-read-write'
    }
}
