package com.swapper.multimedia.photo

import com.swapper.item.Item

class ItemPhoto extends Photo {

    String description
    Integer ordering

    Boolean mainPhoto = Boolean.FALSE

    static belongsTo = [item:Item]

    static constraints = {
        description nullable: true, maxSize: 2000
        ordering nullable: true
        item nullable: false
    }

}
