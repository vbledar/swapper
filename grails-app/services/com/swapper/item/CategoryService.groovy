package com.swapper.item

import com.swapper.exception.ServiceException
import com.swapper.exception.category.CategoryNotFoundException
import grails.transaction.Transactional

@Transactional
class CategoryService {

//    def deleteCategory(Category category){
//        category.delete()
//    }
//
//    def changeCategoryVisibility(Category category) {
//        category.visible = !category.visible;
//        if (!category.save()) {
//            category.errors.each {
//                log.error it
//            }
//            throw new PersistException(entity: category)
//        }
//    }
//
//    def getRootCategories(def params, boolean count) {
//        def results = Category.createCriteria().list() {
//            if (!count && params.max) {
//                if (params.max instanceof String) {
//                    maxResults Integer.parseInt(params.max)
//                } else if (params.max instanceof Integer) {
//                    maxResults params.max
//                }
//            }
//
//            if (!count && params.offset) {
//                firstResult Integer.parseInt(params.offset)
//            }
//
//            isNull('parent')
//
//            if (count) {
//                projections {
//                    rowCount()
//                }
//            } else {
//                order('ordering', 'asc')
//            }
//        }
//    }
    List getRootCategories(def properties){
        def pagedResult = Category.createCriteria().list () {
            and{
                isNull("parent")
            }
        }
        return pagedResult
    }

//    List getInfoDataCategories(def properties) {
//        def infoDataCategories = InfoDataCategory.findAll();
//        return infoDataCategories
//    }
//
    Category getCategory(long id){

        return Category.get(id)
    }
//
//    Category getCategoryByNameAndParentName(String name, parentName) throws ServiceException{
//        return Category.createCriteria().get{
//            parent{
//                ilike('name',parentName)
//            }
//            ilike('name',name)
//            eq("visible", Boolean.TRUE)
//        }
//    }
//
    List getSubCategories(long id, def properties) throws ServiceException {

        def parentCategory = getCategory(id)

        if (!parentCategory)
            throw new CategoryNotFoundException()

        def pagedResult = Category.createCriteria().list(properties) {
            and{
                eq("parent",parentCategory)
                eq("visible", Boolean.TRUE)
            }
        }

        return pagedResult

    }
//
//    List getSubCategoriesForAdmin(long id, def properties) throws ServiceException{
//
//        def parentCategory = getCategory(id)
//
//        if (!parentCategory)
//            throw new CategoryNotFoundException()
//
//        def pagedResult = Category.createCriteria().list(properties) {
//            and{
//                eq("parent",parentCategory)
//            }
//        }
//
//        return pagedResult
//
//    }
//
//    def getSubCategories(params, count) {
//        def results = Category.createCriteria().like() {
//            if (!count && params.max) {
//                if (params.max instanceof String) {
//                    maxResults Integer.parseInt(params.max)
//                } else if (params.max instanceof Integer) {
//                    maxResults params.max
//                }
//            }
//
//            if (!count && params.offset) {
//                firstResult Integer.parseInt(params.offset)
//            }
//
//            createAlias('parent', 'parentAlias', CriteriaSpecification.LEFT_JOIN)
//
//            if (params.parentId) {
//                eq ('parentAlias.id', params.parentId)
//            } else {
//                isNotNull('parent')
//            }
//
//            if (params.name) {
//                ilike('name', '%' + params.name + '%')
//            }
//
//            if (params.description) {
//                ilike ('description', '%' + params.description + '%')
//            }
//
//            if (count) {
//                projections {
//                    rowCount()
//                }
//            }
//        }
//    }
}
