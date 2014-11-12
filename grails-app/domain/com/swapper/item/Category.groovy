package com.swapper.item

import com.swapper.domain.BaseRecord
import com.swapper.item.criteria.SearchCriteria

class Category extends BaseRecord {

    Category parent = null

    String name
    String description

    Boolean visible = Boolean.TRUE

    int ordering

    static hasMany = [categories: Category, items: Item, searchCriterias: SearchCriteria]

    static constraints = {
        parent(nullable: true)
    }

    static mapping = {
        categories(sort: "ordering", order: "asc")
        searchCriterias(sort: "ordering", order: "asc")
        sort "ordering"
        cache usage: 'nonstrict-read-write'
        categories cache:  'nonstrict-read-write'
        searchCriterias cache:  'nonstrict-read-write'
        parent cache: 'nonstrict-read-write'
        items cache: false
    }

    static subCategories = where{
        parent!=null
    }


    String toString(){
        return "[name: $name]"
    }

    static def getMainCategories(){
        return Category.findAllByParentIsNull()
    }

    static def getVisibleChildren(){
        return Category.findAllByParentAndVisible(this, Boolean.TRUE)
    }
}
