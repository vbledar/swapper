package com.swapper.item

import com.swapper.item.attribute.ItemAttribute

class ItemQuantity {

    Integer numberOfItems = 0

    static hasMany = [attributes: ItemAttribute]

    static belongsTo = [item: Item]

    static constraints = {
        numberOfItems nullable: false

        item nullable: false
    }
}
