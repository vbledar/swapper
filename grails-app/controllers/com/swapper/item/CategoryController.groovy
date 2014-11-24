package com.swapper.item

import com.swapper.BaseController
import com.swapper.user.Person

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CategoryController extends BaseController {

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def categoryService
    def itemService

    def subcategories(){
        log.error params

        def categories = categoryService.getSubCategories(params.id?.toLong(),params)
        log.error categories?.size()
        render(template: "categoriesDropdown", model: [categories: categories])
    }

    def items() {
        params.max = getMaximumNumberOfElementsInView()
        render(view: '/item/itemsList', model: filterItems(params))
    }

    protected Map filterItems(def params){
        def category = categoryService.getCategoryByNameAndParentName(params.subcat,params.maincat)
        def items = itemService.listItemsOfCategory(category, params, Boolean.FALSE)
        def itemsCount = itemService.listItemsOfCategory(category, params, Boolean.TRUE)

        List searchCriteria = category.getSearchCriterias().asList()

        log.error "Items count is: " + items

        return [ maincat : params.maincat,
                 subcat: params.subcat,
                 items: items,
                 itemsCount: itemsCount,
                 searchCriteria: searchCriteria,
                 user: (Person) getLoggedInUserFromDatabase()]
    }

    /**
     * Administration actions.
     */
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def categoryInstanceList = Category.list(params)
        def categoryInstanceCount = Category.count()
        render (view: "/admin/category/index", model: [categoryInstanceList: categoryInstanceList, categoryInstanceCount: categoryInstanceCount])
    }

    def show(Category categoryInstance) {
        render (view: "/admin/category/show", model: [categoryInstance: categoryInstance])
    }

    def create() {
        render (view: "/admin/category/create", model: [categoryInstance: new Category(params)])
    }

    @Transactional
    def save(Category categoryInstance) {
        if (categoryInstance == null) {
            notFound()
            return
        }

        if (categoryInstance.hasErrors()) {
            render (view: "/admin/category/create", model: [categoryInstance: categoryInstance])
            return
        }

        categoryInstance.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.name])
        render(view: "index")
    }

    def edit(Category categoryInstance) {
        render (view: "/admin/category/edit", model: [categoryInstance: categoryInstance])
    }

    @Transactional
    def update(Category categoryInstance) {
        if (categoryInstance == null) {
            notFound()
            return
        }


        if (categoryInstance.hasErrors()) {
            render(view: "/admin/category/edit", model: [categoryInstance: categoryInstance])
            return
        }

        categoryInstance.save flush: true

        flash.message = message(code: 'default.updated.message', args: [message(code: 'category.label', default: 'Category'), category.name])
        render (view: "/admin/category/show", model: [categoryInstance: categoryInstance])
    }

    @Transactional
    def delete(Category categoryInstance) {

        if (categoryInstance == null) {
            notFound()
            return
        }

        categoryInstance.delete flush:true
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'Category.label', default: 'Category'), categoryInstance.id])
        redirect(controller: "category", action: "index")
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])
        redirect(controller: "category", action: "index")
        return
    }
}
