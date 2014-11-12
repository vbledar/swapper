package com.swapper.domain.commands.item

import com.swapper.domain.commands.BaseCommand
import com.swapper.item.ItemShipping

/**
 * Created by Bledar on 10/30/2014.
 */
class ItemShippingCommand extends BaseCommand {

    String shippingInfo

    Boolean noCosts = Boolean.TRUE

    BigDecimal shippingCosts = 0.0

    static constraints = {
        importFrom ItemShipping
    }

}
