package com.swapper.util

import com.swapper.domain.commands.item.ItemAttributeCommand
import com.swapper.item.Item
import com.swapper.item.attribute.BooleanItemAttribute
import com.swapper.item.attribute.DoubleItemAttribute
import com.swapper.item.attribute.LiteralItemAttribute
import com.swapper.item.criteria.BooleanSearchCriteria
import com.swapper.item.criteria.ListSearchCriteria
import com.swapper.item.criteria.RangeSearchCriteria
import com.swapper.item.criteria.SearchCriteriaAttribute

class ItemUtils {

    /**
     * Provided a params parameter, filter the list criteria attributes
     * @param params
     * @return
     */

    protected static def createListSearchCriteriaMap(def params){
        Map<String, String> criteria = params.listcriteria
        def listCriteriaMap = [:]

        criteria.each {k, v ->
            if (k.startsWith("_") || v.equalsIgnoreCase("")){

            }
            else{
                def tokens = k.tokenize('_')
                Long criteriaTypeId     = Long.valueOf(tokens.get(0))
                Long attributeId        = Long.valueOf(tokens.get(1))
                String attributeDescr   = tokens.get(2)
                if(listCriteriaMap.containsKey(criteriaTypeId)){
                    List lst = listCriteriaMap.get(criteriaTypeId)
                    if(lst == null){
                        lst = new ArrayList()
                    }
                    lst.add(attributeDescr)
                }
                else{
                    List lst = new ArrayList()
                    lst.add(attributeDescr)
                    listCriteriaMap.put(criteriaTypeId, lst)
                }
            }
        }

        return listCriteriaMap
    }

    /**
     * Provided a params parameter, filter the range criteria attributes
     * @param params
     * @return
     */
    protected static def createRangeSearchCriteriaMap(def params){
        Map<String, String> criteria = params.rangecriteria
        def rangeCriteriaMap = [:]

        criteria.each {k, v ->
            if (k.startsWith("_") || v instanceof Map){

            }
            else{
                def tokens = k.tokenize('_')
                Long criteriaTypeId     = Long.valueOf(tokens.get(0))
                String attributeValue   = tokens.get(1)
                if(rangeCriteriaMap.containsKey(criteriaTypeId)){
                    List lst = rangeCriteriaMap.get(criteriaTypeId)
                    if(lst == null){
                        lst = new ArrayList()
                    }
                    lst.add(Double.valueOf(attributeValue))
                }
                else{
                    List lst = new ArrayList()
                    lst.add(Double.valueOf(attributeValue))
                    rangeCriteriaMap.put(criteriaTypeId, lst)
                }
            }
        }

        return rangeCriteriaMap
    }


    protected static def createBooleanSearchCriteriaMap(def params){
        Map<String, String> criteria = params.booleancriteria
        def booleanCriteriaMap = [:]

        criteria.each {k, v ->
            Long criteriaTypeId     = Long.valueOf(k)
            String attributeValue   = v

            List lst = new ArrayList()
            if(attributeValue.equals(Boolean.TRUE.toString())){
                lst.add(Boolean.TRUE)
                booleanCriteriaMap.put(criteriaTypeId, lst)
            }else if(attributeValue.equals(Boolean.FALSE.toString())){
                lst.add(Boolean.FALSE)
                booleanCriteriaMap.put(criteriaTypeId, lst)
            }
        }

        return booleanCriteriaMap
    }
    

    public static def getItemAttributeFromSearchAttribute(SearchCriteriaAttribute searchAttribute, Item item){

        if(!searchAttribute || !item || !item.attributes)
            return null

        def ia
        item.quantities[0].attributes.each {
            if(it.searchCriteria.equals(searchAttribute.criterion)){
                if(it.instanceOf(LiteralItemAttribute) && it.stringValue.equalsIgnoreCase(searchAttribute.descr)){
                    ia = it
                    return;
                }

            }
        }

        return ia

    }


    public static def getItemAttributeFromRangeSearchCriteria(RangeSearchCriteria criteria, Item item, double value){

        if(!criteria || !item || !item.quantities[0].attributes)
            return null

        def ia
        item.quantities[0].attributes.each {
            if(it.searchCriteria.equals(criteria)){
                if(it.instanceOf(DoubleItemAttribute) && it.numberValue.equals(value)) {
                    ia = it
                    return
                }

            }
        }

        return ia

    }

    public static def getItemAttributeFromBooleanSearchCriteria(BooleanSearchCriteria criteria, Item item, boolean value){

        if(!criteria || !item || !item.attributes)
            return null

        def ia
        item.quantities[0].attributes.each {
            if(it.searchCriteria.equals(criteria)){
                if(it.instanceOf(BooleanItemAttribute) && it.booleanValue.equals(value)) {
                    ia = it
                    return
                }

            }
        }

        return ia
    }

    static String attributeValue(ItemAttributeCommand attribute){

        if(!attribute)
            return ""

        if(attribute.searchCriteria instanceof RangeSearchCriteria)
            return attribute.numberValue
        else if(attribute.searchCriteria instanceof  ListSearchCriteria && attribute.attribute)
            return attribute.attribute.descr
        else if(attribute.searchCriteria instanceof BooleanSearchCriteria)
            return attribute.booleanValue
        else
            return ""
    }

    static boolean isCriteriaSelected(def vals, def cr, def crVals){

        return crVals.contains(vals."${cr}")
    }
}
