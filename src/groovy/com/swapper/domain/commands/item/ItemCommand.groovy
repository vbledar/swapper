package com.swapper.domain.commands.item

import com.swapper.item.Category
import com.swapper.domain.commands.BaseCommand
import com.swapper.enums.item.ItemConditionType
import com.swapper.enums.item.ItemExchangeType
import com.swapper.enums.item.ItemStatusType
import com.swapper.enums.item.ItemVisibilityType
import com.swapper.item.Item
import grails.validation.Validateable

/**
 * Created by Bledar on 10/29/2014.
 */
@Validateable
class ItemCommand extends BaseCommand {

    String name
    String description
    String designer

    ItemConditionType itemConditionType = ItemConditionType.NEW
    ItemStatusType itemStatusType = ItemStatusType.AVAILABLE
    ItemVisibilityType itemVisibilityType = ItemVisibilityType.HIDDEN

    ItemExchangeType itemExchangeType = ItemExchangeType.SWAP

    BigDecimal price

    Category category

    List photos

    Set attrs = []

    static constraints = {
        importFrom Item
        id nullable: true
    }

    Long getAttributeIfSelected(Long id) {
        Long idFound = -1;
        this.attrs.find { at ->
            if (at.searchCriteria.id == id) {
                idFound = at.attribute.id
            }
        }
        return idFound;
    }

    String findRangeAttributeIfSelected(Long id, Double value) {
        String attributeFound = "";
        this.attrs.find {at ->
            if (at.searchCriteria.id == id && at.numberValue != null && value == at.numberValue) {
                attributeFound = "active"
            }
        }
        return attributeFound;
    }

}
