package com.swapper.item.attribute

import com.swapper.domain.BaseRecord
import com.swapper.item.ItemQuantity
import com.swapper.item.criteria.SearchCriteria

class ItemAttribute extends BaseRecord {

    SearchCriteria searchCriteria

    String notes

    static belongsTo = [itemQuantity: ItemQuantity]

    static constraints = {
        itemQuantity nullable: false
        searchCriteria nullable: false

        notes nullable: true
    }

}
