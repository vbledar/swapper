package com.swapper.item



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CategoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def categoryService

    def subcategories(){
        log.error params

        def categories = categoryService.getSubCategories(params.id?.toLong(),params)
        log.error categories?.size()
        render(template: "categoriesDropdown", model: [categories: categories])
    }

    /**
     * Administration actions.
     */
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def categoryInstanceList = Category.list(params)
        def categoryInstanceCount = Category.count()
//        respond Category.list(params), model:[categoryInstanceCount: Category.count()]

        render (view: "/admin/category/index", model: [categoryInstanceList: categoryInstanceList, categoryInstanceCount: categoryInstanceCount])
    }

    def show(Category categoryInstance) {
        render (view: "/admin/category/show", model: [categoryInstance: categoryInstance])
//        respond categoryInstance
    }

    def create() {
        render (view: "/admin/category/create", model: [categoryInstance: new Category(params)])
//        respond new Category(params)
    }

    @Transactional
    def save(Category categoryInstance) {
        if (categoryInstance == null) {
            notFound()
            return
        }

        if (categoryInstance.hasErrors()) {
            render (view: "/admin/category/create", model: [categoryInstance: categoryInstance])
//            respond categoryInstance.errors, view:'create'
            return
        }

        categoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])
                redirect categoryInstance
            }
            '*' { respond categoryInstance, [status: CREATED] }
        }
    }

    def edit(Category categoryInstance) {
        render (view: "/admin/category/create", model: [categoryInstance: categoryInstance])
//        respond categoryInstance
    }

    @Transactional
    def update(Category categoryInstance) {
        if (categoryInstance == null) {
            notFound()
            return
        }

        if (categoryInstance.hasErrors()) {
            render (view: "/admin/category/edit", model: [categoryInstance: categoryInstance])
//            respond categoryInstance.errors, view:'edit'
            return
        }

        categoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Category.label', default: 'Category'), categoryInstance.id])
                redirect categoryInstance
            }
            '*'{ respond categoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Category categoryInstance) {

        if (categoryInstance == null) {
            notFound()
            return
        }

        categoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Category.label', default: 'Category'), categoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
