package com.swapper.domain.commands.item

import com.swapper.domain.commands.BaseCommand
import com.swapper.item.criteria.SearchCriteria
import com.swapper.item.criteria.SearchCriteriaAttribute
import grails.validation.Validateable

/**
 * Created by Bledar on 10/30/2014.
 */
@Validateable
class ItemAttributeCommand extends BaseCommand {

    SearchCriteria searchCriteria

    SearchCriteriaAttribute attribute
    Double numberValue
    Boolean booleanValue

}
