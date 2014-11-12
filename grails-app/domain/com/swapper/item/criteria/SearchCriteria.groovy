package com.swapper.item.criteria

import com.swapper.domain.BaseRecord
import com.swapper.item.Category
import com.swapper.enums.criteria.SearchCriteriaType
import com.swapper.item.attribute.ItemAttribute

class SearchCriteria extends BaseRecord {

    SearchCriteriaType searchCriteriaType = SearchCriteriaType.LITERAL

    Category category

    String description
    String shortDescription

    Integer ordering

    static hasMany = [itemAttributes : ItemAttribute]

    static belongsTo = [Category]

    static constraints = {
        searchCriteriaType nullable: false

        description nullable: false
        shortDescription(nullable: true)

        ordering nullable: false

        category nullable: false
    }

    static mapping = {
        cache usage: 'nonstrict-read-write'
        category cache:  'nonstrict-read-write'
        itemAttributes cache: false
    }
}
