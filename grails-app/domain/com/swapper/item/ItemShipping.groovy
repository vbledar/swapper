package com.swapper.item

import com.swapper.domain.BaseRecord

class ItemShipping extends BaseRecord {

    String shippingInfo

    Boolean noCosts = Boolean.TRUE

    BigDecimal shippingCosts

    static belongsTo = [item: Item]

    static constraints = {
        shippingInfo type: 'text', nullable: true, maxLength: 3000
        noCosts nullable: true
        shippingCosts nullable: true, min: 0.0
    }

    public String toString() {
        return "[shippingInfo: " + shippingInfo + ", noCosts: " + noCosts + ", domesticCosts: " + domesticCosts + "]"
    }
}
