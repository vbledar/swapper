package com.swapper.item.criteria

import com.swapper.domain.BaseRecord

class SearchCriteriaAttribute extends BaseRecord {

    String descr
    ListSearchCriteria criterion

    int ordering

    static belongsTo = [ListSearchCriteria]

    static constraints = {
    }

    static mapping = {
        cache usage: 'nonstrict-read-write'
        criterion cache:  'nonstrict-read-write'
    }
}
