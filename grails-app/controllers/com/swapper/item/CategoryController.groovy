package com.swapper.item

class CategoryController {

    def categoryService

    def subcategories(){
        log.error params

        def categories = categoryService.getSubCategories(params.id?.toLong(),params)
        log.error categories?.size()
        render(template: "categoriesDropdown", model: [categories: categories])
    }
}
