package com.swapper.item

import com.swapper.domain.commands.item.ItemCommand
import com.swapper.domain.commands.item.ItemShippingCommand
import com.swapper.enums.criteria.SearchCriteriaType
import com.swapper.enums.item.ItemConditionType
import com.swapper.enums.item.ItemExchangeType
import com.swapper.enums.item.ItemStatusType
import com.swapper.enums.item.ItemVisibilityType
import com.swapper.exception.InvalidSessionException
import com.swapper.exception.OptimisticLockingException
import com.swapper.exception.PersistException
import com.swapper.exception.ServiceException
import com.swapper.exception.item.InvalidItemAttributeValueException
import com.swapper.exception.item.ItemNotFoundException
import com.swapper.exception.item.UnknownSearchCriteriaException
import com.swapper.exception.item.UnknownSearchCriteriattributeException
import com.swapper.item.attribute.BooleanItemAttribute
import com.swapper.item.attribute.DoubleItemAttribute
import com.swapper.item.attribute.LiteralItemAttribute
import com.swapper.item.criteria.BooleanSearchCriteria
import com.swapper.item.criteria.ListSearchCriteria
import com.swapper.item.criteria.RangeSearchCriteria
import com.swapper.multimedia.photo.ItemPhoto
import com.swapper.user.Person
import com.swapper.util.EnumUtilityMethods
import grails.transaction.Transactional
import org.hibernate.criterion.CriteriaSpecification

@Transactional
class ItemService {

    Item create(Person person, ItemCommand createCommand, ItemShippingCommand itemShippingCommand) throws com.swapper.exception.ServiceException{
        if(!person){
            throw new InvalidSessionException()
        }

        // create a new item instance
        def item = new Item(name: createCommand.name,
                description: createCommand.description,
                designer: createCommand.designer,
                category: createCommand.category,
                itemConditionType: createCommand.itemConditionType,
                itemExchangeType: createCommand.itemExchangeType,
                person: person)

        // add item to person's item
        person.addToItems(item)

        // persist the item instance
        if (!item.save()) {
            log.error(item.errors)
            throw new PersistException(entity: item)
        }

        // TODO apply quality check on user
        // TODO apply item shipping information

        // apply item attributes
        updateItemAttributes(item,createCommand.attrs)

        // apply item photos
        addItemPhotos(item.id,createCommand.photos)

        return item
    }

    Item update(Item item, def params) throws ServiceException {

        // keep track of previous item category
        Category category = item.category

        // bind parameters from request with item instance
        item.properties = params

        // if the item category has been changed then its attributes are deleted
        if(!category.equals(item.category)) {
            item.quantities.each {
                deleteItemAttributes(it)
            }
        }


//        if ( item.exchangeType == ExchangeType.SWAP) {
//            if ( !item.itemShipping ) {
//                item.itemShipping = new ItemShipping()
//            }
//
//            item.itemShipping.noCosts = true
//            item.itemShipping.domestic = false
//            item.itemShipping.domesticCosts = 0.0
//            item.itemShipping.european = false
//            item.itemShipping.europeanCosts = 0.0
//            item.itemShipping.usa = false
//            item.itemShipping.usaCosts = 0.0
//
//            if (!item.itemShipping.save()) {
//                log.error(itemShipping.errors)
//                throw new PersistException(entity: item.itemShipping)
//            }
//        }

        if (!item.save(flush: true)) {
            log.error "Failed to update item."
            item.errors.each {
                log.error it
            }
            throw new PersistException(entity: item)
        }

        return item
    }

    /**
     * Delete all item attributes prior to updating with new ones.
     *
     * @param item, the item which will have its attributes removed.
     *
     * @throws com.swapper.exception.ServiceException
     */
    void deleteItemAttributes(def itemQuantity) throws com.swapper.exception.ServiceException {
        def currentAttrs = []

        itemQuantity.attributes.each {
            currentAttrs << it
        }

        currentAttrs.each {
            itemQuantity.removeFromAttributes(it)
            it.delete()
        }

        if(!itemQuantity.save()){
            log.error(itemQuantity.errors)
            throw new PersistException(entity: itemQuantity)
        }
    }

    /**
     * Update item attributes. First it has to delete previous item attributes.
     *
     * @param item, the item which will have its attributes updated.
     * @param attrs, the new attributes to update on the item.
     *
     * @throws com.swapper.exception.ServiceException
     */
    void updateItemAttributes(def item, def attrs) throws com.swapper.exception.ServiceException {

        if(!attrs){
            return
        }

        item.quantities.each {
            deleteItemAttributes(it)
        }

        ItemQuantity itemQuantity
        if(item.quantities && item.quantities.size() > 0) {
            itemQuantity = item.quantities[0]
        }

        if(!itemQuantity) {
            itemQuantity = new ItemQuantity()
            item.addToQuantities(itemQuantity)
            if(!itemQuantity.save()){
                log.error(itemQuantity.errors)
                throw new PersistException(entity: itemQuantity)
            }
        }

        attrs.each{
            def searchCriteria = it.searchCriteria
            def itemAttr
            def val

            if(searchCriteria instanceof RangeSearchCriteria){
                if(searchCriteria.acceptableValue(it.numberValue)){
                    val = it.numberValue
                }
                else{
                    throw new InvalidItemAttributeValueException();
                }
            }else if(searchCriteria instanceof ListSearchCriteria){
                def searchAttr = it.attribute
                if(!searchAttr){
                    throw new UnknownSearchCriteriattributeException();
                }
                val = searchAttr.descr
            }else if(searchCriteria instanceof BooleanSearchCriteria){
                val = it.booleanValue
            }else{
                throw new UnknownSearchCriteriaException();
            }

            if(searchCriteria.searchCriteriaType == SearchCriteriaType.LITERAL){
                itemAttr = new LiteralItemAttribute(stringValue: val,searchCriteria:searchCriteria, item: item)
            }else if(searchCriteria.searchCriteriaType  == SearchCriteriaType.NUMERIC){
                itemAttr = new DoubleItemAttribute(numberValue: new Double(val),searchCriteria:searchCriteria, item: item)
            }else if(searchCriteria.searchCriteriaType == SearchCriteriaType.BOOLEAN){
                itemAttr = new BooleanItemAttribute(booleanValue: Boolean.valueOf(val), searchCriteria: searchCriteria, item: item)
            }

            itemQuantity.addToAttributes(itemAttr)

            if(!itemAttr.save()) {
                log.error(itemAttr.errors)
                throw new PersistException(entity: itemAttr)
            }
        }
    }

    /**
     * Add photos to item.
     *
     * @param itemId the item's id.
     * @param photos the list of photos to add on items.
     *
     * @throws ServiceException
     */
    void addItemPhotos(long itemId, def photos) throws ServiceException {
        if(!photos){
            return
        }

        def item = Item.get(itemId)
        if(!item){
            throw new ItemNotFoundException()
        }

        photos.eachWithIndex{ ph, idx ->
            boolean found = false
            for (ItemPhoto ip : item.photos) {
                if (ip.photoId.equalsIgnoreCase(ph?.photoId)) {
                    found = true
                    break;
                }
            }

            if (!found) {
                item.addToPhotos(new ItemPhoto(photoId: ph.photoId, url: ph.url,description: ph?.description, ordering: new Integer(idx+1)))
            }
        }

        if(!item.save()){
            log.error(item.errors)
            throw new PersistException(entity: item)
        }
    }

    def findItemsOfPerson(Person person, def params, boolean count) {
        def results = Item.createCriteria().list {
            if (!count && params.max) {
                if (params.max instanceof String) {
                    maxResults Integer.parseInt(params.max)
                } else if (params.max instanceof Integer) {
                    maxResults params.max
                }
            }

            if (!count && params.offset) {
                firstResult Integer.parseInt(params.offset)
            }

            eq('person', person)

            if (params.name && params.name.trim().length() > 0) {
                ilike ('name', '%' + params.name + '%')
            }

            if (params.itemExchangeType && params.itemExchangeType.trim().length() > 0) {
                ItemExchangeType  itemExchangeType = EnumUtilityMethods.getEnumFromString(params.itemExchangeType, ItemExchangeType);
                if (itemExchangeType) {
                    eq ('itemExchangeType', itemExchangeType)
                }
            }

            if (params.itemStatusType && params.itemStatusType.trim().length() > 0) {
                ItemStatusType itemStatusType = EnumUtilityMethods.getEnumFromString(params.itemStatusType, ItemStatusType);
                if (itemStatusType) {
                    eq ('itemStatusType', itemStatusType)
                }
            }

            if (params.itemConditionType && params.itemConditionType.trim().length() > 0) {
                ItemConditionType itemConditionType = EnumUtilityMethods.getEnumFromString(params.itemConditionType, ItemConditionType);
                if (itemConditionType) {
                    eq ('itemConditionType', itemConditionType)
                }
            }

            if (params.itemVisibilityType && params.itemVisibilityType.trim().length() > 0) {
                ItemVisibilityType itemVisibilityType = EnumUtilityMethods.getEnumFromString(params.itemVisibilityType, ItemVisibilityType);
                if (itemVisibilityType) {
                    eq ('itemVisibilityType', itemVisibilityType)
                }
            }

            if (count) {
                projections {
                    rowCount()
                }
            }
        }
    }
}
