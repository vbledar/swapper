package com.swapper.item

import com.swapper.BaseController
import com.swapper.user.Person

class ItemController extends BaseController {

    def viewItem() {
        Item item = Item.findById(params.id)
        if (!item) {
            // TODO find the best way to return on previous page
        }

        Person person = getLoggedInUserFromDatabase()
        if (!person) {
            // TODO find the best way to return on previous page
        }

        // item belongs to current user so we redirect him to
        // item management page
        if (item?.person?.socialNetworkId == person?.id) {
            redirect(controller: "swapShop", action: "viewItem", params: params)
            return
        } else {
            render (view: '/item/show/itemOverview', model: [item: item])
        }
    }
}
