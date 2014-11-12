package com.swapper.item

import com.swapper.domain.BaseRecord
import com.swapper.enums.item.ItemConditionType
import com.swapper.enums.item.ItemExchangeType
import com.swapper.enums.item.ItemStatusType
import com.swapper.enums.item.ItemVisibilityType
import com.swapper.item.attribute.LiteralItemAttribute
import com.swapper.item.criteria.ListSearchCriteria
import com.swapper.item.criteria.SearchCriteria
import com.swapper.multimedia.photo.ItemPhoto
import com.swapper.user.Person

class Item extends BaseRecord {

    String name
    String description
    String designer

    BigDecimal price;

    ItemConditionType itemConditionType = ItemConditionType.NEW
    ItemStatusType itemStatusType = ItemStatusType.AVAILABLE
    ItemVisibilityType itemVisibilityType = ItemVisibilityType.HIDDEN

    ItemExchangeType itemExchangeType = ItemExchangeType.SWAP

    static hasOne = [itemShipping: ItemShipping]

    static hasMany = [quantities: ItemQuantity, photos: ItemPhoto]

    static belongsTo = [category: Category, person: Person]

    static constraints = {
        name nullable: false
        description nullable: true
        designer nullable: true

        price nullable: true, min: 0.0, matches: [0-9]

        itemConditionType nullable: false
        itemStatusType nullable: false
        itemVisibilityType nullable: false

        itemExchangeType nullable: false

        itemShipping nullable: true

        quantities nullable: true
        photos nullable: true

        category nullable: false
    }

    /**
     * Called before inserting item.
     */
    def beforeInsert() {
        updatePriceBasedOnExchangeType();
    };

    /**
     * Call before updating item.
     */
    def beforeUpdate() {
        updatePriceBasedOnExchangeType();
    };

    /**
     * Sets the price value to null if exchangeType is SWAP or GIVEAWAY.
     * @return
     */
    def updatePriceBasedOnExchangeType() {
        if (this.itemExchangeType != null && this.itemExchangeType == ItemExchangeType.SWAP) {
            this.price = null;
        }
    };

    Long getAttributeIfSelected(Long id) {
        Long idFound = -1;

        SearchCriteria searchCriteria = SearchCriteria.findById(id)
        if (!searchCriteria) {
            return idFound
        }

        // process all quantities in item
        this.quantities.each { quantity ->
            quantity.attributes.each { attribute ->
                if (attribute.searchCriteria == searchCriteria) {
                    if (attribute.searchCriteria instanceof ListSearchCriteria) {
                        ((ListSearchCriteria) searchCriteria).searchCriteriaAttributes.each { searchCriteriaAttribute ->
                            if (searchCriteriaAttribute.descr.equalsIgnoreCase(((LiteralItemAttribute) attribute).stringValue)) {
                                idFound = searchCriteriaAttribute.id
                            }
                        }
                    }
                }
            }
        }
        return idFound;
    }

    String findRangeAttributeIfSelected(Long id, Double value) {
        String attributeFound = "";
        this?.quantities[0]?.attributes?.find {at ->
            if (at.searchCriteria.id == id && at.numberValue != null && value == at.numberValue) {
                attributeFound = "active"
            }
        }
        return attributeFound;
    }
}
