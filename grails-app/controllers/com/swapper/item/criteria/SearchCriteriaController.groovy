package com.swapper.item.criteria

import com.swapper.enums.criteria.SearchCriteriaType
import com.swapper.util.EnumUtilityMethods

import static org.springframework.http.HttpStatus.*
import com.swapper.item.Category
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SearchCriteriaController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        Category category = Category.findById(params.id)
        def searchCriteriaInstanceList = SearchCriteria.findAllByCategory(category)

        render (view: "/admin/category/searchCriteria/index", model: [category: category, searchCriteriaInstanceList: searchCriteriaInstanceList])
    }

    def show(SearchCriteria searchCriteriaInstance) {
        log.error searchCriteriaInstance
        render view: "/admin/category/searchCriteria/show", model: [searchCriteriaInstance: searchCriteriaInstance]
    }

    def create() {
        Category category = Category.findById(params.category.id)
        render view: "/admin/category/searchCriteria/create", model: [category: category, searchCriteriaInstance: new SearchCriteria(params)]
    }

    @Transactional
    def save() {
        log.error "Creating search criteria"
        SearchCriteriaType searchCriteriaType = EnumUtilityMethods.getEnumFromString(params.searchCriteriaType, SearchCriteriaType)
        def searchCriteriaInstance
        switch (searchCriteriaType) {
            case SearchCriteriaType.LITERAL:
                searchCriteriaInstance = new ListSearchCriteria()
                break;
            case SearchCriteriaType.NUMERIC:
                searchCriteriaInstance = new RangeSearchCriteria()
                break;
            case SearchCriteriaType.BOOLEAN:
                searchCriteriaInstance = new BooleanSearchCriteria()
                break;
            default:
                flash.message = "Search criteria type is not supported or not found."
                redirect(action: "create", params: ['category.id': params.category.id])
                return

        }

        log.error "Creating search criteria"
        bindData(searchCriteriaInstance, params)
        searchCriteriaInstance.validate()
        if (searchCriteriaInstance.hasErrors()) {
            respond searchCriteriaInstance.errors, view:'create', params: ['category.id': searchCriteriaInstance.category.id]
            return
        }

        searchCriteriaInstance.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'searchCriteria.label', default: 'SearchCriteria'), searchCriteriaInstance.description])
        redirect(action: "index", id: searchCriteriaInstance.category.id)
    }

    def edit(SearchCriteria searchCriteriaInstance) {
        render view: "/admin/category/searchCriteria/edit", model: [searchCriteriaInstance: searchCriteriaInstance]
    }

    @Transactional
    def update(SearchCriteria searchCriteriaInstance) {
        log.error "Updating search criteria."

        if (searchCriteriaInstance == null) {
            notFound()
            return
        }

        log.error "Updating search criteria."

        if (searchCriteriaInstance.hasErrors()) {
            render( view: "/admin/category/searchCriteria/edit", model: [searchCriteriaInstance: searchCriteriaInstance])
            return
        }

        log.error "Updating search criteria."

        searchCriteriaInstance.save flush:true

        flash.message = message(code: 'default.updated.message', args: [message(code: 'SearchCriteria.label', default: 'SearchCriteria'), searchCriteriaInstance.description])
        render (view: '/admin/category/searchCriteria/show', model: [searchCriteriaInstance: searchCriteriaInstance])
    }

    @Transactional
    def delete(SearchCriteria searchCriteriaInstance) {

        if (searchCriteriaInstance == null) {
            notFound()
            return
        }

        Long categoryId = searchCriteriaInstance.category.id

        searchCriteriaInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'SearchCriteria.label', default: 'SearchCriteria'), searchCriteriaInstance.description])
        redirect (action: "index", id: categoryId)
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'searchCriteria.label', default: 'SearchCriteria'), params.id])
        redirect (controller: "category", action: "index")
    }
}
